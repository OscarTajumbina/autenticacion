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
            background: linear-gradient(180deg, #eef2ff, #f7f9ff);
            color: #2d2d2d;
            margin: 0;
            padding-top: 80px;
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
            background: #ffffff;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.08);
            width: 430px;
            text-align: center;
            border-top: 4px solid #6a5acd; /* morado suave */
        }

        h1 {
            font-weight: 700;
            color: #3949ab; /* azul elegante */
            margin-bottom: 15px;
        }

        p.subtitle {
            color: #555;
            max-width: 550px;
            margin-bottom: 30px;
        }

        select {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #bfc2ff;
            font-size: 15px;
            margin-bottom: 25px;
            background: #f0f1ff;
        }

        select:focus {
            outline: none;
            border-color: #6a5acd;
            box-shadow: 0 0 6px rgba(106, 90, 205, .4);
        }

        .btn-entrar {
            background: #6a5acd;
            border: none;
            color: white;
            padding: 12px 20px;
            font-size: 15px;
            border-radius: 30px;
            font-weight: bold;
            transition: .3s;
            width: 100%;
        }

        .btn-entrar:hover {
            background: #5848c2;
            transform: scale(1.04);
        }

        .info-text {
            margin-top: 20px;
            font-size: 13px;
            color: #555;
        }
    </style>
</head>

<body>
    <section class="community-section">
        <h1>Explora las Comunidades</h1>
        <p class="subtitle">
            Conéctate con otros fans, comparte tus ideas y entra en los foros de tus bandas favoritas.
        </p>

        <div class="community-box">
            <h2 style="color:#3949ab;">Selecciona tu Comunidad</h2>

            <form action="<%= request.getContextPath() %>/community/forum.jsp" method="get">
                <select name="comunidadId" required>
                    <option value="">-- Elige una comunidad --</option>
                    <% for (Community c : comunidades) { %>
                        <option value="<%= c.getId() %>"><%= c.getNombre() %></option>
                    <% } %>
                </select>

                <button type="submit" class="btn-entrar">Entrar al Foro</button>
            </form>

            <p class="info-text">
                ¿No ves tu comunidad? Contacta al coordinador o solicita la creación de una nueva.
            </p>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
</body>
</html>
