package com.miapp.auth.dao;

import com.miapp.auth.model.Banda;
import com.miapp.auth.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BandaDAO {

    public List<Banda> listarBandas() {
        List<Banda> bandas = new ArrayList<>();
        String sql = "SELECT * FROM bandas";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Banda b = new Banda();
                b.setId(rs.getInt("id"));
                b.setNombre(rs.getString("nombre"));
                b.setPais(rs.getString("pais"));
                b.setSubgeneroId(rs.getInt("subgenero_id"));
                bandas.add(b);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar bandas: " + e.getMessage(), e);
        }
        return bandas;
    }

    public void agregarBanda(Banda b) {
        String sql = "INSERT INTO bandas (nombre, pais, subgenero_id) VALUES (?, ?, ?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, b.getNombre());
            ps.setString(2, b.getPais());
            ps.setInt(3, b.getSubgeneroId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error al agregar banda: " + e.getMessage(), e);
        }
    }
}
