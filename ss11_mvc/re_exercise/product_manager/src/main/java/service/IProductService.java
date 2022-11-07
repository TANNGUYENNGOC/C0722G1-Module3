package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    Product findByID(int id);
    void update(Product product, int id);
    List<Product> searchName(String name);
}
