package com.miapp.auth.model;

public class MiembroBanda {
    private int id;
    private int bandaId;
    private String nombre;
    private String instrumento;

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getBandaId() { return bandaId; }
    public void setBandaId(int bandaId) { this.bandaId = bandaId; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getInstrumento() { return instrumento; }
    public void setInstrumento(String instrumento) { this.instrumento = instrumento; }
}
