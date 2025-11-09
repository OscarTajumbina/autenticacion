package com.miapp.auth.model;

public class Community {
    private int id;
    private String nombre;
    private String descripcion;
    private int creadaPor; // coincide con la columna creada_por

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public int getCreadaPor() { return creadaPor; }
    public void setCreadaPor(int creadaPor) { this.creadaPor = creadaPor; }
}
