package com.example.demo.model;

import com.example.demo.utilities.VerifMail;

public class User {
    private String user;
    private String mail;
    private String password;

    public User(String user, String mail, String password) throws modelException {
        setUser(user);
        setMail(mail);
        setPassword(password);
    }

    public String getUser() {
        return this.user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getMail() {
        return this.mail;
    }

    public void setMail(String mail) throws modelException {
        if (VerifMail.validMail(mail)) {
            this.mail = mail;
        } else {
            throw new modelException("L'adresse mail n'est pas valide");
        }
    }

    public String getPassword() {
        return this.password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
