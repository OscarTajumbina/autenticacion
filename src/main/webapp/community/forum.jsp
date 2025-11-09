<jsp:include page="/navbar.jsp" />
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.miapp.auth.dao.ForumDAO" %>

<%
    // Validar parámetro comunidadId
    String comunidadParam = request.getParameter("comunidadId");
    Integer comunidadId = null;
    if (comunidadParam != null && !comunidadParam.isEmpty()) {
        comunidadId = Integer.parseInt(comunidadParam);
    } else {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    // Cargar mensajes
    ForumDAO dao = new ForumDAO();
    List<Map<String, Object>> mensajes = dao.listByCommunity(comunidadId);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Foro de la Comunidad</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: #f4f6fb;
            padding: 40px;
            margin: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto 40px;
        }
        input[type=text], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover { background: #0056b3; }
        .mensaje {
            background: white;
            border-radius: 10px;
            padding: 15px;
            margin: 10px auto;
            max-width: 600px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.1);
        }
        .mensaje h3 { margin: 0; color: #007bff; }
        .mensaje small { color: #666; }
        .mensaje p { color: #333; margin-top: 8px; }
        .volver {
            display: block;
            text-align: center;
            margin-bottom: 30px;
        }
        .volver a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .volver a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="volver">
        <a href="manage.jsp">&larr; Volver a comunidades</a>
    </div>

    <h1>Foro de la Comunidad #<%= comunidadId %></h1>

    <!-- Formulario para publicar -->
    <form action="<%= request.getContextPath() %>/forum" method="post">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="comunidadId" value="<%= comunidadId %>">
        <input type="text" name="titulo" placeholder="Título del mensaje" required>
        <textarea name="contenido" placeholder="Escribe tu mensaje..." rows="4" required></textarea>
        <button type="submit">Publicar</button>
    </form>

    <!-- Mostrar publicaciones -->
    <% if (mensajes.isEmpty()) { %>
        <p style="text-align:center; color:gray;">No hay publicaciones aún en esta comunidad.</p>
    <% } else {
        for (Map<String, Object> m : mensajes) { %>
            <div class="mensaje">
                <h3><%= m.get("titulo") %></h3>
                <p><%= m.get("contenido") %></p>
                <small>Por <%= m.get("usuario") %> — <%= m.get("fecha") %></small>
            </div>
    <% } } %>

</body>
</html>
