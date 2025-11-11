<%@ page import="java.util.*,com.miapp.auth.model.*,com.miapp.auth.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserDAO dao = new UserDAO();
    List<User> users = dao.findAll();
%>

<%@ include file="../header.jsp" %>

<style>
    body {
        background: linear-gradient(135deg, #f5f7fa, #e4ebf5);
        font-family: 'Poppins', sans-serif;
        color: #222;
    }

    .card {
        border-radius: 20px;
        border: none;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        background: #fff;
    }

    .table thead {
        background: linear-gradient(90deg, #ff4d4d, #ff8080);
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .table tbody tr:hover {
        background-color: #f8f9fa;
        transition: 0.3s;
    }

    .btn-primary {
        background: #ff4d4d;
        border: none;
        border-radius: 10px;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background: #ff1a1a;
        transform: scale(1.05);
    }

    .btn-danger {
        border-radius: 10px;
        transition: 0.3s;
    }

    .btn-danger:hover {
        transform: scale(1.05);
    }

    .btn-secondary {
        border-radius: 10px;
        background-color: #6c757d;
        border: none;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
        transform: scale(1.03);
    }

    .role-badge {
        padding: 6px 12px;
        border-radius: 20px;
        color: #fff;
        font-weight: 500;
        text-shadow: 0 0 5px rgba(0,0,0,0.2);
    }

    .role-admin { background-color: #dc3545; }
    .role-coord { background-color: #ffc107; color: #212529; }
    .role-fan { background-color: #198754; }

    h2 {
        color: #ff4d4d;
        font-weight: 700;
        text-align: center;
    }

    .title-divider {
        width: 80px;
        height: 4px;
        background: #ff4d4d;
        margin: 0 auto 25px auto;
        border-radius: 3px;
    }
</style>

<div class="container mt-5 mb-5">

    <!-- 🔙 Botón volver -->
    <a href="${pageContext.request.contextPath}/admin/dashboard_admin.jsp" class="btn btn-secondary mb-4">
        ⬅ Volver al Panel
    </a>

    <div class="card p-4">
        <h2>👥 Gestión de Usuarios y Roles</h2>
        <div class="title-divider"></div>
        <p class="text-center text-muted mb-4">
            Administra los roles de los miembros de la comunidad.  
            Promociona coordinadores, asigna administradores o elimina usuarios inactivos.
        </p>

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
                <% 
                    if (users != null && !users.isEmpty()) {
                        for (User u : users) { 
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
                <% 
                        } 
                    } else { 
                %>
                    <tr>
                        <td colspan="5" class="text-muted">No hay usuarios registrados.</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
