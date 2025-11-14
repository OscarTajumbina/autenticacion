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
    <title>Panel del Administrador | Rock Legends 👑</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #240046, #000000 70%);
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
            background: rgba(0, 0, 0, 0.7);
            border: 2px solid #ff00b8;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(255, 0, 184, 0.6);
            width: 95%;
            max-width: 900px;
            padding: 50px 40px;
            animation: fadeIn 0.9s ease-in-out;
        }

        .rock-card h1 {
            color: #ff00e6;
            font-weight: 800;
            text-shadow: 0 0 25px #ff00e6;
        }

        .rock-card h3 {
            color: #ff4dff;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .btn-rock {
            background-color: #ff009d;
            border: none;
            color: #fff;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-rock:hover {
            background-color: #d60080;
            transform: scale(1.05);
            box-shadow: 0 0 18px #ff009d;
        }

        .btn-outline-light,
        .btn-outline-danger {
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-outline-light:hover {
            background: #fff;
            color: #000;
            transform: scale(1.05);
        }

        .btn-outline-danger:hover {
            background: #ff4d6d;
            color: #fff;
            transform: scale(1.05);
        }

        /* --- GRÁFICOS --- */

        .charts-section {
            margin-top: 40px;
        }

        .chart-card {
            background: rgba(30, 0, 40, 0.8);
            border: 2px solid #a100f2;
            box-shadow: 0 0 20px rgba(161, 0, 242, 0.5);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
        }

        /* Gráfico de barras */
        .bar-title {
            font-weight: bold;
            margin-bottom: 10px;
            color: #ff87ff;
        }

        .bar {
            height: 20px;
            background: #3a0066;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 12px;
            border: 1px solid #ff00e6;
        }

        .bar-fill {
            height: 100%;
            background: linear-gradient(90deg, #ff00d4, #ff4dff);
            width: 0;
            animation: fillBar 2s forwards;
        }

        @keyframes fillBar {
            to { width: var(--target-width); }
        }

        /* Donut Chart */
        .donut-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .donut {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 15px solid #330044;
            border-top-color: #ff00e6;
            border-right-color: #c700ff;
            border-bottom-color: #9b00ea;
            border-left-color: #ff4dff;
            animation: rotateDonut 4s linear infinite;
        }

        @keyframes rotateDonut {
            100% { transform: rotate(360deg); }
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0,0,0,0.8);
            border-top: 1px solid #ff00d4;
            color: #ffd6fa;
            font-size: 14px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; }
        }
    </style>
</head>

<body>

<main>
    <div class="rock-card">

        <h1>👑 ¡Bienvenido, <%= user.getUsername() %>!</h1>
        <h3>Panel del Administrador</h3>

        <p class="mt-3">
            Controla usuarios, comunidades y el corazón de todo Rock Legends.<br>
            Esta es tu consola principal, cargada con poder, colores y energía rockera ⚡🤘.
        </p>

        <!-- Botones de acción -->
        <div class="d-flex justify-content-center gap-4 mt-4 flex-wrap">
            <a href="${pageContext.request.contextPath}/admin/manageRoles.jsp" class="btn btn-rock btn-lg">
                ⚙️ Gestionar Roles y Usuarios
            </a>
            <a href="${pageContext.request.contextPath}/community/manage.jsp" class="btn btn-outline-light btn-lg">
                🎸 Administrar Comunidad
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-lg">
                🚪 Cerrar Sesión
            </a>
        </div>

        <!-- Sección de gráficos -->
        <div class="charts-section">

            <!-- Gráfico de barras -->
            <div class="chart-card">
                <h4 class="bar-title">Actividad del Sistema (Simulación Visual)</h4>

                <div class="bar">
                    <div class="bar-fill" style="--target-width: 85%;"></div>
                </div>
                <small>Tráfico de usuarios</small>

                <div class="bar">
                    <div class="bar-fill" style="--target-width: 60%;"></div>
                </div>
                <small>Publicaciones recientes</small>

                <div class="bar">
                    <div class="bar-fill" style="--target-width: 40%;"></div>
                </div>
                <small>Moderación activa</small>
            </div>

            <!-- Gráfico donut -->
            <div class="chart-card text-center">
                <h4 class="fw-bold mb-3" style="color:#ea00ff;">Ciclo del Rock 🎵</h4>

                <div class="donut-container">
                    <div class="donut"></div>
                </div>

                <p class="mt-3">
                    Representación visual del ciclo constante de actividad, energía y vibración dentro de
                    la comunidad Rock Legends.
                </p>
            </div>

        </div>

    </div>
</main>

<footer>
    © 2025 Rock Legends — Donde el poder del rock nunca muere 🤘
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
