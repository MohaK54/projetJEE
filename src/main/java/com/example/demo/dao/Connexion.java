package com.example.demo.dao;

import com.example.demo.utilities.MyLogg;
import javax.swing.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

/**
 * La connexion à la base de données
 */
public class Connexion {
    private static Connection connexion;

    /**
     * Initialise une connexion à la base de données en utilisant les informations du fichier de propriétés.
     *
     * @throws IOException Si une exception d'entrée/sortie survient lors de la lecture du fichier de propriétés.
     */
    public static void MyConnexion() throws IOException {
        // Informations de connexion
        /*Properties dataProperties = new Properties();
        File fichier = new File("ddb.properties");
        FileInputStream inputStream = new FileInputStream(fichier);
        dataProperties.load(inputStream);
        String url = dataProperties.getProperty("url");*/
        // Connexion à la base de données
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connexion = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Reverso;IntegratedSecurity=true;encrypt=true;trustServerCertificate=true");
        } catch (SQLException sqlException) {
            MyLogg.LOGGER.log(Level.SEVERE, "Connexion échouée : " + sqlException.getMessage());
            JOptionPane.showMessageDialog(null,"Oups, erreur de notre côté veuillez réssayer ultérieurement");
            System.exit(1);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Récupère une instance de la connexion à la base de données.
     *
     * @return La connexion à la base de données.
     * @throws SQLException Si une exception SQL survient lors de la connexion.
     * @throws IOException  Si une exception d'entrée/sortie survient lors de la lecture du fichier de propriétés.
     */
    public static Connection getInstance() throws SQLException, IOException {
        if (connexion == null || connexion.isClosed()) {
            MyConnexion();
        }
        return connexion;
    }

    static {
        Runtime.getRuntime().addShutdownHook(new Thread() {
            public void run() {
                if (connexion != null) {
                    try {
                        MyLogg.LOGGER.info("Base de données fermée.");
                        connexion.close();
                    } catch (SQLException e) {
                        MyLogg.LOGGER.log(Level.SEVERE, e.getMessage());
                    }
                }
            }
        });
    }
}
