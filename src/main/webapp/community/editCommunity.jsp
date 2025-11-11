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
        body { font-family: Arial, sans-serif; background: #f4f4f4; margin: 0; }
        .container { max-width: 600px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; margin-bottom: 20px; }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input[type=text], textarea { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
        button { margin-top: 15px; background-color: #007bff; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        a { display: inline-block; margin-top: 10px; color: #555; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="container">
    <h2>Editar Comunidad</h2>

    <%
        if (comunidad == null) {
    %>
        <p style="color:red;">❌ No se encontró la comunidad solicitada.</p>
        <a href="<%= request.getContextPath() %>/community/manage.jsp">Volver a la gestión</a>
    <%
        } else {
    %>
        <form action="<%= request.getContextPath() %>/updateCommunity" method="post">
            <input type="hidden" name="id" value="<%= comunidad.getId() %>">

            <label for="nombre">Nombre de la comunidad:</label>
            <input type="text" id="nombre" name="nombre" value="<%= comunidad.getNombre() %>" required>

            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4"><%= comunidad.getDescripcion() %></textarea>

            <button type="submit">💾 Guardar Cambios</button>
        </form>

        <a href="<%= request.getContextPath() %>/community/manage.jsp">⬅ Volver</a>
    <%
        }
    %>
</div>

</body>
</html>
