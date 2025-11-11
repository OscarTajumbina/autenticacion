<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Rock Legends | Comunidad Rockera</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            background: linear-gradient(to bottom, rgba(0,0,0,0.85), rgba(0,0,0,0.9)),
                        url('https://images.unsplash.com/photo-1518972559570-7cc1309f3229?auto=format&fit=crop&w=1740&q=80')
                        no-repeat center center/cover;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .hero {
            text-align: center;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        h1 {
            font-size: 4rem;
            color: #ff4d4d;
            text-shadow: 0 0 25px #ff0000;
        }

        p {
            font-size: 1.3rem;
            color: #ddd;
            margin-bottom: 1.5rem;
        }

        .btn-rock {
            margin: 20px 10px;
            font-weight: bold;
            border-radius: 30px;
            transition: 0.3s;
        }

        .btn-rock:hover {
            transform: scale(1.1);
            box-shadow: 0 0 20px #ff0000;
        }

        footer {
            text-align: center;
            padding: 12px;
            color: #ccc;
            font-size: 0.9rem;
            background-color: rgba(0,0,0,0.8);
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        footer span {
            color: #ff4d4d;
        }
    </style>
</head>
<body>

    <!-- Navbar global -->
    <jsp:include page="/navbar.jsp" />

    <!-- Contenido principal -->
    <section class="hero">
        <h1>Bienvenido a <span style="color:white;">Rock Legends</span> 🤘</h1>
        <p>Conéctate con la comunidad rockera más apasionada del planeta.</p>

        <div>
            <a href="<%=request.getContextPath()%>/login.jsp"
               class="btn btn-danger btn-lg btn-rock px-4">Iniciar Sesión</a>

            <a href="<%=request.getContextPath()%>/register.jsp"
               class="btn btn-outline-light btn-lg btn-rock px-4">Unirme a la Comunidad</a>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <jsp:include page="/footer.jsp" />

    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
