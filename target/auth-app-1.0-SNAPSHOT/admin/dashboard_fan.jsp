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
    <title>Zona del Fan - Rock Legends</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #000000, #7209b7);
            color: #fff;
            min-height: 100vh;
            background-attachment: fixed;
            font-family: 'Segoe UI', sans-serif;
        }
        .fan-card {
            background: rgba(0,0,0,0.85);
            border: 2px solid #f72585;
            border-radius: 20px;
            box-shadow: 0 0 25px #b5179e;
        }
        .btn-pink {
            background-color: #f72585;
            border: none;
            transition: 0.3s;
        }
        .btn-pink:hover {
            background-color: #b5179e;
            box-shadow: 0 0 10px #f72585;
        }
        .btn-logout {
            border: 1px solid #ff4d6d;
            color: #ff4d6d;
        }
        .btn-logout:hover {
            background-color: #ff4d6d;
            color: #fff;
            box-shadow: 0 0 10px #ff4d6d;
        }
        h1, h4 {
            text-shadow: 0 0 10px #f72585;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="card fan-card p-5 text-center">
        <h1 class="mb-4">🤘 ¡Bienvenido, <%= user.getUsername() %>!</h1>
        <h4 class="mb-4 text-light">Zona del Fan</h4>
        <p class="text-secondary mb-5">
            Disfruta de la energía del rock, conecta con otros fans y comparte tus pasiones en la comunidad.
        </p>

        <div class="d-flex justify-content-center gap-4 mt-4">
            <a href="${pageContext.request.contextPath}/community/forum.jsp" class="btn btn-pink btn-lg text-white">
                💬 Entrar al Foro
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout btn-lg">
                🚪 Cerrar Sesión
            </a>
        </div>
    </div>
</div>

</body>
</html>
