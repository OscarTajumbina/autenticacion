package com.miapp.auth.servlet;

import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deleteCommunity")
public class DeleteCommunityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        // Validar el parámetro
        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=missingId");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            // Ejecutar eliminación
            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement("DELETE FROM comunidades WHERE id = ?")) {

                ps.setInt(1, id);
                int filas = ps.executeUpdate();

                if (filas > 0) {
                    System.out.println("✅ Comunidad eliminada correctamente (ID: " + id + ")");
                    resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?success=deleted");
                } else {
                    System.err.println("⚠️ No se encontró la comunidad con ID: " + id);
                    resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=notfound");
                }

            }

        } catch (NumberFormatException e) {
            System.err.println("❌ ID inválido: " + idParam);
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=invalidId");

        } catch (SQLException e) {
            System.err.println("❌ Error al eliminar comunidad: " + e.getMessage());
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=db");
        }
    }
}
