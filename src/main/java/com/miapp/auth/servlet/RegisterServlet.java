package com.miapp.auth.servlet;

import com.miapp.auth.dao.UserDAO;
import com.miapp.auth.model.User;
import com.miapp.auth.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (username == null || email == null || password == null ||
            username.isEmpty() || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "⚠️ Todos los campos son obligatorios.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        UserDAO dao = new UserDAO();

        // Evitar correos repetidos
        if (dao.findByEmail(email) != null) {
            req.setAttribute("error", "⚠️ El correo ya está registrado.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        // Hashear la contraseña
        String hashed = PasswordUtil.hashSHA256(password);

        // Asignar automáticamente el rol "FAN" (id = 3)
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(hashed);
        user.setRoleId(3); // FAN por defecto

        try {
            dao.insert(user);
            req.getSession().setAttribute("success", "✅ Registro exitoso, ahora puedes iniciar sesión.");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "❌ Error al registrar usuario: " + e.getMessage());
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
