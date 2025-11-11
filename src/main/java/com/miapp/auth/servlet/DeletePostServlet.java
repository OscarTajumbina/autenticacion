package com.miapp.auth.servlet;

import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String comunidadId = req.getParameter("comunidadId");

        if (id == null) {
            resp.sendRedirect(req.getContextPath() + "/forum.jsp?comunidadId=" + comunidadId);
            return;
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM publicaciones WHERE id = ?")) {

            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            resp.sendRedirect(req.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);
        }
    }
}
