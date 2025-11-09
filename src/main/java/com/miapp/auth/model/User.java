package com.miapp.auth.model;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String username;
    private String email;
    private String password;
    private int roleId;
    private String roleName;

    public User() {}

    public User(int id, String username, String email, String password, int roleId) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        setRoleId(roleId);
    }

    // ---- Getters & Setters ----
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public int getRoleId() { return roleId; }
    public void setRoleId(int roleId) {
        this.roleId = roleId;
        // switch tradicional, compatible con todas las versiones de Java
        switch (roleId) {
            case 1:
                this.roleName = "ADMIN";
                break;
            case 2:
                this.roleName = "COORDINADOR";
                break;
            case 3:
                this.roleName = "FAN";
                break;
            default:
                this.roleName = "DESCONOCIDO";
                break;
        }
    }

    public String getRoleName() { return roleName; }
    public void setRoleName(String roleName) { this.roleName = roleName; }
}
