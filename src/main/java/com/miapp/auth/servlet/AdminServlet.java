package com.miapp.auth.servlet;

import com.miapp.auth.dao.RoleDAO;
import com.miapp.auth.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        RoleDAO rdao = new RoleDAO();
        req.setAttribute("roles", rdao.listAll());

        // ✅ El dashboard ahora está afuera (no dentro de /admin/)
        resp.sendRedirect(req.getContextPath() + "/admin/manageRoles.jsp");

    }
}
