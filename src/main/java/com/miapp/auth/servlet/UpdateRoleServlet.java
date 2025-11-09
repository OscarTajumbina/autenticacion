package com.miapp.auth.servlet;

import com.miapp.auth.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/updateRole")
public class UpdateRoleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");
        String roleStr = req.getParameter("roleId");  // ✅ Coincide con el JSP

        if (idStr == null || roleStr == null || idStr.isEmpty() || roleStr.isEmpty()) {
            System.out.println("⚠️ Faltan datos del formulario (id o roleId).");
            resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            int roleId = Integer.parseInt(roleStr);

            // ✅ try-with-resources evita fugas de conexión
            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement stmt =
                         conn.prepareStatement("UPDATE users SET role_id=? WHERE id=?")) {

                stmt.setInt(1, roleId);
                stmt.setInt(2, id);

                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    System.out.println("✅ Rol actualizado correctamente: user=" + id + ", nuevo rol=" + roleId);
                } else {
                    System.out.println("⚠️ No existe usuario con ID " + id);
                }
            }

        } catch (NumberFormatException e) {
            System.out.println("❌ El ID o roleId no son números válidos.");
        } catch (Exception e) {
            System.out.println("❌ Error al actualizar rol:");
            e.printStackTrace();
        }

        // ✅ Siempre regresa al panel
        resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
    }
}
