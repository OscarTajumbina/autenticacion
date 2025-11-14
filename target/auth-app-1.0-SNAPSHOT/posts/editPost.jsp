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
    <title>Editar Publicación | Rock Legends</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(180deg, #eef2ff, #f7f9ff);
            color: #333;
            min-height: 100vh;
            margin: 0;
            padding-top: 90px;
            display: flex;
            flex-direction: column;
        }

        main {
            flex-grow: 1;
            max-width: 700px;
            margin: 25px auto 40px;
            background: #ffffff;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
            border-top: 4px solid #6a5acd; /* morado suave */
        }

        h2 {
            color: #3949ab;
            font-weight: 700;
        }

        label {
            font-weight: 600;
            color: #444;
        }

        input, textarea {
            width: 100%;
            border-radius: 10px;
            border: 1px solid #bfc2ff;
            background: #f0f1ff;
            padding: 12px;
            margin-bottom: 15px;
            transition: .2s;
        }

        input:focus, textarea:focus {
            border-color: #6a5acd;
            outline: none;
            box-shadow: 0 0 6px rgba(106, 90, 205, .4);
        }

        button {
            background: #6a5acd;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: bold;
            transition: .3s;
        }

        button:hover {
            background: #5848c2;
            transform: scale(1.04);
        }

        footer {
            text-align: center;
            padding: 15px;
            color: #555;
            font-size: 14px;
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
            <a href="<%= request.getContextPath() %>/community/forum.jsp?comunidadId=<%= comunidadId %>" 
               class="btn btn-secondary ms-2">Cancelar</a>
        </div>
    </form>
</main>

<footer>
    © 2025 Rock Legends — Edición de publicaciones 🤘
</footer>

</body>
</html>
