<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar en pagna - Rock Legends</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #000000, #1a1a1a);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .login-box {
            background-color: rgba(30, 30, 30, 0.95);
            border: 2px solid #ff0000;
            padding: 40px;
            border-radius: 15px;
            width: 380px;
            box-shadow: 0 0 20px #ff0000;
        }

        .login-box h2 {
            color: #ff4d4d;
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-login {
            background-color: #ff4d4d;
            border: none;
            width: 100%;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-login:hover {
            background-color: #ff1a1a;
            transform: scale(1.05);
        }

        a {
            color: #ff4d4d;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 35%;
            cursor: pointer;
            color: #ccc;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <h2>🎵 Inicia Sesión</h2>

        <form action="<%=request.getContextPath()%>/login" method="post">

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3 password-wrapper">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <span class="toggle-password" onclick="togglePass()">👁️</span>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <button type="submit" class="btn btn-login mt-2">Entrar 🤘</button>

            <p class="text-center mt-3">
                ¿No tienes cuenta? <a href="<%=request.getContextPath()%>/register.jsp">Regístrate</a>
            </p>
        </form>
    </div>

    <script>
        function togglePass() {
            let pass = document.getElementById("password");
            pass.type = pass.type === "password" ? "text" : "password";
        }
    </script>

</body>
</html>
