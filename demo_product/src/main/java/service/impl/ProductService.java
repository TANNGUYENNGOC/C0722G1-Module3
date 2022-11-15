package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;
import validation.Validation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Map<String,String> add(Product product) {

        Map<String,String> errorMap = new HashMap<>();
        if ("".equals(product.getProductCode())){
            errorMap.put("productCode","Không được để trống");
        }else if (!Validation.checkCode(product.getProductCode())){
            errorMap.put("productCode","Không đúng định dạng");
        }
        if (product.getPrice()<0){
            errorMap.put("price","giá không đc nhỏ hơn 0");
        }
        if (errorMap.isEmpty()){
            productRepository.add(product);
        }
        // kiểm tra dữ liệu
        // ok thì mới lưu

        return errorMap;
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }
}
