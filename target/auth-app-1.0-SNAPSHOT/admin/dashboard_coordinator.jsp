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
    <title>Panel del Coordinador | Rock Legends 🎶</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #480ca8, #000000);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
        }

        .rock-card {
            background: rgba(0, 0, 0, 0.75);
            border: 2px solid #4cc9f0;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(76, 201, 240, 0.5);
            max-width: 850px;
            padding: 50px 40px;
            animation: fadeIn 1s ease-in-out;
        }

        .section-title {
            font-size: 1.3rem;
            color: #4cc9f0;
            margin-top: 25px;
            margin-bottom: 10px;
            text-shadow: 0 0 12px #4895ef;
            font-weight: 600;
        }

        .idea-box {
            background: rgba(76, 201, 240, 0.1);
            border-left: 4px solid #4cc9f0;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 8px;
        }

        .band-table {
            background: rgba(255,255,255,0.05);
            border-radius: 10px;
            overflow: hidden;
            margin-top: 15px;
        }

        .band-table th {
            background: #4cc9f0;
            color: #000;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0,0,0,0.85);
            border-top: 1px solid #4cc9f0;
            color: #bde0fe;
        }

        .btn-blue {
            background-color: #4cc9f0;
            border: none;
            color: #000;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-blue:hover {
            background-color: #4895ef;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(72,149,239,0.5);
        }

        .btn-outline-light {
            border: 2px solid #bde0fe;
            color: #bde0fe;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
        }

        .btn-outline-light:hover {
            background: #bde0fe;
            color: #000;
        }

        .btn-outline-danger:hover {
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<main>
    <div class="rock-card">

        <h1>🧭 ¡Hola, <%= user.getUsername() %>!</h1>
        <h3>Panel del Coordinador</h3>
        <p>
            Aquí puedes organizar la comunidad, generar ideas de contenido y mantener vivo el espíritu del rock.
        </p>

        <!-- SECCIÓN: Ideas para contenido -->
        <h4 class="section-title">💡 Ideas de Contenido para la Comunidad</h4>

        <div class="idea-box">🎤 Crear encuestas semanales sobre bandas icónicas.</div>
        <div class="idea-box">🔥 Publicar curiosidades diarias sobre álbumes legendarios.</div>
        <div class="idea-box">🤘 Organizar debates sobre los mejores solos de guitarra.</div>
        <div class="idea-box">🎧 Recomendar playlists temáticas (rock clásico, metal, punk). </div>

        <!-- SECCIÓN: Lista de bandas famosas -->
        <h4 class="section-title">🎸 Bandas Famosas para Destacar</h4>

        <table class="table band-table text-white table-striped">
            <thead>
                <tr>
                    <th>Banda</th>
                    <th>Género</th>
                    <th>Año de Formación</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>Metallica</td><td>Thrash Metal</td><td>1981</td></tr>
                <tr><td>Queen</td><td>Rock</td><td>1970</td></tr>
                <tr><td>AC/DC</td><td>Hard Rock</td><td>1973</td></tr>
                <tr><td>Nirvana</td><td>Grunge</td><td>1987</td></tr>
            </tbody>
        </table>

        <!-- BOTONES -->
        <div class="d-flex justify-content-center gap-4 mt-4 flex-wrap">
            <a href="${pageContext.request.contextPath}/community/manage.jsp" class="btn btn-blue btn-lg">
                🎸 Administrar Comunidad
            </a>
            <a href="${pageContext.request.contextPath}/community/forum.jsp" class="btn btn-outline-light btn-lg">
                💬 Foro & Mensajes
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-lg">
                🚪 Cerrar Sesión
            </a>
        </div>

    </div>
</main>

<footer>
    © 2025 Rock Legends — Creando ideas y manteniendo la llama del rock 🔥
</footer>

</body>
</html>
