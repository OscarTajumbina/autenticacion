<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.miapp.auth.model.User" %>
<%
    // Usuario de la sesión (puede ser null)
    User user = (User) session.getAttribute("user");

    // roleId: 1=ADMIN, 2=COORDINADOR, 3=FAN
    Integer roleId = null;
    String username = null;
    if (user != null) {
        roleId = user.getRoleId();      // usa getRoleId()
        username = user.getUsername();  // usa getUsername()
    }
%>

<nav style="background:#0d6efd; padding:10px 18px; color:white; display:flex; justify-content:space-between; align-items:center; font-family:Segoe UI,Arial,sans-serif;">
    <div style="display:flex; align-items:center; gap:18px;">
        <a href="<%= request.getContextPath() %>/home.jsp" style="color:white; text-decoration:none; font-weight:700;">🎸 Rock Legends</a>

        <%-- Mostrar "Comunidades" sólo para Admin y Coordinador --%>
        <% if (roleId != null && (roleId == 1 || roleId == 2)) { %>
            <a href="<%= request.getContextPath() %>/community/manage.jsp" style="color:white; text-decoration:none;">Comunidades</a>
        <% } %>

        <%-- El enlace al selector de foros siempre está disponible (los fans pueden ver foros) --%>
        <a href="<%= request.getContextPath() %>/community/selectCommunity.jsp" style="color:white; text-decoration:none;">Foros</a>

        <%-- Admin extra: panel admin --%>
        <% if (roleId != null && roleId == 1) { %>
            <a href="<%= request.getContextPath() %>/admin/dashboard_admin.jsp" style="color:white; text-decoration:none;">Panel Admin</a>
        <% } %>
    </div>

    <div style="display:flex; align-items:center; gap:14px;">
        <% if (user != null) { %>
            <span style="opacity:0.95;">👤 <%= username %> <%-- no mostrar nombre, mostramos username --%></span>
            <a href="<%= request.getContextPath() %>/logout" style="color:#ffdddd; text-decoration:none; padding:6px 10px; border-radius:6px; background:rgba(0,0,0,0.08);">Cerrar sesión</a>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/login.jsp" style="color:white; text-decoration:none;">Iniciar sesión</a>
        <% } %>
    </div>
</nav>

<style>
    nav a:hover { text-decoration:underline; }
</style>
