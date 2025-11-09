package com.miapp.auth.dao;

import com.miapp.auth.util.DBUtil;
import java.sql.*;
import java.util.*;

public class ForumDAO {

    // Crear nueva publicación
    public void create(int comunidadId, int usuarioId, String titulo, String contenido) {
        String sql = "INSERT INTO publicaciones (comunidad_id, usuario_id, titulo, contenido, fecha_publicacion) VALUES (?, ?, ?, ?, NOW())";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, comunidadId);
            ps.setInt(2, usuarioId);
            ps.setString(3, titulo);
            ps.setString(4, contenido);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creando publicación: " + e.getMessage(), e);
        }
    }

    // Listar publicaciones por comunidad
    public List<Map<String, Object>> listByCommunity(int comunidadId) {
    List<Map<String, Object>> mensajes = new ArrayList<>();
    String sql = "SELECT p.id, p.titulo, p.contenido, p.fecha_publicacion AS fecha, "
               + "u.username AS usuario "
               + "FROM publicaciones p "
               + "JOIN users u ON p.usuario_id = u.id "
               + "WHERE p.comunidad_id = ? "
               + "ORDER BY p.fecha_publicacion DESC";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, comunidadId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id", rs.getInt("id"));
                m.put("titulo", rs.getString("titulo"));
                m.put("contenido", rs.getString("contenido"));
                m.put("fecha", rs.getTimestamp("fecha"));
                m.put("usuario", rs.getString("usuario"));
                mensajes.add(m);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new RuntimeException("Error al listar publicaciones: " + e.getMessage(), e);
    }

    return mensajes;
}

}
