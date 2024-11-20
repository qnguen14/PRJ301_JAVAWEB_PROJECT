package orders;

import java.util.Date;
import java.util.List;

public class OrderDTO {
    private int id;
    private int userId;
    private Date orderDate;
    private double totalPrice;
    private List<ItemDTO> items; // Assuming you have an ItemDTO class for order items

    public OrderDTO() {
    }

    public OrderDTO(int id, int userId, Date orderDate, double totalPrice, List<ItemDTO> items) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<ItemDTO> getItems() {
        return items;
    }

    public void setItems(List<ItemDTO> items) {
        this.items = items;
    }
}
