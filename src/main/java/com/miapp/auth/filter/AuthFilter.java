package com.miapp.auth.filter;

import com.miapp.auth.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI();
        String contextPath = req.getContextPath();

        // 🔹 Páginas públicas
        if (path.startsWith(contextPath + "/login.jsp") ||
            path.startsWith(contextPath + "/register.jsp") ||
            path.startsWith(contextPath + "/index.jsp") ||
            path.startsWith(contextPath + "/css/") ||
            path.startsWith(contextPath + "/js/") ||
            path.startsWith(contextPath + "/images/") ||
            path.endsWith("/login") ||
            path.endsWith("/register")) {
            chain.doFilter(request, response);
            return;
        }

        // 🔹 Sesión activa
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null) {
            resp.sendRedirect(contextPath + "/login.jsp");
            return;
        }

        int roleId = user.getRoleId();

        // 🔹 Control por área (ADMIN, COORDINADOR, FAN)
        if (path.startsWith(contextPath + "/admin/dashboard_admin.jsp") && roleId != 1) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "No autorizado: solo ADMIN");
            return;
        }
        if (path.startsWith(contextPath + "/admin/dashboard_coordinator.jsp") && roleId != 2) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "No autorizado: solo COORDINADOR");
            return;
        }
        if (path.startsWith(contextPath + "/admin/dashboard_fan.jsp") && roleId != 3) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "No autorizado: solo FAN");
            return;
        }

        chain.doFilter(request, response);
    }
}
