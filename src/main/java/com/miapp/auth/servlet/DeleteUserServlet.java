package com.miapp.auth.servlet;

import com.miapp.auth.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            req.getSession().setAttribute("error", "⚠️ Debes especificar el ID del usuario a eliminar.");
            resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
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
