<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.miapp.auth.dao.ForumDAO" %>

<%
    // ✅ Verificar sesión de usuario
    com.miapp.auth.model.User user = (com.miapp.auth.model.User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // ✅ Validar parámetro comunidadId con manejo de errores
    String comunidadParam = request.getParameter("comunidadId");
    Integer comunidadId = null;

    if (comunidadParam == null || comunidadParam.equals("null") || comunidadParam.isEmpty()) {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    try {
        comunidadId = Integer.parseInt(comunidadParam);
    } catch (NumberFormatException e) {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    // ✅ Obtener los mensajes del foro
    ForumDAO dao = new ForumDAO();
    List<Map<String, Object>> mensajes = dao.listByCommunity(comunidadId);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Foro de la Comunidad | Rock Legends 🤘</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #ff4d4d, #1a1a1a);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            text-align: center;
            padding: 50px 20px 20px;
        }

        header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #ffcccc;
            text-shadow: 0 0 20px #ff0000;
        }

        header p {
            color: #ddd;
            margin-top: 10px;
            font-size: 1.1rem;
        }

        main {
            flex-grow: 1;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }

        .post-form {
            background-color: rgba(255, 255, 255, 0.1);
            border: 2px solid #ff4d4d;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.3);
            margin-bottom: 50px;
        }

        .post-form h2 {
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

        .mensaje {
            background: rgba(0, 0, 0, 0.6);
            border-left: 4px solid #ff4d4d;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.2);
        }

        .mensaje h3 {
            margin: 0;
            color: #ff8080;
            font-weight: bold;
        }

        .mensaje small {
            color: #ccc;
            display: block;
            margin-top: 5px;
        }

        .mensaje p {
            color: #f2f2f2;
            margin-top: 10px;
        }

        .acciones {
            margin-top: 10px;
        }

        .acciones a, .acciones form button {
            color: #ff4d4d;
            text-decoration: none;
            font-weight: bold;
            background: none;
            border: none;
            cursor: pointer;
            display: inline;
            margin-right: 10px;
        }

        .acciones a:hover, .acciones form button:hover {
            text-decoration: underline;
            color: #ff1a1a;
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
        <h1>Foro de la Comunidad 🎤 #<%= comunidadId %></h1>
        <p>Comparte tus pensamientos, ideas y pasión por el rock con otros miembros.</p>
    </header>

    <main>

        <!-- Formulario de publicación -->
        <div class="post-form">
            <h2>Publicar un nuevo mensaje</h2>
            <form action="<%= request.getContextPath() %>/forum" method="post">
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="comunidadId" value="<%= comunidadId %>">
                <input type="text" name="titulo" placeholder="Título del mensaje" required>
                <textarea name="contenido" placeholder="Escribe tu mensaje..." rows="4" required></textarea>
                <button type="submit">Publicar</button>
            </form>
        </div>

        <!-- Listado de mensajes -->
        <% if (mensajes.isEmpty()) { %>
            <p style="text-align:center; color:#ccc;">No hay publicaciones aún en esta comunidad.</p>
        <% } else {
            for (Map<String, Object> m : mensajes) {
                String autor = (String) m.get("usuario");
        %>
                <div class="mensaje">
                    <h3><%= m.get("titulo") %></h3>
                    <p><%= m.get("contenido") %></p>
                    <small>Publicado por <%= autor %> — <%= m.get("fecha") %></small>

                    <%-- 🔹 Mostrar botones si el usuario es autor o tiene rol Admin/Coordinador --%>
                    <%
                        if (user != null && (user.getRoleId() == 1 || user.getRoleId() == 2 || autor.equals(user.getUsername()))) {
                    %>
                        <div class="acciones">
                            <a href="<%= request.getContextPath() %>/posts/editPost.jsp?id=<%= m.get("id") %>" class="btn btn-sm btn-warning">Editar</a>
                            <form action="<%= request.getContextPath() %>/deletePost" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= m.get("id") %>">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('¿Eliminar esta publicación?')">Eliminar</button>
                            </form>
                        </div>
                    <% } %>
                </div>
        <%  }
        } %>

    </main>

    <footer>
        © 2025 Rock Legends — Donde el sonido nunca muere 🤘
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
