<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/navbar.jsp" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Rock Legends | Panel Principal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to bottom right, #1a1a1a, #3a0000);
            font-family: 'Poppins', sans-serif;
            color: #eee;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .hero {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 3rem;
        }

        .hero h1 {
            color: #ff1a1a;
            font-weight: 900;
            text-shadow: 0 0 10px rgba(255, 0, 0, .4);
            margin-bottom: 1rem;
            font-size: 3rem;
        }

        .hero p {
            font-size: 1.25rem;
            max-width: 650px;
            color: #ddd;
            line-height: 1.6;
        }

        .hero .btn {
            margin-top: 1.5rem;
            padding: 0.8rem 2rem;
            border-radius: 30px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-danger:hover {
            background-color: #b30000;
            transform: scale(1.05);
            box-shadow: 0 0 12px rgba(255, 0, 0, 0.5);
        }

        .btn-outline-dark {
            border-color: white !important;
            color: white !important;
        }

        .btn-outline-dark:hover {
            background-color: white !important;
            color: #000 !important;
            transform: scale(1.06);
            box-shadow: 0 0 12px rgba(255,255,255,0.4);
        }

        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>

    <!-- Hero principal -->
    <section class="hero">
        <h1>Bienvenido a Rock Legends 🤘</h1>
        <p>
            Explora comunidades, participa en foros y conecta con otros fans del rock.  
            ¡Aquí la música nunca muere, solo suena más fuerte!
        </p>

        <div>
            <a href="<%=request.getContextPath()%>/community/selectCommunity.jsp" class="btn btn-danger">
                Ir a Foros
            </a>

            <a href="<%=request.getContextPath()%>/profile.jsp" class="btn btn-outline-dark ms-2">
                Ver Perfil
            </a>
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
