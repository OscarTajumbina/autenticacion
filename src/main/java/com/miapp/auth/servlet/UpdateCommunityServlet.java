package com.miapp.auth.servlet;

import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/updateCommunity")
public class UpdateCommunityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");

        if (id == null || nombre == null || nombre.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp");
            return;
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE comunidades SET nombre = ?, descripcion = ? WHERE id = ?")) {

            ps.setString(1, nombre.trim());
            ps.setString(2, descripcion != null ? descripcion.trim() : "");
            ps.setInt(3, Integer.parseInt(id));
            ps.executeUpdate();

            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp");
        }
    }
}
