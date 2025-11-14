<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.miapp.auth.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    Integer roleId = null;
    String username = null;

    if (user != null) {
        roleId = user.getRoleId();
        username = user.getUsername();
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<nav class="navbar navbar-expand-lg neon-navbar">
    <div class="container-fluid">

        <a class="navbar-brand rock-logo" href="<%= request.getContextPath() %>/home.jsp">
            ⚡ ROCK LEGENDS ⚡
        </a>

        <button class="navbar-toggler neon-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <% if (roleId != null && (roleId == 1 || roleId == 2)) { %>
                <li class="nav-item">
                    <a class="nav-link neon-link" href="<%= request.getContextPath() %>/community/manage.jsp">
                        <i class="bi bi-people-fill"></i> Comunidades
                    </a>
                </li>
                <% } %>

                <li class="nav-item">
                    <a class="nav-link neon-link" href="<%= request.getContextPath() %>/community/selectCommunity.jsp">
                        <i class="bi bi-chat-dots-fill"></i> Foros
                    </a>
                </li>

                <% if (roleId != null && roleId == 1) { %>
                <li class="nav-item">
                    <a class="nav-link neon-link" href="<%= request.getContextPath() %>/admin/dashboard_admin.jsp">
                        <i class="bi bi-speedometer2"></i> Panel Admin
                    </a>
                </li>
                <% } %>

            </ul>

            <div class="d-flex align-items-center gap-3">

                <% if (user != null) { %>
                <span class="user-display">
                    <i class="bi bi-person-circle"></i> <%= username %>
                </span>

                <a href="<%= request.getContextPath() %>/logout" class="btn neon-btn">
                    Cerrar sesión
                </a>

                <% } else { %>

                <a href="<%= request.getContextPath() %>/login.jsp" class="btn neon-btn">
                    Iniciar sesión
                </a>

                <% } %>

            </div>
        </div>
    </div>
</nav>

<style>

    .neon-navbar {
        background: linear-gradient(90deg, #00ffbf, #8a00ff, #ff0080);
        padding: 14px 25px;
        box-shadow: 0 0 25px #00ffcc, 0 0 35px #ff00ff;
        border-bottom: 2px solid rgba(255, 255, 255, 0.3);
        backdrop-filter: blur(10px);
    }

    .rock-logo {
        font-size: 1.8rem;
        font-weight: 900;
        color: #fff !important;
        letter-spacing: 2px;
        text-shadow: 0 0 8px #ffffff, 0 0 20px #ff00ff;
        transition: 0.3s;
    }

    .rock-logo:hover {
        text-shadow: 0 0 12px #00ffe0, 0 0 28px #ff00ff;
        transform: scale(1.05);
    }

    .neon-link {
        color: #fff !important;
        font-weight: 600;
        margin-right: 20px;
        padding: 8px 12px;
        border-radius: 8px;
        transition: 0.3s;
        text-shadow: 0 0 6px #ffffff;
    }

    .neon-link:hover {
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 0 15px #ffffff;
        transform: translateY(-2px);
    }

    .user-display {
        color: #fff;
        font-weight: 600;
        text-shadow: 0 0 8px #ffffff;
    }

    .neon-btn {
        background: transparent;
        border: 2px solid #ffffff;
        color: #fff;
        font-weight: bold;
        padding: 6px 14px;
        border-radius: 8px;
        text-shadow: 0 0 10px white;
        transition: 0.3s;
    }

    .neon-btn:hover {
        background: #ffffff;
        color: #000;
        box-shadow: 0 0 20px #ffffff;
        transform: scale(1.05);
    }

    .neon-toggler {
        border-color: #fff !important;
        filter: drop-shadow(0 0 5px #fff);
    }

</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
