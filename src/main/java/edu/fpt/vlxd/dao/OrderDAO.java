package edu.fpt.vlxd.dao;

import edu.fpt.vlxd.context.DBContext;
import edu.fpt.vlxd.models.Account;
import edu.fpt.vlxd.models.Cart;
import edu.fpt.vlxd.models.Order;
import edu.fpt.vlxd.models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    // Phục vụ view order
    // (ordered =1)
    public List<Order> getReceipts(Account a) {
        String query = "select c.[uid], c.[oid], o.[pid], o.[amount], c.[ordered]"
                + "FROM Wish.dbo.[Order] o INNER JOIN Wish.dbo.[Cart] c "
                + "ON o.oId = c.oId "
                + "WHERE c.[uid] = ? and c.[ordered] = 1;";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("DEBUG:" + a);
            ps.setInt(1, a.getId());
            ResultSet rs = ps.executeQuery();

            List<Order> result = new ArrayList<>();

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

                result.add(order);
            }

            System.out.println(result.size());

            if (result.isEmpty()) {
                return null;
            }

            return result;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //
    public void purchase(Account a) {
        Cart c = CartDAO.getCart(a);

        if (c == null || c.getOrders().isEmpty()) {
            return;
        }

        for (Order o : c.getOrders()) {
            this.purchaseOrder(o.getOid());
        }

    }

    public void purchaseOrder(int oid) {
        String q = "update [Cart] set [ordered]=1 where [Cart].[oid] = " + oid + ";";
        try {
            Connection conn = new DBContext().getConnection();// mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrders() {
        List<Order> result = new ArrayList<>();
        List<Account> acc = AccountDAO.getSellAccount();

        for (Account a : acc) {
            Cart c = CartDAO.getCart(a);
            if (c != null) {
                result.addAll(c.getOrders());
            }
        }

        return result;
    }
}
