<jsp:include page="/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.miapp.auth.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel del Administrador - Rock Legends</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a1a, #3a0ca3);
            color: #fff;
            min-height: 100vh;
            background-attachment: fixed;
        }
        .rock-card {
            background: rgba(0,0,0,0.8);
            border: 2px solid #b5179e;
            border-radius: 20px;
            box-shadow: 0 0 25px #b5179e;
        }
        .btn-rock {
            background-color: #b5179e;
            border: none;
            transition: 0.3s;
        }
        .btn-rock:hover {
            background-color: #7209b7;
            box-shadow: 0 0 10px #f72585;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="card rock-card text-center p-5">
        <h1 class="mb-3">👑 Bienvenido, <%= user.getUsername() %>!</h1>
        <h3 class="mb-4">Panel del Administrador</h3>
        <p class="lead">Domina el escenario. Desde aquí controlas roles, usuarios y la comunidad completa.</p>

        <div class="d-flex justify-content-center gap-4 mt-4 flex-wrap">
            <a href="${pageContext.request.contextPath}/admin/manageRoles.jsp" class="btn btn-rock btn-lg">
                ⚙️ Gestionar Roles
            </a>
            <a href="${pageContext.request.contextPath}/community/manage.jsp" class="btn btn-outline-light btn-lg">
                🎸 Comunidad
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-lg">
                🚪 Cerrar Sesión
            </a>
        </div>
    </div>
</div>

</body>
</html>
