<jsp:include page="/navbar.jsp" />
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.miapp.auth.dao.CommunityDAO, com.miapp.auth.model.Community" %>

<%
    // Cargar comunidades desde la base de datos
    CommunityDAO dao = new CommunityDAO();
   List<Community> comunidades = dao.findAll();

%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Comunidades</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        header {
            background: #007bff;
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 1.8em;
            letter-spacing: 1px;
        }
        main {
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }
        .create-form {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }
        .create-form h2 {
            margin-bottom: 15px;
            color: #333;
        }
        input[type=text], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background: #0056b3;
        }
        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background: #007bff;
            color: white;
            font-weight: normal;
        }
        tr:nth-child(even) {
            background: #f8f9fa;
        }
        a.forum-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        a.forum-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>Gestión de Comunidades</header>
    <main>

        <!-- Formulario para crear una nueva comunidad -->
        <div class="create-form">
            <h2>Crear nueva comunidad</h2>
            <form action="<%= request.getContextPath() %>/community" method="post">
                <input type="hidden" name="action" value="create">
                <input type="text" name="nombre" placeholder="Nombre de la comunidad" required>
                <textarea name="descripcion" placeholder="Descripción breve..." rows="3" required></textarea>
                <button type="submit">Crear</button>
            </form>
        </div>

        <!-- Tabla con comunidades existentes -->
        <h2>Comunidades existentes</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% if (comunidades == null || comunidades.isEmpty()) { %>
                    <tr>
                        <td colspan="4" style="text-align:center; color:gray;">No hay comunidades registradas.</td>
                    </tr>
                <% } else { 
                    for (Community c : comunidades) { %>
                        <tr>
                            <td><%= c.getId() %></td>
                            <td><%= c.getNombre() %></td>
                            <td><%= c.getDescripcion() %></td>
                            <td>
                                <a class="forum-link" href="forum.jsp?comunidadId=<%= c.getId() %>">Ver foro</a>
                            </td>
                        </tr>
                <%  } 
                } %>
            </tbody>
        </table>

    </main>
</body>
</html>
