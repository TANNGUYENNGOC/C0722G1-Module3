package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "IPhone12", 12000, "Điện thoại xịn", "Apple"));
        productList.add(new Product(2, "IPhone12", 12000, "Điện thoại xịn", "Apple"));
        productList.add(new Product(3, "IPhone12", 12000, "Điện thoại xịn", "Apple"));
        productList.add(new Product(4, "IPhone12", 12000, "Điện thoại xịn", "Apple"));
        productList.add(new Product(5, "IPhone12", 12000, "Điện thoại xịn", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getiD() == id) {
                productList.remove(productList.get(i));
            }
        }
    }

    @Override
    public Product findByID(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getiD() == id) {
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public void update(Product product, int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getiD()==id){
                productList.add(product);
            }
        }
    }
}
