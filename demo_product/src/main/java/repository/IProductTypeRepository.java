package repository;

import model.ProductType;

import java.util.List;

public interface IProductTypeRepository {
    List<ProductType> findAll();
}
