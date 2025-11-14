<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.sql.Timestamp,com.miapp.auth.dao.ForumDAO" %>

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

    if (comunidadParam == null) {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    comunidadParam = comunidadParam.trim();
    if (comunidadParam.equals("") || comunidadParam.equalsIgnoreCase("null") || comunidadParam.equalsIgnoreCase("undefined")) {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    try {
        comunidadId = Integer.parseInt(comunidadParam);
    } catch (NumberFormatException e) {
        response.sendRedirect("selectCommunity.jsp");
        return;
    }

    // ✅ Obtener los mensajes del foro (manejo si dao devuelve null)
    ForumDAO dao = new ForumDAO();
    List<Map<String, Object>> mensajes = dao.listByCommunity(comunidadId);
    if (mensajes == null) {
        mensajes = new ArrayList<>();
    }
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
        background: linear-gradient(to bottom right, #3f2b96, #a8c0ff);
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
        color: #e5e0ff;
        text-shadow: 0 0 10px #4b37a3;
    }

    header p {
        color: #e0e0ff;
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
        background-color: rgba(255, 255, 255, 0.15);
        border: 2px solid #6a5acd;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(106, 90, 205, 0.4);
        margin-bottom: 50px;
    }

    .post-form h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #ffffff;
        text-shadow: 0 0 6px #6a5acd;
    }

    input[type=text], textarea {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #6a5acd;
        margin-bottom: 15px;
        font-size: 15px;
        background: rgba(255, 255, 255, 0.2);
        color: #fff;
    }

    input[type=text]::placeholder,
    textarea::placeholder {
        color: #dcd4ff;
    }

    button {
        background-color: #6a5acd;
        border: none;
        color: white;
        padding: 12px 20px;
        font-weight: bold;
        border-radius: 8px;
        transition: 0.3s;
        box-shadow: 0 0 8px rgba(106, 90, 205, 0.5);
    }

    button:hover {
        background-color: #4f3fb3;
        transform: scale(1.05);
        box-shadow: 0 0 12px rgba(106, 90, 205, 0.7);
    }

    .mensaje {
        background: rgba(255, 255, 255, 0.10);
        border-left: 4px solid #6a5acd;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 25px;
        box-shadow: 0 0 12px rgba(106, 90, 205, 0.4);
    }

    .mensaje h3 {
        margin: 0;
        color: #e6dbff;
        font-weight: bold;
        text-shadow: 0 0 5px #4b37a3;
    }

    .mensaje small {
        color: #d1ccff;
        display: block;
        margin-top: 5px;
    }

    .mensaje p {
        color: #f8f6ff;
        margin-top: 10px;
    }

    .acciones {
        margin-top: 10px;
    }

    .acciones a,
    .acciones form button {
        color: #cfc6ff;
        text-decoration: none;
        font-weight: bold;
        background: none;
        border: none;
        cursor: pointer;
        display: inline;
        margin-right: 10px;
    }

    .acciones a:hover,
    .acciones form button:hover {
        color: #ffffff;
        text-shadow: 0 0 6px #6a5acd;
    }

    footer {
        text-align: center;
        padding: 20px;
        background: rgba(0, 0, 0, 0.4);
        color: #dcd4ff;
        font-size: 14px;
        border-top: 1px solid #6a5acd;
        backdrop-filter: blur(4px);
    }
</style>

</head>
<body>

    <jsp:include page="/navbar.jsp" />

    <header>
        <h1>Foro de la Comunidad 🎤 #<%= comunidadId %></h1>
        <p>Comparte tus pensamientos, crea debates y conecta con otros fans del rock. Respeta las reglas y mantén la comunidad sana.</p>
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
                <div style="text-align:right;">
                    <button type="submit" class="btn-post">Publicar</button>
                </div>
            </form>
        </div>

        <!-- Listado de mensajes -->
        <% if (mensajes.isEmpty()) { %>
            <div class="empty-msg">Aún no hay publicaciones en esta comunidad. ¡Sé el primero en compartir algo!</div>
        <% } else {
            for (Map<String, Object> m : mensajes) {
                // Manejo seguro de campos (evita NPE)
                String autor = (m.get("usuario") != null) ? String.valueOf(m.get("usuario")) : "Anónimo";
                Object fechaObj = m.get("fecha");
                String fechaStr = "";
                if (fechaObj instanceof Timestamp) {
                    fechaStr = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format((Timestamp) fechaObj);
                } else if (fechaObj != null) {
                    fechaStr = String.valueOf(fechaObj);
                } else {
                    fechaStr = "Fecha desconocida";
                }
                Object idObj = m.get("id");
        %>
                <div class="mensaje">
                    <h3><%= m.get("titulo") %></h3>
                    <small>Publicado por <strong><%= autor %></strong> — <%= fechaStr %></small>
                    <p><%= m.get("contenido") %></p>

                    <%-- Mostrar botones si el usuario es autor o tiene rol Admin/Coordinador --%>
                    <%
                        boolean isAuthor = (autor != null && autor.equals(user.getUsername()));
                        boolean isAdminOrCoord = (user.getRoleId() == 1 || user.getRoleId() == 2);
                        if ((isAuthor || isAdminOrCoord) && idObj != null) {
                            String idStr = String.valueOf(idObj);
                    %>
                        <div class="acciones">
                            <a href="<%= request.getContextPath() %>/posts/editPost.jsp?id=<%= idStr %>" class="btn btn-warning">Editar</a>

                            <form action="<%= request.getContextPath() %>/deletePost" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= idStr %>">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('¿Eliminar esta publicación?')">Eliminar</button>
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
