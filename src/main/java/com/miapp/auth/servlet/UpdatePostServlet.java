package com.miapp.auth.servlet;

import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/updatePost")
public class UpdatePostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String titulo = req.getParameter("titulo");
        String contenido = req.getParameter("contenido");
        String comunidadId = req.getParameter("comunidadId");

        if (id == null || titulo == null || titulo.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/forum.jsp?comunidadId=" + comunidadId);
            return;
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE publicaciones SET titulo = ?, contenido = ? WHERE id = ?")) {

            ps.setString(1, titulo.trim());
            ps.setString(2, contenido.trim());
            ps.setInt(3, Integer.parseInt(id));
            ps.executeUpdate();

            resp.sendRedirect(req.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);
        }
    }
}
