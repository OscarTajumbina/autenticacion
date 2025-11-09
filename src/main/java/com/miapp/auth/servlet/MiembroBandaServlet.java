package com.miapp.auth.servlet;

import com.miapp.auth.model.MiembroBanda;
import com.miapp.auth.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/miembros")
public class MiembroBandaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String bandaIdStr = req.getParameter("bandaId");
        if (bandaIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/bandas");
            return;
        }

        int bandaId = Integer.parseInt(bandaIdStr);
        List<MiembroBanda> miembros = new ArrayList<>();

        String sql = "SELECT * FROM miembros_banda WHERE banda_id = ?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, bandaId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MiembroBanda m = new MiembroBanda();
                m.setId(rs.getInt("id"));
                m.setBandaId(rs.getInt("banda_id"));
                m.setNombre(rs.getString("nombre"));
                m.setInstrumento(rs.getString("instrumento"));
                miembros.add(m);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar miembros: " + e.getMessage(), e);
        }

        req.setAttribute("miembros", miembros);
        req.getRequestDispatcher("/admin/miembros.jsp").forward(req, resp);
    }
}
