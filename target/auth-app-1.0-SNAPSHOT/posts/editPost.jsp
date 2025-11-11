<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,com.miapp.auth.util.DBUtil" %>

<%
    com.miapp.auth.model.User user = (com.miapp.auth.model.User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("forum.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);
    String titulo = "", contenido = "", comunidadId = "";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(
                 "SELECT titulo, contenido, comunidad_id, usuario_id FROM publicaciones WHERE id = ?")) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                titulo = rs.getString("titulo");
                contenido = rs.getString("contenido");
                comunidadId = rs.getString("comunidad_id");

                int autorId = rs.getInt("usuario_id");
                // Solo permitir editar si es el autor o admin o coordinador
                if (!(user.getRoleId() == 1 || user.getRoleId() == 2 || user.getId() == autorId)) {
                    response.sendRedirect(request.getContextPath() + "/community/forum.jsp?comunidadId=" + comunidadId);
                    return;
                }
            } else {
                response.sendRedirect("forum.jsp");
                return;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Publicación | Rock Legends 🤘</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #ff4d4d, #1a1a1a);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex-grow: 1;
            max-width: 700px;
            margin: 50px auto;
            background-color: rgba(255,255,255,0.1);
            border: 2px solid #ff4d4d;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(255,0,0,0.3);
        }

        input, textarea {
            width: 100%;
            border-radius: 8px;
            border: none;
            margin-bottom: 15px;
            padding: 12px;
        }

        button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: bold;
        }

        button:hover {
            background-color: #ff1a1a;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<jsp:include page="/navbar.jsp" />

<main>
    <h2 class="text-center mb-4">Editar Publicación</h2>

    <form action="<%= request.getContextPath() %>/updatePost" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="hidden" name="comunidadId" value="<%= comunidadId %>">

        <label>Título</label>
        <input type="text" name="titulo" value="<%= titulo %>" required>

        <label>Contenido</label>
        <textarea name="contenido" rows="6" required><%= contenido %></textarea>

        <div class="text-center">
            <button type="submit">Actualizar</button>
            <a href="<%= request.getContextPath() %>/community/forum.jsp?comunidadId=<%= comunidadId %>" class="btn btn-secondary ms-2">Cancelar</a>
        </div>
    </form>
</main>

<footer class="text-center mt-auto p-3">
    © 2025 Rock Legends — Edición de publicaciones 🤘
</footer>

</body>
</html>
