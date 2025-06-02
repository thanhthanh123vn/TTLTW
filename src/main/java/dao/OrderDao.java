package dao;

import object.Order;
import object.OrderDetail;
import object.Product;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class OrderDao {
    private Utils utils;
    private Connection conn;

    public OrderDao() {
        utils = new Utils();
        conn = utils.getConnection();
    }

    // Add method to close connection
    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateOrderStatus(Order order) {
        String sql = "UPDATE Orders\n"
                + "   SET Status = ?\n"
                + " WHERE orderID = ?";
        try (PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, order.getStatus());
            st.setInt(2, order.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            closeConnection();
        }
        return false;
    }

    public List<Order> getUserOrder() {
        List<Order> userOrder = new ArrayList<Order>();
        String sql = "SELECT DISTINCT ua.userid, ua.fullName, ua.address, ua.phone, o.orderDate\n" +
                "FROM usersarress ua\n" +
                "JOIN orders o ON ua.userid = o.userid\n" +
                "JOIN orderdetails od ON od.orderid = o.orderid\n" +
                "JOIN products p ON p.id = od.productid;";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("userid"));
                order.setUserName(rs.getString("fullName"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setCreate_date(rs.getDate("orderDate"));
                userOrder.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return userOrder;
    }

    public List<OrderDetail> getOrderDetails(int index) {
        List<OrderDetail> orderDetailsList = new ArrayList<>();
        String sql = "SELECT ua.fullName, ua.address, ua.phone, \n" +
                "                od.quantity, od.price, p.id, p.name, p.price \n" +
                "                FROM usersarress ua \n" +
                "                JOIN orders o ON ua.userid = o.userid \n" +
                "                JOIN orderdetails od ON od.orderid = o.orderid  \n" +
                "                JOIN products p ON p.id = od.productid \n" +
                "                WHERE ua.userid = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, index);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setRecipientName(fullName);
                    orderDetail.setPhoneNumber(phone);
                    orderDetail.setAddress(address);
                    orderDetail.setProductList(Collections.singletonList(product));
                    orderDetail.setTotalQuantity(quantity);
                    orderDetail.setTotalPrice(quantity * price);

                    orderDetailsList.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return orderDetailsList;
    }

    public int insertOrderWithDetails(Order order, List<OrderDetail> orderDetailsList) {
        String insertOrderSQL = "INSERT INTO orders (UserID, OrderDate, Status) VALUES (?, ?, ?)";
        String insertOrderDetailSQL = "INSERT INTO orderdetails (OrderID, ProductID, UserId, Quantity, Price) VALUES (?, ?, ?, ?, ?)";
        int orderId = 0;

        try {
            conn.setAutoCommit(false);

            try (PreparedStatement orderPs = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {
                orderPs.setInt(1, order.getUserId());
                orderPs.setDate(2, new Date(order.getCreate_date().getTime()));
                orderPs.setString(3, order.getStatus() != null ? order.getStatus() : "Pending");
                int orderRows = orderPs.executeUpdate();

                if (orderRows > 0) {
                    try (ResultSet generatedKeys = orderPs.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            orderId = generatedKeys.getInt(1);

                            try (PreparedStatement detailPs = conn.prepareStatement(insertOrderDetailSQL)) {
                                for (OrderDetail orderDetail : orderDetailsList) {
                                    detailPs.setInt(1, orderId);
                                    detailPs.setInt(2, orderDetail.getProductId());
                                    detailPs.setInt(3, order.getUserId());
                                    detailPs.setInt(4, orderDetail.getTotalQuantity());
                                    detailPs.setDouble(5, orderDetail.getTotalPrice());
                                    detailPs.addBatch();
                                }

                                int[] detailRows = detailPs.executeBatch();
                                boolean allDetailsInserted = true;
                                for(int rowCount : detailRows) {
                                    if(rowCount <= 0) {
                                        allDetailsInserted = false;
                                        break;
                                    }
                                }

                                if (allDetailsInserted) {
                                    System.out.println("Them Order Thanh Cong voi " + detailRows.length + " chi tiet.");
                                    conn.commit();
                                    return orderId;
                                }
                            }
                        }
                    }
                }
            }

            conn.rollback();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            closeConnection();
        }
        return 0;
    }

    public boolean checkUserID(int userID) {
        String sql = "select id from users";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                if(userID == rs.getInt("id")) {
                    return true;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean removerOrder(int id) {
        String sql = "DELETE FROM orders WHERE UserId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean removerOrderDetail(int id, int productId) {
        String sql = "DELETE FROM orderdetails WHERE UserId = ? AND ProductID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setInt(2, productId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }

    public int productCount(List<Product> list) {
        int count = 0;
        for (Product product : list) {
            count += product.getQuantity();
        }
        return count;
    }
}



