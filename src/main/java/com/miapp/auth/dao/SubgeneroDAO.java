package com.miapp.auth.dao;

import com.miapp.auth.model.Subgenero;
import com.miapp.auth.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubgeneroDAO {

    public List<Subgenero> listarSubgeneros() {
        List<Subgenero> lista = new ArrayList<>();
        String sql = "SELECT * FROM subgeneros";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Subgenero s = new Subgenero();
                s.setId(rs.getInt("id"));
                s.setNombre(rs.getString("nombre"));
                s.setDescripcion(rs.getString("descripcion"));
                lista.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar subgéneros: " + e.getMessage(), e);
        }
        return lista;
    }
}
