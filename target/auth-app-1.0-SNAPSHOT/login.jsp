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
            background: linear-gradient(135deg, #f4f4f4 0%, #ffffff 100%);
            font-family: 'Poppins', sans-serif;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #b30000;
            color: white;
            text-align: center;
            padding: 25px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: 1px;
            margin: 0;
        }

        header p {
            margin: 5px 0 0;
            font-size: 1.1rem;
            opacity: 0.9;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .login-box {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 40px;
            width: 400px;
            transition: transform 0.2s;
        }

        .login-box:hover {
            transform: scale(1.02);
        }

        .login-box h2 {
            color: #b30000;
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #b30000;
            box-shadow: 0 0 8px rgba(179, 0, 0, 0.3);
        }

        .btn-login {
            background-color: #b30000;
            border: none;
            width: 100%;
            color: white;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px;
            transition: 0.3s;
        }

        .btn-login:hover {
            background-color: #8b0000;
        }

        .text-center a {
            color: #b30000;
            text-decoration: none;
            transition: 0.2s;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #f1f1f1;
            color: #666;
            text-align: center;
            padding: 15px 0;
            font-size: 0.9rem;
            border-top: 1px solid #ddd;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 36%;
            cursor: pointer;
            color: #999;
            font-size: 0.9em;
        }

        .toggle-password:hover {
            color: #b30000;
        }
    </style>
</head>
<body>

    <header>
        <h1>🎸 Rock Legends</h1>
        <p>Tu comunidad musical, donde las leyendas se conectan</p>
    </header>

    <main>
        <div class="login-box">
            <h2>Iniciar Sesión</h2>

            <form action="<%=request.getContextPath()%>/login" method="post">

                <div class="mb-3">
                    <label for="email" class="form-label">Correo electrónico</label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="tu@email.com">
                </div>

                <div class="mb-3 password-wrapper">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="********">
                    <span class="toggle-password" onclick="togglePass()">Mostrar</span>
                </div>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger text-center">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <button type="submit" class="btn btn-login mt-3">Entrar</button>

                <p class="text-center mt-3">
                    ¿No tienes cuenta? <a href="<%=request.getContextPath()%>/register.jsp">Regístrate aquí</a>
                </p>
            </form>
        </div>
    </main>

    <footer>
        <jsp:include page="/footer.jsp" />
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
