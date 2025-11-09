<jsp:include page="/navbar.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="com.miapp.auth.model.Subgenero" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<Subgenero> subgeneros = (List<Subgenero>) request.getAttribute("subgeneros");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Subgéneros - Rock Community</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard.jsp">🎵 Rock Community</a>
        <a href="<%= request.getContextPath() %>/logout" class="btn btn-outline-light">Salir</a>
    </div>
</nav>

<div class="container mt-4">
    <div class="card bg-dark border-warning">
        <div class="card-header text-warning fw-bold">Lista de Subgéneros</div>
        <table class="table table-dark table-striped text-center align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                </tr>
            </thead>
            <tbody>
                <% if (subgeneros != null && !subgeneros.isEmpty()) {
                    for (Subgenero s : subgeneros) { %>
                        <tr>
                            <td><%= s.getId() %></td>
                            <td><%= s.getNombre() %></td>
                            <td><%= s.getDescripcion() %></td>
                        </tr>
                <% } } else { %>
                    <tr><td colspan="3" class="text-muted">No hay subgéneros registrados.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
