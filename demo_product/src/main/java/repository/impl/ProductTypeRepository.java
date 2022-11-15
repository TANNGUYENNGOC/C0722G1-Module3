package repository.impl;

import model.ProductType;
import repository.BaseRepository;
import repository.IProductTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductTypeRepository implements IProductTypeRepository {
    @Override
    public List<ProductType> findAll() {
        List<ProductType> productTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from product_type;");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                ProductType productType = new ProductType(id,name);
                productTypeList.add(productType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productTypeList;
    }
}
