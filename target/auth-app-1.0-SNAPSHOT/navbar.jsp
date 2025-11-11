<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.miapp.auth.model.User" %>
<%
    // Usuario de la sesión
    User user = (User) session.getAttribute("user");

    // roleId: 1=ADMIN, 2=COORDINADOR, 3=FAN
    Integer roleId = null;
    String username = null;
    if (user != null) {
        roleId = user.getRoleId();
        username = user.getUsername();
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark rock-navbar">
    <div class="container-fluid">
        <!-- Logo / Nombre -->
        <a class="navbar-brand fw-bold fs-4" href="<%= request.getContextPath() %>/home.jsp">
            Rock Legends
        </a>

        <!-- Botón colapsable móvil -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Enlaces -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <% if (roleId != null && (roleId == 1 || roleId == 2)) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/community/manage.jsp">Comunidades</a>
                    </li>
                <% } %>

                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/community/selectCommunity.jsp">Foros</a>
                </li>

                <% if (roleId != null && roleId == 1) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard_admin.jsp">Panel Admin</a>
                    </li>
                <% } %>
            </ul>

            <!-- Usuario / Sesión -->
            <div class="d-flex align-items-center gap-3">
                <% if (user != null) { %>
                    <span class="text-light small">
                        <i class="bi bi-person-circle"></i> <strong><%= username %></strong>
                    </span>
                    <a href="<%= request.getContextPath() %>/logout" class="btn btn-sm btn-outline-light logout-btn">
                        Cerrar sesión
                    </a>
                <% } else { %>
                    <a href="<%= request.getContextPath() %>/login.jsp" class="btn btn-sm btn-outline-light">
                        Iniciar sesión
                    </a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Iconos -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
    .rock-navbar {
        background: linear-gradient(90deg, #b30000 0%, #000000 100%);
        padding: 12px 24px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.4);
    }

    .rock-navbar .navbar-brand {
        letter-spacing: 1px;
        color: #fff !important;
        transition: 0.3s;
    }

    .rock-navbar .navbar-brand:hover {
        color: #ffcccc !important;
    }

    .rock-navbar .nav-link {
        color: #f5f5f5 !important;
        margin-right: 12px;
        transition: 0.3s;
        font-weight: 500;
    }

    .rock-navbar .nav-link:hover {
        color: #ffcccc !important;
    }

    .logout-btn {
        border-color: #ffcccc !important;
        color: #ffcccc !important;
    }

    .logout-btn:hover {
        background-color: #ffcccc !important;
        color: #000 !important;
    }

    @media (max-width: 768px) {
        .rock-navbar .navbar-brand {
            font-size: 1.4rem;
        }
    }
</style>
