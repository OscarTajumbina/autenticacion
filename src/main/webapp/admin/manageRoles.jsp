<%@ page import="java.util.*,com.miapp.auth.model.*,com.miapp.auth.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserDAO dao = new UserDAO();
    List<User> users = dao.findAll();
%>

<!-- 🔥 Reemplazamos header.jsp por navbar.jsp -->
<%@ include file="../navbar.jsp" %>

<style>
    body {
        background: radial-gradient(circle, #03045e, #000);
        font-family: 'Poppins', sans-serif;
        color: #eaf4ff;
        text-align: center;
    }

    .container {
        max-width: 1100px;
        margin: 0 auto;
    }

    .card {
        border-radius: 20px;
        border: 2px solid #4cc9f0;
        background: rgba(0,0,0,0.5);
        box-shadow: 0 0 20px rgba(76,201,240,0.25);
        margin: auto;
        width: 90%;
    }

    h2 {
        color: #4cc9f0;
        font-weight: 700;
        text-align: center;
        text-shadow: 0 0 12px #4895ef;
    }

    .title-divider {
        width: 80px;
        height: 4px;
        background: #4cc9f0;
        margin: 0 auto 25px auto;
        border-radius: 3px;
        box-shadow: 0 0 10px #4cc9f0;
    }

    .table { margin: 0 auto; width: 95%; }

    .table thead {
        background: #4cc9f0;
        color: #000;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .table tbody tr:hover {
        background-color: rgba(76, 201, 240, 0.08);
        transition: 0.3s;
    }

    .btn-primary {
        background: #4cc9f0;
        color: #000;
        border: none;
        border-radius: 10px;
        transition: 0.3s;
        font-weight: bold;
    }

    .btn-primary:hover {
        background: #4895ef;
        transform: scale(1.05);
        color: #fff;
    }

    .btn-secondary {
        border-radius: 10px;
        background-color: #3a0ca3;
        border: none;
        color: #fff;
    }

    .btn-secondary:hover {
        background-color: #480ca8;
        transform: scale(1.03);
    }

    .btn-danger {
        border-radius: 10px;
        background-color: #7209b7;
        border: none;
    }

    .btn-danger:hover {
        background-color: #560bad;
        transform: scale(1.05);
    }

    .role-badge {
        padding: 6px 12px;
        border-radius: 20px;
        font-weight: 500;
        color: #000;
    }

    .role-admin {
        background-color: #4cc9f0;
        color: #000;
        box-shadow: 0 0 10px #4cc9f0;
    }

    .role-coord {
        background-color: #ffd166;
        color: #000;
        box-shadow: 0 0 10px #ffd166;
    }

    .role-fan {
        background-color: #198754;
        color: #fff;
        box-shadow: 0 0 10px #198754;
    }

    select {
        background: rgba(0,0,0,0.3);
        color: #fff;
        border: 1px solid #4cc9f0;
    }

    /* 🔥 NUEVAS SECCIONES EXTRAS */
    .info-section {
        margin-top: 40px;
        padding: 25px;
        background: rgba(255,255,255,0.04);
        border-radius: 15px;
        border-left: 4px solid #4cc9f0;
        text-align: left;
    }

    .info-section h3 {
        color: #4cc9f0;
        text-shadow: 0 0 6px #4cc9f0;
    }

    .band-table {
        width: 100%;
        color: #eaf4ff;
        margin-top: 15px;
    }
    .band-table th {
        background: #4895ef;
        color: #000;
    }
</style>

<div class="container mt-5 mb-5">

    <a href="${pageContext.request.contextPath}/admin/dashboard_admin.jsp" class="btn btn-secondary mb-4">
        ⬅ Volver al Panel
    </a>

    <div class="card p-4">
        <h2>👥 Gestión de Usuarios y Roles</h2>
        <div class="title-divider"></div>

        <p class="text-center text-light mb-4">
            Administra los roles de la comunidad.  
            Promociona coordinadores, asigna administradores o elimina usuarios inactivos.
        </p>

        <div class="table-responsive">
            <table class="table table-hover align-middle text-center text-light">
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
                        <td><span class="role-badge <%= badgeClass %>"><%= roleName %></span></td>

                        <td>
                            <form action="${pageContext.request.contextPath}/updateRole" method="post" class="d-inline">
                                <input type="hidden" name="id" value="<%= u.getId() %>">

                                <select name="roleId" class="form-select d-inline w-auto">
                                    <option value="1" <%= u.getRoleId()==1?"selected":"" %>>ADMIN</option>
                                    <option value="2" <%= u.getRoleId()==2?"selected":"" %>>COORDINADOR</option>
                                    <option value="3" <%= u.getRoleId()==3?"selected":"" %>>FAN</option>
                                </select>

                                <button type="submit" class="btn btn-primary btn-sm ms-1">Actualizar</button>
                            </form>

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

    <!-- ========================================================= -->
    <!--     🔥🔥🔥 SECCIONES EXTRA QUE PEDISTE 🔥🔥🔥                -->
    <!-- ========================================================= -->

    <!-- INFORMACIÓN GENERAL -->
    <div class="info-section mt-5">
        <h3>ℹ️ Información Importante del Sistema</h3>
        <p>
            Como administrador puedes gestionar los roles de toda la comunidad.  
            Recuerda mantener un registro limpio, eliminar cuentas inactivas y promover coordinadores activos.
        </p>
        <p>
            La plataforma está diseñada para crecer con la comunidad y mejorar la organización de contenidos.
        </p>
    </div>

    <!-- TABLA EXTRA -->
    <div class="info-section mt-4">
        <h3>🎸 Bandas Famosas</h3>
        <table class="band-table table text-center">
            <thead>
                <tr>
                    <th>Banda</th>
                    <th>País</th>
                    <th>Género</th>
                    <th>Año de formación</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>Metallica</td>
                    <td>🇺🇸 EE.UU</td>
                    <td>Thrash Metal</td>
                    <td>1981</td>
                </tr>
                <tr>
                    <td>Iron Maiden</td>
                    <td>🇬🇧 Reino Unido</td>
                    <td>Heavy Metal</td>
                    <td>1975</td>
                </tr>
                <tr>
                    <td>Soda Stereo</td>
                    <td>🇦🇷 Argentina</td>
                    <td>Rock Alternativo</td>
                    <td>1982</td>
                </tr>
                <tr>
                    <td>Maná</td>
                    <td>🇲🇽 México</td>
                    <td>Rock Latino</td>
                    <td>1986</td>
                </tr>
            </tbody>
        </table>
    </div>

</div>

<%@ include file="../footer.jsp" %>
