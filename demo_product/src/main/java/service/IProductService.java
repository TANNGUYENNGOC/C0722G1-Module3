package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> findAll();
    Map<String,String> add(Product product);
    boolean delete(int id);
}
