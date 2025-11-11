package com.miapp.auth.servlet;

import com.miapp.auth.dao.CommunityDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateCommunity")
public class UpdateCommunityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Obtener parámetros del formulario
        String idStr = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");

        // Validación básica
        if (idStr == null || nombre == null || nombre.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=campos");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

            // Lógica DAO
            CommunityDAO dao = new CommunityDAO();
            boolean actualizado = dao.update(id, nombre.trim(), descripcion != null ? descripcion.trim() : "");

            if (actualizado) {
                System.out.println("✅ Comunidad actualizada correctamente (ID: " + id + ")");
                resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?success=update");
            } else {
                System.err.println("⚠️ No se pudo actualizar la comunidad con ID: " + id);
                resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=update");
            }

        } catch (NumberFormatException e) {
            System.err.println("❌ ID de comunidad inválido: " + idStr);
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=id");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/community/manage.jsp?error=exception");
        }
    }
}
