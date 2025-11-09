<jsp:include page="/navbar.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="com.miapp.auth.model.MiembroBanda" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<MiembroBanda> miembros = (List<MiembroBanda>) request.getAttribute("miembros");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Miembros de Banda - Rock Community</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">

<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/bandas">🎸 Rock Community</a>
        <a href="<%= request.getContextPath() %>/logout" class="btn btn-outline-light">Cerrar sesión</a>
    </div>
</nav>

<div class="container mt-4">
    <div class="card bg-dark border-danger shadow-sm">
        <div class="card-header text-danger fw-bold">Miembros de la Banda</div>
        <table class="table table-dark table-striped text-center align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Instrumento</th>
                </tr>
            </thead>
            <tbody>
                <% if (miembros != null && !miembros.isEmpty()) {
                    for (MiembroBanda m : miembros) { %>
                        <tr>
                            <td><%= m.getId() %></td>
                            <td><%= m.getNombre() %></td>
                            <td><%= m.getInstrumento() %></td>
                        </tr>
                <% } } else { %>
                    <tr><td colspan="3" class="text-muted">Esta banda aún no tiene miembros registrados.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="mt-3 text-center">
        <a href="<%= request.getContextPath() %>/bandas" class="btn btn-outline-light">⬅ Volver a Bandas</a>
    </div>
</div>

</body>
</html>
