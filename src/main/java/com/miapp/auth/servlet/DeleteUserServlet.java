package com.miapp.auth.servlet;

import com.miapp.auth.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    // ---- NUEVO: aceptar GET para evitar METHOD NOT ALLOWED ----
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        processRequest(req, resp);
    }

    // ---- POST normal ----
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        processRequest(req, resp);
    }

    // ---- LÓGICA UNIFICADA ----
    private void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String idStr = req.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            req.getSession().setAttribute("error", "⚠️ Debes especificar el ID del usuario a eliminar.");
            resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            System.out.println(">>> DELETEUSER SERVLET EJECUTADO PARA ID = " + id);

            UserDAO dao = new UserDAO();
            dao.delete(id);

            req.getSession().setAttribute("success", "✅ Usuario eliminado correctamente.");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "❌ Error al eliminar usuario: " + e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
    }
}
