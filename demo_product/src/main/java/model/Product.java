package model;

public class Product {
    private int id;
    private String productCode;
    private String name;
    private int price;
    private ProductType productType;
    private int flag;

    public Product() {
    }

    public Product(int id, String productCode, String name, int price, ProductType productType) {
        this.id = id;
        this.productCode = productCode;
        this.name = name;
        this.price = price;
        this.productType = productType;
    }

    public Product(String productCode, String name, int price, ProductType productType, int flag) {
        this.productCode = productCode;
        this.name = name;
        this.price = price;
        this.productType = productType;
        this.flag = flag;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}
