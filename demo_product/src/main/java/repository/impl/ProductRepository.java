package repository.impl;

import model.Product;
import model.ProductType;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT_ALL = "select p.*, pt.name as type_name from product p join product_type  pt" +
            " on p.product_type_id=pt.id where p.flag=1;";
    private final String DELETE_BY_ID = "update product set flag=0 where id =?;";
    private final String INSERT_INTO = "insert into product (product_code,name,price,product_type_id,flag) values(?,?,?,?,?);";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productCode = resultSet.getString("product_code");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int productTypeId = resultSet.getInt("product_type_id");
                String typeName = resultSet.getString("type_name");
                ProductType productType = new ProductType(productTypeId, typeName);
                Product product = new Product(id, productCode, name, price, productType);
                productList.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_INTO);
            ps.setString(1, product.getProductCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getPrice());
            ps.setInt(4, product.getProductType().getId());
            ps.setInt(5, product.getFlag());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_BY_ID);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
