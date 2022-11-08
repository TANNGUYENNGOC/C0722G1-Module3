package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select*from customer ORDER BY id;";
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                int idCard = resultSet.getInt("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean add(Customer user) {
        return false;
    }

    @Override
    public boolean updateUser(Customer user, int id) {
        return false;
    }

    @Override
    public Customer selectUser(int id) {
        return null;
    }

    @Override
    public boolean deleteUser(int id) {
        return false;
    }

    @Override
    public List<Customer> searchCountry(String count) {
        return null;
    }
}
