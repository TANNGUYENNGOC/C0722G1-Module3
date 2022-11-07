package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
     private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete( int id) {
        productRepository.delete(id);
    }

    @Override
    public Product findByID(int id) {
        return productRepository.findByID(id);
    }

    @Override
    public void update(Product product, int id) {
        productRepository.update(product,id);
    }

    @Override
    public List<Product> searchName(String name) {
        return productRepository.searchName(name);
    }
}
