package com.miapp.auth.dao;

import com.miapp.auth.model.Community;
import com.miapp.auth.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommunityDAO {

    public List<Community> findAll() {
        List<Community> list = new ArrayList<>();
        String sql = "SELECT id, nombre, descripcion, creada_por FROM comunidades";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Community c = new Community();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setDescripcion(rs.getString("descripcion"));
                // usar exactamente el nombre de columna que tienes en la BD: "creada_por"
                c.setCreadaPor(rs.getInt("creada_por"));
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void create(String nombre, String descripcion, int creadaPor) {
        String sql = "INSERT INTO comunidades (nombre, descripcion, creada_por) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setInt(3, creadaPor);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(int id, String nombre, String descripcion) {
        String sql = "UPDATE comunidades SET nombre = ?, descripcion = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setInt(3, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM comunidades WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
