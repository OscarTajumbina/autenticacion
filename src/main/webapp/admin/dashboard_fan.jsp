<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.miapp.auth.model.User" %>
<jsp:include page="/navbar.jsp" />

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
    <title>Rock Legends | Zona Fan 🔥🎧</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: radial-gradient(circle, #03045e, #000);
            color: #fff;
            font-family: 'Poppins';
        }

        .fan-title {
            text-align: center;
            margin-top: 20px;
            font-size: 3rem;
            font-weight: 900;
            color: #4cc9f0;
            text-shadow: 0 0 15px #4895ef;
        }

        .fan-card {
            background: rgba(0,0,0,0.6);
            border: 2px solid #4cc9f0;
            padding: 35px;
            border-radius: 18px;
            transition: .3s;
        }

        .fan-card:hover {
            transform: scale(1.03);
            box-shadow: 0 0 20px #4895ef;
        }

        .btn-fan {
            background: #4cc9f0;
            border: none;
            color: #000;
            font-weight: bold;
            padding: 10px 25px;
            border-radius: 10px;
        }

        .btn-fan:hover {
            background: #4895ef;
            color: #fff;
        }

        .logout-btn {
            border: 2px solid #4cc9f0 !important;
            color: #4cc9f0 !important;
        }
        .logout-btn:hover {
            background: #4cc9f0 !important;
            color: #000 !important;
        }

        .section-title {
            font-size: 1.4rem;
            margin-top: 30px;
            color: #bde0fe;
            text-shadow: 0 0 10px #4cc9f0;
            font-weight: bold;
        }

        .rule-box {
            background: rgba(76, 201, 240, 0.07);
            border-left: 4px solid #4cc9f0;
            padding: 10px 15px;
            margin-bottom: 8px;
            border-radius: 8px;
        }

        .band-table {
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            background: rgba(255,255,255,0.05);
        }

        .band-table th {
            background: #4cc9f0;
            color: #000;
        }
    </style>
</head>

<body>

<h1 class="fan-title">🎧 Zona del Fan — Rock Legends</h1>

<div class="container mt-4">
    <div class="fan-card text-center">
        <h3>¡Bienvenido, <%= user.getUsername() %>! 🤘</h3>
        <p>
            Aquí podrás comentar, descubrir bandas, unirte a conversaciones y formar parte del corazón de la comunidad rockera.
        </p>

        <a href="${pageContext.request.contextPath}/community/forum.jsp" class="btn-fan btn-lg mb-3">
            💬 Entrar al Foro
        </a>

        <!-- Reglas -->
        <h4 class="section-title">⚠️ Reglas de Contenido</h4>
        <div class="rule-box">❌ Nada de insultos ni lenguaje ofensivo.</div>
        <div class="rule-box">❌ Nada de contenido explícito o inapropiado.</div>
        <div class="rule-box">❌ No spam o publicaciones repetitivas.</div>
        <div class="rule-box">✔ Comparte contenido útil, respetuoso y rockero 🎸.</div>

        <!-- Restricciones -->
        <h4 class="section-title">🔒 Restricciones del Rol Fan</h4>
        <div class="rule-box">• No puede editar usuarios.</div>
        <div class="rule-box">• No puede gestionar comunidades.</div>
        <div class="rule-box">• No puede asignar roles.</div>
        <div class="rule-box">• Sí puede publicar, comentar y reaccionar.</div>

        <!-- Tabla -->
        <h4 class="section-title">🎵 Bandas Recomendadas</h4>
        <table class="table band-table text-white table-striped">
            <thead>
                <tr>
                    <th>Banda</th>
                    <th>Género</th>
                    <th>Álbum Destacado</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>Guns N’ Roses</td><td>Hard Rock</td><td>Appetite for Destruction</td></tr>
                <tr><td>AC/DC</td><td>Rock</td><td>Back in Black</td></tr>
                <tr><td>Metallica</td><td>Thrash Metal</td><td>Master of Puppets</td></tr>
                <tr><td>Iron Maiden</td><td>Heavy Metal</td><td>Powerslave</td></tr>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/logout" class="btn logout-btn btn-lg mt-4">
            🚪 Cerrar Sesión
        </a>
    </div>
</div>

</body>
</html>
