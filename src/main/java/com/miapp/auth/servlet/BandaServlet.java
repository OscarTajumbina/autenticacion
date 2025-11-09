package com.miapp.auth.servlet;

import com.miapp.auth.dao.BandaDAO;
import com.miapp.auth.dao.SubgeneroDAO;
import com.miapp.auth.model.Banda;
import com.miapp.auth.model.Subgenero;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/bandas")
public class BandaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        BandaDAO bandaDAO = new BandaDAO();
        SubgeneroDAO subgeneroDAO = new SubgeneroDAO();

        // Listar todas las bandas
        List<Banda> bandas = bandaDAO.listarBandas();
        List<Subgenero> subgeneros = subgeneroDAO.listarSubgeneros();

        req.setAttribute("bandas", bandas);
        req.setAttribute("subgeneros", subgeneros);

        req.getRequestDispatcher("/admin/bandas.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        String pais = req.getParameter("pais");
        String subgeneroIdStr = req.getParameter("subgenero_id");

        if (nombre == null || pais == null || subgeneroIdStr == null ||
                nombre.isBlank() || pais.isBlank() || subgeneroIdStr.isBlank()) {
            req.getSession().setAttribute("error", "⚠️ Todos los campos son obligatorios.");
            resp.sendRedirect(req.getContextPath() + "/bandas");
            return;
        }

        int subgeneroId = Integer.parseInt(subgeneroIdStr);

        Banda b = new Banda();
        b.setNombre(nombre);
        b.setPais(pais);
        b.setSubgeneroId(subgeneroId);

        try {
            new BandaDAO().agregarBanda(b);
            req.getSession().setAttribute("success", "✅ Banda agregada exitosamente.");
        } catch (Exception e) {
            req.getSession().setAttribute("error", "❌ Error al agregar banda: " + e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/bandas");
    }
}
