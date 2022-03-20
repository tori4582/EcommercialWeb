package edu.fpt.vlxd.dao;

import edu.fpt.vlxd.models.Account;
import edu.fpt.vlxd.context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Login, kiểm tra tk, signup, delete acc
    public Account login(String user, String pass) {
        String query = "select * from [Account] a where a.[user] = '" + user
                + "'and a.[pass] = '" + pass + "'";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int uid = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                int isSell = rs.getInt(4);
                int isAdmin = rs.getInt(5);

                return new Account(uid, user, pass, isSell, isAdmin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Account> getAllUsers() {
        List<Account> list = new ArrayList<>();

        String query = "SELECT * FROM [Account] a";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Account a = new Account();

                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setIsSell(rs.getInt(4));
                a.setIsAdmin(rs.getInt(5));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection();// mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void singup(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,1,0)";
        try {
            conn = new DBContext().getConnection();// mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static List<Account> getSellAccount() {

        List<Account> list = new ArrayList<>();

        String query = "SELECT * FROM [Account] a WHERE a.isSell = 1;";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Account a = new Account();

                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setIsSell(1);
                a.setIsAdmin(0);

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteAccount(int uid) {
        String query = "delete from [Account]\n"
                + "where [uId] = ?";
        try {
            conn = new DBContext().getConnection();// mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editAccount(String username, String password) {
        String q = "update [Account] set [pass]=" + password + ""
                + "where [Account].[user] = '" + username + "';";
        try {
            conn = new DBContext().getConnection();// mo ket noi voi sql
            ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
