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
    <title>Panel del Coordinador - Rock Legends</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #000000, #480ca8);
            color: #fff;
            min-height: 100vh;
            background-attachment: fixed;
        }
        .rock-card {
            background: rgba(0,0,0,0.85);
            border: 2px solid #4cc9f0;
            border-radius: 20px;
            box-shadow: 0 0 25px #4cc9f0;
        }
        .btn-blue {
            background-color: #4cc9f0;
            border: none;
            transition: 0.3s;
        }
        .btn-blue:hover {
            background-color: #4895ef;
            box-shadow: 0 0 10px #4cc9f0;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="card rock-card text-center p-5">
        <h1 class="mb-3">🧭 ¡Hola, <%= user.getUsername() %>!</h1>
        <h3 class="mb-4">Panel del Coordinador</h3>
        <p class="lead">Administra la comunidad, conecta con los fans y mantiene el espíritu del rock vivo.</p>

        <div class="d-flex justify-content-center gap-4 mt-4 flex-wrap">
            <a href="${pageContext.request.contextPath}/community/manage.jsp" class="btn btn-blue btn-lg">
                🎤 Abrir Comunidad
            </a>
            <a href="${pageContext.request.contextPath}/community/forum.jsp" class="btn btn-outline-light btn-lg">
                💬 Foro & Mensajes
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-lg">
                🚪 Cerrar Sesión
            </a>
        </div>
    </div>
</div>

</body>
</html>
