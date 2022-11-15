package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    boolean add(Product product);
    boolean delete(int id);
}
