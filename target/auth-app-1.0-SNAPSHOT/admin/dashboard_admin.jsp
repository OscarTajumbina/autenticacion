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
            background: linear-gradient(135deg, #3a0ca3, #000000);
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
            background: rgba(0, 0, 0, 0.8);
            border: 2px solid #b5179e;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(181, 23, 158, 0.7);
            max-width: 650px;
            padding: 50px 40px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .rock-card h1 {
            color: #f72585;
            font-weight: 700;
            text-shadow: 0 0 20px #b5179e;
            margin-bottom: 15px;
        }

        .rock-card h3 {
            color: #b5179e;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .rock-card p {
            color: #e0c3fc;
            font-size: 1rem;
            margin-bottom: 40px;
        }

        .btn-rock {
            background-color: #b5179e;
            border: none;
            color: #fff;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 10px;
            transition: all 0.3s;
        }

        .btn-rock:hover {
            background-color: #7209b7;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(247, 37, 133, 0.5);
        }

        .btn-outline-light {
            border: 2px solid #e0c3fc;
            color: #e0c3fc;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-outline-light:hover {
            background: #e0c3fc;
            color: #000;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(224, 195, 252, 0.5);
        }

        .btn-outline-danger {
            border: 2px solid #ff4d6d;
            color: #ff4d6d;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-outline-danger:hover {
            background: #ff4d6d;
            color: #fff;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 77, 109, 0.5);
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0,0,0,0.85);
            border-top: 1px solid #b5179e;
            color: #f5c2e7;
            font-size: 14px;
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
            <h1>👑 ¡Bienvenido, <%= user.getUsername() %>!</h1>
            <h3>Panel del Administrador</h3>
            <p>
                Domina el escenario. Desde aquí controlas usuarios, roles y toda la comunidad de Rock Legends.
            </p>

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
        </div>
    </main>

    <footer>
        © 2025 Rock Legends — Donde el poder del rock nunca muere 🤘
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
