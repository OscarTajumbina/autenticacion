package com.miapp.auth.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Cerrar sesión de forma segura
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // Destruye la sesión
        }

        // Evita que el usuario use el botón "Atrás" del navegador
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0
        resp.setDateHeader("Expires", 0); // Proxies

        // Redirigir al login.jsp
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
