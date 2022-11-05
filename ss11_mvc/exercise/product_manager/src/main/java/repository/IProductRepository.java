package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void add(Product product);
    void delete(int id);
    void update();

    Product findByID(int id);
}
