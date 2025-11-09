package com.miapp.auth.servlet;

import com.miapp.auth.model.User;
import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/createCommunity")
public class CreateCommunityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        if (nombre == null || nombre.trim().isEmpty()) {
            req.setAttribute("error", "⚠️ El nombre no puede estar vacío.");
            req.getRequestDispatcher("/community/manage.jsp").forward(req, resp);
            return;
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO comunidades (nombre, descripcion, creada_por) VALUES (?, ?, ?)")) {

            ps.setString(1, nombre.trim());
            ps.setString(2, descripcion != null ? descripcion.trim() : "");
            ps.setInt(3, user.getId());
            ps.executeUpdate();

            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "❌ Error al crear la comunidad: " + e.getMessage());
            req.getRequestDispatcher("/community/manage.jsp").forward(req, resp);
        }
    }
}
