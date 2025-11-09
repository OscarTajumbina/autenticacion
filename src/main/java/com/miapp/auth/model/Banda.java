package com.miapp.auth.model;

public class Banda {
    private int id;
    private String nombre;
    private String pais;
    private int subgeneroId;
    private String subgeneroNombre;

    public Banda() {}

    public Banda(int id, String nombre, String pais, int subgeneroId, String subgeneroNombre) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.subgeneroId = subgeneroId;
        this.subgeneroNombre = subgeneroNombre;
    }

    // ✅ Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getSubgeneroId() {
        return subgeneroId;
    }

    public void setSubgeneroId(int subgeneroId) {
        this.subgeneroId = subgeneroId;
    }

    public String getSubgeneroNombre() {
        return subgeneroNombre;
    }

    public void setSubgeneroNombre(String subgeneroNombre) {
        this.subgeneroNombre = subgeneroNombre;
    }

    @Override
    public String toString() {
        return "Banda{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", pais='" + pais + '\'' +
                ", subgeneroId=" + subgeneroId +
                ", subgeneroNombre='" + subgeneroNombre + '\'' +
                '}';
    }
}
