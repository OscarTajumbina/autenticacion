package com.miapp.auth.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    // 🔹 Cambiado el nombre de la base de datos a 'foro_rock'
    private static final String URL = "jdbc:mysql://localhost:3306/foro_rock?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root"; 
    private static final String PASSWORD = "0000"; 

    static {
        try {
            // Registrar el driver JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("❌ MySQL Driver no encontrado. Asegúrate de tener el conector JDBC en las dependencias.", e);
        }
    }

    public static Connection getConnection() {
        try {
            // Establecer conexión con la base de datos
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.err.println("❌ Error al conectar con la base de datos: " + e.getMessage());
            throw new RuntimeException("Error al conectar con la base de datos foro_rock", e);
        }
    }
}
