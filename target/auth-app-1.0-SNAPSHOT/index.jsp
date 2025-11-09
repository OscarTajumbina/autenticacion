<jsp:include page="/navbar.jsp" />
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Rock Legends | Comunidad Rockera 🤘</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(0,0,0,0.9)),
                        url('https://images.unsplash.com/photo-1518972559570-7cc1309f3229?auto=format&fit=crop&w=1740&q=80')
                        no-repeat center center/cover;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        nav {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px 0;
            text-transform: uppercase;
            font-weight: bold;
        }

        .hero {
            text-align: center;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 4rem;
            color: #ff4d4d;
            text-shadow: 0 0 25px #ff0000;
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
    </style>
</head>
<body>

    <nav class="text-center">
        <span class="text-danger fs-3">🎸 Rock Legends</span>
    </nav>

    <section class="hero">
        <h1>Bienvenido a Rock Legends 🤘</h1>
        <p>Conéctate con la comunidad rockera más apasionada.</p>

        <div>
            <a href="<%=request.getContextPath()%>/login.jsp"
               class="btn btn-danger btn-lg btn-rock px-4">Iniciar Sesión</a>

            <a href="<%=request.getContextPath()%>/register.jsp"
               class="btn btn-outline-light btn-lg btn-rock px-4">Unirme a la Comunidad</a>
        </div>
    </section>

    <footer class="text-center text-secondary mb-3">
        © 2025 Rock Legends | La música que nunca muere 🎶
    </footer>

</body>
</html>
