package com.example.demo.dao;

import com.example.demo.model.Client;
import com.example.demo.model.Prospect;
import com.example.demo.model.User;
import com.example.demo.model.modelException;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;


public class DaoUser {
    public static User findByMail(String mail) throws Exception {
        try(Connection connection = Connexion.getInstance();
            PreparedStatement statement = connection.prepareStatement("SELECT Mail, UserName, Password FROM [dbo].[User] WHERE Mail = ?")) {
            statement.setString(1, mail);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String adresseMail = rs.getString("Mail");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                return new User(userName, adresseMail, password);
            } else{
                throw new daoException(Level.INFO, "Aucun User n'a été trouvé");
            }
        }catch(IOException | SQLException e){
            throw new daoException(Level.SEVERE,"find By name impossible, vérifiez votre base de données "+e.getMessage());
        }
        catch (modelException me) {
            throw new daoException(Level.SEVERE,"find By name impossible, données table incompatible avec l'objet "+me.getMessage());
        }
    }

    public static void create(User user) throws Exception {
        try (Connection connection = Connexion.getInstance();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO [dbo].[User] (Mail,UserName ,Password) VALUES (?,?,?)"
             )
        )
        {

            statement.setString(1, user.getMail());
            statement.setString(2, user.getUser());
            statement.setString(3, user.getPassword());

            statement.executeUpdate();
        } catch (SQLException e) {
            if (e.getErrorCode() == 2627) {
                throw new daoException(Level.INFO, "Le mail existe déja");
            } else {
                throw new daoException(Level.SEVERE, "erreur Create User " + e.getMessage() + " error : " + e.getErrorCode());
            }
        } catch (IOException ie) {
            throw new daoException(Level.SEVERE, "erreur Create User " + ie.getMessage());
        }
    }
}
