package com.miapp.auth.servlet;

import com.miapp.auth.dao.UserDAO;
import com.miapp.auth.model.User;
import com.miapp.auth.util.DBUtil;
import com.miapp.auth.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Validar campos vacíos
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "⚠️ Todos los campos son obligatorios");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        UserDAO dao = new UserDAO();
        User u = dao.findByEmail(email);

        if (u == null) {
            req.setAttribute("error", "⚠️ Usuario no encontrado");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        // Validar contraseña
        String hashed = PasswordUtil.hashSHA256(password);
        if (!hashed.equals(u.getPassword())) {
            req.setAttribute("error", "❌ Contraseña incorrecta");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        // Guardar sesión
        HttpSession session = req.getSession(true);
        session.setAttribute("user", u);

        // Registrar acción en el log (opcional)
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO audit_log (user_id, action, ip) VALUES (?, ?, ?)")) {
            ps.setInt(1, u.getId());
            ps.setString(2, "LOGIN");
            ps.setString(3, req.getRemoteAddr());
            ps.executeUpdate();
        } catch (Exception ignored) {}

        // ✅ Redirigir según el rol
        switch (u.getRoleId()) {
            case 1: // ADMIN
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard_admin.jsp");
                break;

            case 2: // COORDINADOR
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard_coordinator.jsp");
                break;

            case 3: // FAN
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard_fan.jsp");
                break;

            default:
                resp.sendRedirect(req.getContextPath() + "/login.jsp?error=rolDesconocido");
                break;
        }
    }
}
