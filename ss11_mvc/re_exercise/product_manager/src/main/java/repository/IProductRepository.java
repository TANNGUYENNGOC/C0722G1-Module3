package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    Product findByID(int id);
    void update(Product product, int id);
    List<Product> searchName(String name);
}
