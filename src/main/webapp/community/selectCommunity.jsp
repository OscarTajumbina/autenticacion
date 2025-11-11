<jsp:include page="/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.miapp.auth.dao.CommunityDAO, com.miapp.auth.model.Community" %>

<%
    com.miapp.auth.model.User user = (com.miapp.auth.model.User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    CommunityDAO dao = new CommunityDAO();
    List<Community> comunidades = dao.findAll();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Comunidad | Rock Legends</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(180deg, #ffffff, #f2f5fa);
            color: #333;
            margin: 0;
            padding-top: 80px; /* espacio para el navbar */
        }

        .community-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 150px);
            text-align: center;
            padding: 40px 20px;
        }

        .community-box {
            background: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            width: 420px;
            text-align: center;
            border-top: 4px solid #dc3545;
        }

        h1 {
            font-weight: 700;
            color: #dc3545;
            margin-bottom: 15px;
        }

        p.subtitle {
            color: #555;
            max-width: 500px;
            margin-bottom: 30px;
        }

        select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            margin-bottom: 25px;
            background: #fafafa;
        }

        select:focus {
            outline: none;
            border-color: #dc3545;
        }

        .btn-entrar {
            background: #dc3545;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 15px;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s;
            width: 100%;
        }

        .btn-entrar:hover {
            background: #c82333;
            transform: scale(1.03);
        }

        .info-text {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        footer {
            margin-top: 40px;
        }
    </style>
</head>

<body>
    <section class="community-section">
        <h1>Explora las Comunidades</h1>
        <p class="subtitle">
            Conéctate con otras leyendas del rock. Únete a una comunidad, comparte tu pasión y participa en los foros.
        </p>

        <div class="community-box">
            <h2>Selecciona tu Comunidad</h2>
            <form action="<%= request.getContextPath() %>/community/forum.jsp" method="get">
                <select name="comunidadId" required>
                    <option value="">-- Elige una comunidad --</option>
                    <% for (Community c : comunidades) { %>
                        <option value="<%= c.getId() %>"><%= c.getNombre() %></option>
                    <% } %>
                </select>
                <button type="submit" class="btn-entrar">Entrar al Foro</button>
            </form>
            <p class="info-text">¿No ves tu comunidad? Contacta al coordinador o crea una nueva desde el panel de gestión.</p>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
</body>
</html>
