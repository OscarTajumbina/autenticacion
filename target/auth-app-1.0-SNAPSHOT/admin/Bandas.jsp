<jsp:include page="/navbar.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="com.miapp.auth.model.Banda" %>
<%@ page import="com.miapp.auth.model.Subgenero" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<Banda> bandas = (List<Banda>) request.getAttribute("bandas");
    List<Subgenero> subgeneros = (List<Subgenero>) request.getAttribute("subgeneros");
    String success = (String) session.getAttribute("success");
    String error = (String) session.getAttribute("error");
    session.removeAttribute("success");
    session.removeAttribute("error");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Bandas - Rock Community</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">

<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/admin/dashboard.jsp">🎸 Rock Community</a>
        <a href="<%= request.getContextPath() %>/logout" class="btn btn-outline-light">Cerrar sesión</a>
    </div>
</nav>

<div class="container mt-4">
    <% if (success != null) { %>
        <div class="alert alert-success"><%= success %></div>
    <% } else if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <div class="card bg-secondary mb-4">
        <div class="card-header text-white fw-bold">Agregar Nueva Banda</div>
        <div class="card-body">
            <form action="<%= request.getContextPath() %>/bandas" method="post" class="row g-3">
                <div class="col-md-4">
                    <input type="text" name="nombre" placeholder="Nombre de la Banda" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <input type="text" name="pais" placeholder="País de Origen" class="form-control" required>
                </div>
                <div class="col-md-3">
                    <select name="subgenero_id" class="form-select" required>
                        <option value="">Seleccione Subgénero</option>
                        <% for (Subgenero s : subgeneros) { %>
                            <option value="<%= s.getId() %>"><%= s.getNombre() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-success w-100">+</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card bg-dark">
        <div class="card-header fw-bold text-warning">Bandas Registradas</div>
        <table class="table table-dark table-striped align-middle text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>País</th>
                    <th>Subgénero</th>
                    <th>Miembros</th>
                </tr>
            </thead>
            <tbody>
                <% if (bandas != null && !bandas.isEmpty()) {
                    for (Banda b : bandas) { %>
                        <tr>
                            <td><%= b.getId() %></td>
                            <td><%= b.getNombre() %></td>
                            <td><%= b.getPais() %></td>
                            <td><%= b.getSubgeneroNombre() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/miembros?bandaId=<%= b.getId() %>" 
                                   class="btn btn-outline-info btn-sm">👥 Ver</a>
                            </td>
                        </tr>
                <% } } else { %>
                    <tr><td colspan="5" class="text-center text-muted">No hay bandas registradas.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
