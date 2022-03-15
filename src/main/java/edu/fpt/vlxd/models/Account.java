package edu.fpt.vlxd.models;

import lombok.*;

@Data
@NoArgsConstructor
public class Account {
    private int id;
    private String user;
    private String pass;
    private int isSell;
    private int isAdmin;


	public Account(int id, String user, String pass, int isSell, int isAdmin) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }
}
