package com.miapp.auth.servlet;

import com.miapp.auth.dao.CommunityDAO;
import com.miapp.auth.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/community")
public class CommunityServlet extends HttpServlet {

    private final CommunityDAO dao = new CommunityDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        User user = (User) req.getSession().getAttribute("user");

        if (user == null || user.getRoleId() != 2) { // Solo coordinador
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Solo coordinadores pueden gestionar comunidades");
            return;
        }

        try {
            switch (action) {
    case "create":
        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");
        dao.create(nombre, descripcion, user.getId());
        break;

    case "update":
        int idUpdate = Integer.parseInt(req.getParameter("id"));
        String nuevoNombre = req.getParameter("nombre");
        String nuevaDescripcion = req.getParameter("descripcion");
        dao.update(idUpdate, nuevoNombre, nuevaDescripcion);
        break;

    case "delete":
        int idDelete = Integer.parseInt(req.getParameter("id"));
        dao.delete(idDelete);
        break;

    default:
        throw new IllegalArgumentException("Acción no válida");
}

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirigir de nuevo al panel
        resp.sendRedirect(req.getContextPath() + "/community/manage.jsp");
    }
}
