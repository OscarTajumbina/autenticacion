<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Seleccionar Comunidad</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #007bff, #6610f2);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            width: 420px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 25px;
        }

        select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            margin-bottom: 20px;
        }

        .btn {
            background: #007bff;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Selecciona una Comunidad</h2>
        <form action="${pageContext.request.contextPath}/community/forum.jsp" method="get">
            <select name="comunidadId" required>
                <option value="">-- Selecciona una --</option>
                <% for (Community c : comunidades) { %>
                    <option value="<%= c.getId() %>"><%= c.getNombre() %></option>
                <% } %>
            </select>
            <button type="submit" class="btn">Entrar al Foro</button>
        </form>
    </div>
</body>
</html>
