
<%@ page import="java.util.*,com.miapp.auth.model.*,com.miapp.auth.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserDAO dao = new UserDAO();
    List<User> users = dao.findAll();
%>

<%@ include file="../header.jsp" %>

<style>
    body {
        background: #f4f7fa;
    }
    .card {
        border-radius: 20px;
        border: none;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    .table thead {
        background: linear-gradient(90deg, #007bff, #6610f2);
        color: #fff;
    }
    .btn-primary {
        background: #007bff;
        border: none;
        border-radius: 10px;
    }
    .btn-danger {
        border-radius: 10px;
    }
    .btn-secondary {
        border-radius: 10px;
    }
    .role-badge {
        padding: 6px 12px;
        border-radius: 20px;
        color: #fff;
        font-weight: 500;
    }
    .role-admin { background-color: #dc3545; }
    .role-coord { background-color: #ffc107; color: #212529; }
    .role-fan { background-color: #198754; }
</style>

<div class="container mt-4">
    <!-- 🔙 Botón volver -->
    <a href="${pageContext.request.contextPath}/admin/dashboard_admin.jsp" class="btn btn-secondary mb-3">⬅ Volver al Panel</a>

    <div class="card p-4">
        <h2 class="text-center mb-4 text-primary">👥 Gestión de Usuarios y Roles</h2>

        <div class="table-responsive">
            <table class="table table-hover align-middle text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Rol Actual</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% for (User u : users) { 
                       String roleName;
                       String badgeClass;
                       if (u.getRoleId() == 1) {
                           roleName = "ADMIN";
                           badgeClass = "role-admin";
                       } else if (u.getRoleId() == 2) {
                           roleName = "COORDINADOR";
                           badgeClass = "role-coord";
                       } else {
                           roleName = "FAN";
                           badgeClass = "role-fan";
                       }
                %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><strong><%= u.getUsername() %></strong></td>
                        <td><%= u.getEmail() %></td>
                        <td>
                            <span class="role-badge <%= badgeClass %>"><%= roleName %></span>
                        </td>
                        <td>
                            <!-- Actualizar rol -->
                            <form action="${pageContext.request.contextPath}/updateRole" method="post" class="d-inline">
                                <input type="hidden" name="id" value="<%= u.getId() %>">
                                <select name="roleId" class="form-select d-inline w-auto">
                                    <option value="1" <%= u.getRoleId()==1?"selected":"" %>>ADMIN</option>
                                    <option value="2" <%= u.getRoleId()==2?"selected":"" %>>COORDINADOR</option>
                                    <option value="3" <%= u.getRoleId()==3?"selected":"" %>>FAN</option>
                                </select>
                                <button type="submit" class="btn btn-primary btn-sm ms-1">Actualizar</button>
                            </form>

                            <!-- Eliminar usuario -->
                            <form action="${pageContext.request.contextPath}/deleteUser" method="post" class="d-inline ms-2">
                                <input type="hidden" name="id" value="<%= u.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
