<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Gestión de Comunidades</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        /* 🎨 Fondo general con color */
        body {
            margin: 0;
            background: linear-gradient(135deg, #001f3f, #007bff);
            font-family: 'Poppins', sans-serif;
            color: #fff;
            min-height: 100vh;
        }

        header {
            text-align: center;
            padding: 35px 20px 15px;
        }

        header h1 {
            color: #ffffff;
            font-size: 32px;
            font-weight: 700;
            text-shadow: 0 0 8px rgba(0,0,0,0.4);
        }

        header p {
            color: #dfe6f0;
            font-size: 15px;
        }

        main {
            max-width: 1000px;
            margin: auto;
            padding: 35px;
        }

        /* Tarjeta de formulario */
        .create-form {
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.3);
            padding: 30px;
            border-radius: 12px;
            backdrop-filter: blur(8px);
            box-shadow: 0 0 12px rgba(0,0,0,0.3);
            margin-bottom: 40px;
        }

        .create-form h2 {
            color: #ffffff;
            text-align: center;
            margin-bottom: 20px;
        }

        input[type=text], textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-bottom: 15px;
        }

        input, textarea {
            background: rgba(255,255,255,0.85);
        }

        input:focus, textarea:focus {
            outline: 2px solid #80bfff;
        }

        /* Botón principal */
        button {
            background-color: #0099ff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            color: white;
            transition: 0.2s;
        }

        button:hover {
            background-color: #0077cc;
            transform: scale(1.05);
        }

        /* Tabla */
        table {
            width: 100%;
            background: rgba(255,255,255,0.15);
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(6px);
            box-shadow: 0 0 10px rgba(0,0,0,0.25);
        }

        th {
            background: rgba(0, 102, 204, 0.8);
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            color: #f2f2f2;
        }

        tr:nth-child(even) {
            background: rgba(255,255,255,0.08);
        }

        tr:hover {
            background: rgba(255,255,255,0.18);
        }

        /* Links de acción */
        .forum-link {
            color: #80c2ff;
            font-weight: bold;
            text-decoration: none;
        }

        .forum-link:hover {
            text-decoration: underline;
            color: #cce6ff;
        }

        footer {
            text-align: center;
            padding: 15px;
            color: #cfd8e6;
            margin-top: 40px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <jsp:include page="/navbar.jsp" />

    <header>
        <h1>Gestión de Comunidades</h1>
        <p>Administra las comunidades de la plataforma</p>
    </header>

    <main>

        <% if (user.getRoleId() == 1 || user.getRoleId() == 2) { %>
        <div class="create-form">
            <h2>Crear Nueva Comunidad</h2>

            <form action="<%= request.getContextPath() %>/community" method="post">
                <input type="hidden" name="action" value="create">

                <input type="text" name="nombre" placeholder="Nombre de la comunidad" required>
                <textarea name="descripcion" rows="3" placeholder="Descripción..." required></textarea>

                <button type="submit">Crear Comunidad</button>
            </form>
        </div>
        <% } %>

        <h2 class="text-center mb-3">Comunidades Existentes</h2>

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
                <% if (comunidades.isEmpty()) { %>
                    <tr>
                        <td colspan="4" style="text-align:center;">No hay comunidades registradas.</td>
                    </tr>
                <% } else { 
                    for (Community c : comunidades) { %>
                        <tr>
                            <td><%= c.getId() %></td>
                            <td><%= c.getNombre() %></td>
                            <td><%= c.getDescripcion() %></td>
                            <td>
                                <a class="forum-link" href="forum.jsp?comunidadId=<%= c.getId() %>">Ver Foro</a>

                                <% if (user.getRoleId() == 1 || user.getRoleId() == 2) { %>
                                    | <a class="forum-link" href="<%= request.getContextPath() %>/community/editCommunity.jsp?id=<%= c.getId() %>">Editar</a>
                                    |
                                    <form action="<%= request.getContextPath() %>/deleteCommunity" method="post" class="action-form" style="display:inline;">
                                        <input type="hidden" name="id" value="<%= c.getId() %>">
                                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('¿Eliminar esta comunidad?')">Eliminar</button>
                                    </form>
                                <% } %>
                            </td>
                        </tr>
                <% } } %>
            </tbody>
        </table>

    </main>

    <footer>
        © 2025 Rock Legends — Plataforma Web
    </footer>

</body>
</html>
