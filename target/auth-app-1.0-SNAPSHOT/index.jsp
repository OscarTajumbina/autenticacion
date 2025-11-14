<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Rock Legends | Comunidad Rockera</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;

            background: linear-gradient(to bottom, rgba(0,0,0,0.85), rgba(0,0,0,0.9)),
                url('https://images.unsplash.com/photo-1518972559570-7cc1309f3229?auto=format&fit=crop&w=1740&q=80')
                no-repeat center center/cover;

            color: white;
            font-family: 'Poppins', sans-serif;
        }

        .hero {
            flex-grow: 1;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 2rem;
        }

        h1 {
            font-size: 4rem;
            color: #ff4d4d;
            text-shadow: 0 0 25px #ff0000;
        }

        .btn-rock {
            border-radius: 30px;
            padding: 12px 30px;
            margin: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-rock:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px #ff0000;
        }
    </style>
</head>
<body>

<jsp:include page="/navbar.jsp" />

<section class="hero">
    <h1>Bienvenido a <span style="color:white;">Rock Legends</span> 🤘</h1>

    <p class="mt-3 fs-5">Conéctate con la comunidad rockera más apasionada del planeta.</p>

    <div class="mt-4">
        <a href="<%=request.getContextPath()%>/login.jsp"
           class="btn btn-danger btn-lg btn-rock">Iniciar Sesión</a>

        <a href="<%=request.getContextPath()%>/register.jsp"
           class="btn btn-outline-light btn-lg btn-rock">Unirme a la Comunidad</a>
    </div>
</section>

<jsp:include page="/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
