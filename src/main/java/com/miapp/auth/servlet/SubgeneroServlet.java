package com.miapp.auth.servlet;

import com.miapp.auth.dao.SubgeneroDAO;
import com.miapp.auth.model.Subgenero;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/subgeneros")
public class SubgeneroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        SubgeneroDAO dao = new SubgeneroDAO();
        List<Subgenero> lista = dao.listarSubgeneros();

        req.setAttribute("subgeneros", lista);
        req.getRequestDispatcher("/admin/subgeneros.jsp").forward(req, resp);
    }
}
