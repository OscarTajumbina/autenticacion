<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.miapp.auth.dao.CommunityDAO, com.miapp.auth.model.Community" %>

<%
    // Obtener parámetro ID
    String idParam = request.getParameter("id");
    Community comunidad = null;

    if (idParam != null) {
        try {
            int id = Integer.parseInt(idParam);
            CommunityDAO dao = new CommunityDAO();
            for (Community c : dao.findAll()) {
                if (c.getId() == id) {
                    comunidad = c;
                    break;
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Comunidad</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle, #020224, #000);
            color: #eaf4ff;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background: rgba(0,0,0,0.5);
            padding: 35px;
            border-radius: 20px;
            border: 2px solid #4cc9f0;
            box-shadow: 0 0 25px rgba(76, 201, 240, 0.35);
        }

        h2 {
            color: #4cc9f0;
            font-size: 32px;
            margin-bottom: 10px;
            text-shadow: 0 0 12px #4895ef;
        }

        .title-divider {
            width: 80px;
            height: 4px;
            margin: 10px auto 25px auto;
            background: #4cc9f0;
            border-radius: 4px;
            box-shadow: 0 0 10px #4cc9f0;
        }

        label {
            text-align: left;
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #aee1ff;
        }

        input[type=text],
        textarea {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border-radius: 10px;
            background: rgba(255,255,255,0.08);
            border: 1px solid #4cc9f0;
            color: #eaf4ff;
            font-size: 15px;
        }

        textarea { resize: none; }

        input::placeholder, textarea::placeholder {
            color: #9ec9e8;
        }

        button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(90deg, #4895ef, #4cc9f0);
            color: #000;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 0 12px rgba(76,201,240,0.4);
            transition: 0.3s;
        }

        button:hover {
            transform: scale(1.05);
            background: linear-gradient(90deg, #4cc9f0, #4895ef);
            box-shadow: 0 0 18px rgba(76,201,240,0.7);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #4cc9f0;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-shadow: 0 0 8px #4cc9f0;
        }

        .error-msg {
            color: #ff6b6b;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Editar Comunidad</h2>
    <div class="title-divider"></div>

    <%
        if (comunidad == null) {
    %>
        <p class="error-msg">❌ No se encontró la comunidad solicitada.</p>
        <a href="<%= request.getContextPath() %>/community/manage.jsp">⬅ Volver a la gestión</a>

    <%
        } else {
    %>

        <form action="<%= request.getContextPath() %>/updateCommunity" method="post">

            <input type="hidden" name="id" value="<%= comunidad.getId() %>">

            <label for="nombre">Nombre de la comunidad:</label>
            <input type="text" id="nombre" name="nombre"
                   value="<%= comunidad.getNombre() %>"
                   required>

            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4">
<%= comunidad.getDescripcion() %>
            </textarea>

            <button type="submit">💾 Guardar Cambios</button>

        </form>

        <a href="<%= request.getContextPath() %>/community/manage.jsp">⬅ Volver</a>

    <%
        }
    %>

</div>

</body>
</html>
