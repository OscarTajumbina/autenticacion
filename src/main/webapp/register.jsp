<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - Rock Legends</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: radial-gradient(circle, #1a1a1a 60%, #000000 100%);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .register-box {
            background-color: rgba(20, 20, 20, 0.95);
            border: 2px solid #ff0000;
            padding: 40px;
            border-radius: 15px;
            width: 420px;
            box-shadow: 0 0 25px #ff0000;
        }

        .register-box h2 {
            color: #ff4d4d;
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-register {
            background-color: #ff4d4d;
            border: none;
            width: 100%;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-register:hover {
            background-color: #ff1a1a;
            transform: scale(1.05);
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

        a {
            color: #ff4d4d;
        }
    </style>
</head>
<body>

    <div class="register-box">
        <h2>🎤 Únete a Rock Legends</h2>

        <form action="<%=request.getContextPath()%>/register" method="post">

            <div class="mb-3">
                <label for="username" class="form-label">Nombre de usuario</label>
                <input type="text" class="form-control" id="username" name="username" required>
           </div>

            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
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

            <button type="submit" class="btn btn-register mt-2">Registrarme 🤘</button>

            <p class="text-center mt-3">
                ¿Ya tienes cuenta? <a href="<%=request.getContextPath()%>/login.jsp">Inicia Sesión</a>
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
