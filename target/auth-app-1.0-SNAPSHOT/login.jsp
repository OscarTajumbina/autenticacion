<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión | Rock Legends</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;

            background: linear-gradient(135deg, #cdd6ff 0%, #e6dfff 50%, #ffffff 100%);
            background-size: 300% 300%;
            animation: gradientMove 10s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        header {
            background: linear-gradient(90deg, #5b65ff, #8a63ff);
            color: white;
            text-align: center;
            padding: 28px 0;
            box-shadow: 0 3px 15px rgba(0,0,0,0.25);
        }

        header h1 {
            font-size: 2.3rem;
            font-weight: 700;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .login-box {
            background: rgba(255,255,255,0.85);
            backdrop-filter: blur(12px);
            border-radius: 18px;
            padding: 40px;
            width: 430px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            border-top: 4px solid #6f5aff;
        }

        .login-box h2 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 25px;
            color: #5b54ff;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 12px;
            border: 1px solid #c9c7ff;
            padding: 12px;
            background: #f3f2ff;
        }

        .form-control:focus {
            border-color: #7a6dff;
            box-shadow: 0 0 8px rgba(103, 90, 255, 0.4);
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 38%;
            cursor: pointer;
            color: #666;
            font-weight: 500;
        }

        .toggle-password:hover {
            color: #5b54ff;
        }

        .btn-login {
            background: linear-gradient(90deg, #6f5aff, #4d5eff);
            border: none;
            width: 100%;
            padding: 12px;
            color: white;
            font-weight: 700;
            border-radius: 30px;
            transition: 0.3s;
            font-size: 1rem;
        }

        .btn-login:hover {
            transform: scale(1.04);
            background: linear-gradient(90deg, #5e4ff4, #374cff);
        }

        a {
            color: #5f55ff;
            text-decoration: none;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            margin-top: auto;
            background-color: rgba(255,255,255,0.7);
            padding: 12px;
            text-align: center;
            color: #555;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<header>
    <h1>🎸 Rock Legends</h1>
</header>

<main>
    <div class="login-box">

        <h2>Iniciar Sesión</h2>

        <form action="<%=request.getContextPath()%>/login" method="post">

            <div class="mb-3">
                <label class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" name="email" required placeholder="usuario@correo.com">
            </div>

            <div class="mb-3 password-wrapper">
                <label class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="********">
                <span class="toggle-password" onclick="togglePass()">Mostrar</span>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <button type="submit" class="btn-login mt-3">Entrar</button>

            <p class="text-center mt-3">
                ¿No tienes cuenta?
                <a href="<%=request.getContextPath()%>/register.jsp">Regístrate aquí</a>
            </p>
        </form>

    </div>
</main>

<footer>
    <jsp:include page="/footer.jsp"/>
</footer>

<script>
    function togglePass() {
        const pass = document.getElementById("password");
        const toggle = document.querySelector(".toggle-password");
        if (pass.type === "password") {
            pass.type = "text";
            toggle.textContent = "Ocultar";
        } else {
            pass.type = "password";
            toggle.textContent = "Mostrar";
        }
    }
</script>

</body>
</html>
