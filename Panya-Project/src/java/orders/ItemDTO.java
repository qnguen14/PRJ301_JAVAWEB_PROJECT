
package orders;

import products.productsDTO;

public class ItemDTO {
    private productsDTO product;
    private int quantity;
    private double price;
    private int order_id;

    public ItemDTO() {
    }

    public ItemDTO(productsDTO product, int quantity, double price, int order_id) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.order_id = order_id;
    }

    public productsDTO getProduct() {
        return product;
    }

    public void setProduct(productsDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

 
    
    
}
