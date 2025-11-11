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
    <title>Zona del Fan | Rock Legends 🤘</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff4d4d, #1a1a1a);
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

        .fan-card {
            background: rgba(0, 0, 0, 0.75);
            border: 2px solid #ff4d4d;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(255, 0, 0, 0.3);
            max-width: 600px;
            padding: 50px 40px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .fan-card h1 {
            font-weight: 700;
            color: #ffcccc;
            text-shadow: 0 0 20px #ff0000;
            margin-bottom: 20px;
        }

        .fan-card h4 {
            color: #ff8080;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .fan-card p {
            color: #ddd;
            font-size: 1rem;
            margin-bottom: 40px;
        }

        .btn-fan {
            background-color: #ff4d4d;
            border: none;
            color: #fff;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 10px;
            transition: all 0.3s;
        }

        .btn-fan:hover {
            background-color: #ff1a1a;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.4);
        }

        .btn-logout {
            background: transparent;
            border: 2px solid #ff8080;
            color: #ff8080;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            background: #ff8080;
            color: #fff;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 128, 128, 0.4);
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0,0,0,0.85);
            border-top: 1px solid #ff4d4d;
            color: #ccc;
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
        <div class="fan-card">
            <h1>🤘 ¡Bienvenido, <%= user.getUsername() %>!</h1>
            <h4>Zona del Fan</h4>
            <p>
                Vive la experiencia Rock Legends — comparte tu pasión, comenta en los foros y mantente al ritmo del rock.
            </p>

            <div class="d-flex justify-content-center gap-4 mt-4 flex-wrap">
                <a href="${pageContext.request.contextPath}/community/forum.jsp" class="btn btn-fan btn-lg">
                    💬 Entrar al Foro
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout btn-lg">
                    🚪 Cerrar Sesión
                </a>
            </div>
        </div>
    </main>

    <footer>
        © 2025 Rock Legends — Donde el sonido nunca muere 🤘
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
