package edu.fpt.vlxd.dao;

import edu.fpt.vlxd.context.DBContext;
import edu.fpt.vlxd.models.Account;
import edu.fpt.vlxd.models.Cart;
import edu.fpt.vlxd.models.Order;
import edu.fpt.vlxd.models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {

    public void orderCart(Account a) {
        // delete from [dbo].[Cart] where exists (
        // select oid from [Order] o
        // where o.oId = 6
        // and o.oId = [dbo].[Cart].[oId]
        // );
        String q = "update [Cart] \n" +
                "set [ordered] = 0\n" +
                "where [Cart].[uid] = " + a.getId() + ";";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public Cart getCart(Account a) {
        String query = "select c.[uid], c.[oid], o.[pid], o.[amount], c.[ordered]"
                + "FROM Wish.dbo.[Order] o INNER JOIN Wish.dbo.[Cart] c "
                + "ON o.oId = c.oId "
                + "WHERE c.[uid] = ? and c.[ordered] = 0;";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("DEBUG:" + a);
            ps.setInt(1, a.getId());
            ResultSet rs = ps.executeQuery();
            Cart c = new Cart();
            while (rs.next()) {
                int oid = rs.getInt(2);
                int amount = rs.getInt(4);
                Order order = new Order();
                order.setOid(oid);

                Product p = ProductDAO.getProductByID(String.valueOf(rs.getInt(3)));

                if (p == null) {
                    continue;
                }
                order.setProduct(p);
                order.setAmount(amount);
                order.setOrderStatus(rs.getInt(5));

                c.add(order);
            }
            System.out.println("CART: " + c.getOrders().size());
            if (c.getOrders().isEmpty()) {
                return null;
            }

            return c;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void addProductToCart(Account a, Product p, int amount) {
        Cart c = this.getCart(a);
        if (c == null || c.getOrders().isEmpty()) {
            this.addNewProductToCart(a, p, amount);
            return;
        }

        for (Order o : c.getOrders()) {
            if (o.getProduct().getId() == p.getId()) {
                this.increaseAmountOrder(o, amount);
                return;
            }
        }

        this.addNewProductToCart(a, p, amount);

    }

    public void addNewProductToCart(Account a, Product p, int amount) {
        // 1. Add product into [Order]
        // 2. link the account to order in [Cart]
        String query = "insert into [dbo].[Order] (pId, amount) values(?,?)";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, p.getId());
            ps.setInt(2, amount);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        query = "select [oid] from [Order] where oid=("
                + "select max([oid]) from [Order]);";
        int oid = -1;
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                oid = rs.getInt(1);
                System.out.println("GET oId = " + oid);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (oid == -1) {
            System.err.println("Failed to Add");
            return;
        }

        query = "insert into [dbo].[Cart] values(?,?,0)";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, a.getId());
            ps.setInt(2, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void increaseOrder(Account a, int oid) {
        Cart c = this.getCart(a);

        for (Order o : c.getOrders()) {
            if (o.getOid() == oid) {
                this.increaseAmountOrder(o, 1);
                return;
            }
        }

    }

    public void increaseAmountOrder(Order o, int amount) {
        int q = this.getQuantity(o.getOid());
        System.out.println("DEBUG: quantity = " + q);
        this.editQuantity(o.getOid(), (q + amount));
    }

    // lấy ra amount
    public int getQuantity(int oid) {
        String q = "select amount from [Order] o where o.oid = "
                + String.valueOf(oid) + ";";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int t = rs.getInt(1);
                System.out.println("DEBUG: quantity(" + oid + "): " + t);
                return t;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    // edit amount
    public void editQuantity(int oid, int quantity) {
        String q = "update [Order] set amount = " + String.valueOf(quantity)
                + " where oid = " + String.valueOf(oid);
        try {
            PreparedStatement ps = new DBContext().getConnection()
                    .prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void decreaseOrder(Account a, int oid) {
        Cart c = this.getCart(a);

        for (Order o : c.getOrders()) {
            if (o.getOid() == oid) {

                if (this.getQuantity(oid) == 1) {
                    this.deleteProductFromCart(o.getProduct().getId());
                } else {
                    this.increaseAmountOrder(o, -1);
                }

            }
        }

    }

    // Xoá sản phẩm khỏi Cart
    public void deleteProductFromCart(int pid) {
        // delete from [dbo].[Cart] where exists (
        // select oid from [Order] o
        // where o.oId = 6
        // and o.oId = [dbo].[Cart].[oId]
        // );
        String q = "delete from [Cart] where exists ("
                + "select oid from [Order] o "
                + "where o.pId = " + String.valueOf(pid)
                + "and o.oId = [Cart].[oId]);";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        q = "delete from [dbo].[Order] where [dbo].[Order].pID = ?;";

        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
