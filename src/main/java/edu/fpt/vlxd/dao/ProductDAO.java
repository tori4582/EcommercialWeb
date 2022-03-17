package edu.fpt.vlxd.dao;

import com.sun.org.apache.bcel.internal.generic.RET;
import edu.fpt.vlxd.context.DBContext;
import edu.fpt.vlxd.models.Category;

import edu.fpt.vlxd.models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // hiển thị all product, all category, search, newest product
        public List<Product> getAllProduct() {
                List<Product> list = new ArrayList<>();
                String query = "select * from product";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return list;
        }

        // Lấy 3 sản phẩm đầu
        public List<Product> getTop3() {
                List<Product> list = new ArrayList<>();
                String query = "select top 3 * from product";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return list;
        }

        // lấy 3 sản phẩm tiếp
        public List<Product> getNext3Product(int amount) {
                List<Product> list = new ArrayList<>();
                String query = "SELECT *\n"
                + "  FROM product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, amount);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return list;
        }

        // Lấy product theo Category ID
        public List<Product> getProductByCID(String cid) {
                List<Product> list = new ArrayList<>();
                String query = "select * from product\n"
                + "where cateID = ?";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setString(1, cid);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return list;
        }

        // Lấy Product theo ID
        public static Product getProductByID(String id) {
                String query = "select * from product\n"
                + "where id = ?";
                try {
                        Connection connection = new DBContext().getConnection();// mo ket noi voi sql
                        PreparedStatement ps = connection.prepareStatement(query);
                        ps.setString(1, id);
                        ResultSet resultSet = ps.executeQuery();
                        while (resultSet.next()) {
                                return new Product(resultSet.getInt(1),
                                resultSet.getString(2),
                                resultSet.getString(3),
                                resultSet.getDouble(4),
                                resultSet.getString(5),
                                resultSet.getString(6));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return null;
        }

        // Lấy Product theo Sell_ID
        public List<Product> getProductBySellID(int id) {
                List<Product> list = new ArrayList<>();
                String query = "select * from product\n"
                + "where sell_ID = ?";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, id);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return list;
        }
        
        //Lấy ra toàn bộ Category
        public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

        // Lấy Product cuối cùng - Last (có thể dùng cho Newest)
        // newest
        public Product getLast() {
                String query = "select top 1 * from product\n"
                + "order by id desc";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                                return new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6));
                        }
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return null;
        }

        //Sắp xếp sp gia tăng dần
        public List<Product> getIncrease(String cid){
             List<Product> list = new ArrayList<>();
             String query = "select * from dbo.product where cateID =? order by price asc";
             try{
                 conn = new DBContext().getConnection();
                 ps = conn.prepareStatement(query);
                 ps.setString(1, cid);
                 while(rs.next()){
                     list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                 }
             } catch (Exception e){
               e.printStackTrace();
        }
          return list;
        }
        //Sắp xếp sp giảm dần
         public List<Product> getDecrease(String cid){
             List<Product> list = new ArrayList<>();
             String query = "select * from dbo.product where cateID = ? order by price desc";
             try{
                 conn = new DBContext().getConnection();
                 ps = conn.prepareStatement(query);
                 ps.setString(1, cid);
                 while(rs.next()){
                     list.add(new Product(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getDouble(4),
                                rs.getString(5),
                                rs.getString(6)));
                 }
             } catch (Exception e){
               e.printStackTrace();
        }
          return list;
        } 
        // Thêm, sửa, xóa product
        public void deleteProduct(String pid) {
                String query = "delete from product\n"
                + "where id = ?";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setString(1, pid);
                        ps.executeUpdate();
                } catch (Exception e) {
                        e.printStackTrace();
                }
        }

        public void insertProduct(String name, String image, String price,
        String title, String description, String category, int sid) {
                String query = "INSERT [dbo].[product] \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?)";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setString(1, name);
                        ps.setString(2, image);
                        ps.setString(3, price);
                        ps.setString(4, title);
                        ps.setString(5, description);
                        ps.setString(6, category);
                        ps.setInt(7, sid);
                        ps.executeUpdate();
                } catch (Exception e) {
                        e.printStackTrace();
                }
        }

        public void editProduct(String name, String image, String price,
        String title, String description, String category, String pid) {
                String query = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cateID = ?\n"
                + "where id = ?";
                try {
                        conn = new DBContext().getConnection();// mo ket noi voi sql
                        ps = conn.prepareStatement(query);
                        ps.setString(1, name);
                        ps.setString(2, image);
                        ps.setString(3, price);
                        ps.setString(4, title);
                        ps.setString(5, description);
                        ps.setString(6, category);
                        ps.setString(7, pid);
                        ps.executeUpdate();
                } catch (Exception e) {
                        e.printStackTrace();
                }
        }

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                    new Category(rs.getInt(1),rs.getString(2))
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
