package service.impl;

import model.ProductType;
import repository.IProductTypeRepository;
import repository.impl.ProductTypeRepository;
import service.IProductTypeService;

import java.util.List;

public class ProductTypeService implements IProductTypeService {
    private IProductTypeRepository productTypeRepository = new ProductTypeRepository();
    @Override
    public List<ProductType> findAll() {
        return productTypeRepository.findAll();
    }
}
