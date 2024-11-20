package products;

public class productsDTO {

    private int id;
    private String name;
    private String description;
    private double price;
    private String image;
    private String category_name;
    private boolean is_in_stock;
    private String created_at;

    public productsDTO() {
    }

    public productsDTO(int id, String name, String description, double price, String image, String category_name, boolean is_in_stock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
        this.category_name = category_name;
        this.is_in_stock = is_in_stock;
    }

    public productsDTO(String name, String description, double price, String image, String category_name, boolean status) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
        this.category_name = category_name;
        this.is_in_stock = is_in_stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public boolean getIs_in_stock() {
        return is_in_stock;
    }

    public void setIs_in_stock(boolean is_in_stock) {
        this.is_in_stock = is_in_stock;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

}
