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
    <title>Gestión de Comunidades | Rock Legends 🤘</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: linear-gradient(to bottom right, #ff4d4d, #1a1a1a);
            color: #fff;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            text-align: center;
            padding: 40px 20px 20px;
        }

        header h1 {
            font-size: 2.5rem;
            color: #ffcccc;
            text-shadow: 0 0 20px #ff0000;
            font-weight: 700;
        }

        main {
            flex-grow: 1;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }

        .create-form {
            background-color: rgba(255, 255, 255, 0.1);
            border: 2px solid #ff4d4d;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.3);
            margin-bottom: 50px;
        }

        .create-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #fff;
        }

        input[type=text], textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-bottom: 15px;
            font-size: 15px;
        }

        button {
            background-color: #ff4d4d;
            border: none;
            color: white;
            padding: 12px 20px;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.3s;
        }

        button:hover {
            background-color: #ff1a1a;
            transform: scale(1.05);
        }

        table {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 12px;
            overflow: hidden;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.3);
        }

        th, td {
            padding: 15px;
            text-align: left;
            color: #fff;
        }

        th {
            background-color: rgba(255, 0, 0, 0.7);
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        a.forum-link {
            color: #ff4d4d;
            text-decoration: none;
            font-weight: bold;
        }

        a.forum-link:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            color: #ccc;
            font-size: 14px;
            border-top: 1px solid #ff4d4d;
        }
    </style>
</head>
<body>

    <jsp:include page="/navbar.jsp" />

    <header>
        <h1>Gestión de Comunidades 🎤</h1>
        <p>Administra las comunidades rockeras, crea nuevas y accede a sus foros.</p>
    </header>

    <main>
        <!-- Crear comunidad -->
        <div class="create-form">
            <h2>Crear Nueva Comunidad</h2>
            <form action="<%= request.getContextPath() %>/community" method="post">
                <input type="hidden" name="action" value="create">
                <input type="text" name="nombre" placeholder="Nombre de la comunidad" required>
                <textarea name="descripcion" placeholder="Descripción breve..." rows="3" required></textarea>
                <button type="submit">Crear Comunidad</button>
            </form>
        </div>

        <!-- Tabla -->
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
                <% if (comunidades == null || comunidades.isEmpty()) { %>
                    <tr>
                        <td colspan="4" style="text-align:center; color:#ccc;">No hay comunidades registradas.</td>
                    </tr>
                <% } else { 
                    for (Community c : comunidades) { %>
                        <tr>
                            <td><%= c.getId() %></td>
                            <td><%= c.getNombre() %></td>
                            <td><%= c.getDescripcion() %></td>
                            <td>
                                <a class="forum-link" href="forum.jsp?comunidadId=<%= c.getId() %>">Ver Foro</a>
                            </td>
                        </tr>
                <%  } 
                } %>
            </tbody>
        </table>
    </main>

    <footer>
        © 2025 Rock Legends — Unidos por el poder del Rock 🤘
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
