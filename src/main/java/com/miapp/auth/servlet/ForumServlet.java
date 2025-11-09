package com.miapp.auth.servlet;

import com.miapp.auth.dao.ForumDAO;
import com.miapp.auth.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/forum")
public class ForumServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String comunidadParam = req.getParameter("comunidadId");
        String titulo = req.getParameter("titulo");
        String contenido = req.getParameter("contenido");

        if (comunidadParam == null || comunidadParam.isEmpty() || titulo == null || contenido == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros");
            return;
        }

        int comunidadId;
        try {
            comunidadId = Integer.parseInt(comunidadParam);
        } catch (NumberFormatException ex) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de comunidad inválido");
            return;
        }

        // Llamada al DAO (coincide con la firma del DAO anterior)
        ForumDAO dao = new ForumDAO();
        dao.create(comunidadId, user.getId(), titulo, contenido);

        resp.sendRedirect(req.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);
    }
}
