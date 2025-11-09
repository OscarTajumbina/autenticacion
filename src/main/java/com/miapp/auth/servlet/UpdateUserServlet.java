package com.miapp.auth.servlet;

import com.miapp.auth.dao.UserDAO;
import com.miapp.auth.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String roleIdStr = req.getParameter("roleId");

        if (idStr == null || username == null || email == null || roleIdStr == null ||
            idStr.isEmpty() || username.isEmpty() || email.isEmpty() || roleIdStr.isEmpty()) {

            req.getSession().setAttribute("error", "⚠️ Todos los campos son obligatorios para actualizar el usuario.");
            resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            int roleId = Integer.parseInt(roleIdStr);

            UserDAO dao = new UserDAO();
            User user = new User(id, username, email, password, roleId);
            dao.update(user);

            req.getSession().setAttribute("success", "✅ Usuario actualizado correctamente.");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "❌ Error al actualizar el usuario: " + e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
    }
}
