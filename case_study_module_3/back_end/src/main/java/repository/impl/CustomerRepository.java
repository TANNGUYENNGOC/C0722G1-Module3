package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "SELECT*FROM customer;";
    private final String INSERT_CUSTOMER = "insert into customer(customer_type_id, name, date_of_birth,gender,id_card,phone_number,email,address) values(?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where id =?";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?,name= ?, date_of_birth =?,gender=?,id_card=?,phone_number=?,email=?,address=? where id = ?;";
    private static final String SELECT_NAME_CUSTOMER_SQL = "SELECT*FROM customer WHERE name LIKE ?;";
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
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER);
            ps.setInt(1,customer.getCustomerTypeId());
            ps.setString(2,customer.getName());
            ps.setDate(3,customer.getDateOfBirth());
            ps.setBoolean(4,customer.isGender());
            ps.setString(5,customer.getIdCard());
            ps.setString(6,customer.getPhoneNumber());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer, int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
            ps.setInt(1,customer.getCustomerTypeId());
            ps.setString(2,customer.getName());
            ps.setDate(3,customer.getDateOfBirth());
            ps.setBoolean(4,customer.isGender());
            ps.setInt(   5,Integer.parseInt(customer.getIdCard()));
            ps.setString(6,customer.getPhoneNumber());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            ps.setInt(9,id);
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customer = new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean rowDeleted = false;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
            preparedStatement.setInt(1,id);
            rowDeleted = preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public List<Customer> searchCustomer(String nameSearch) {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_NAME_CUSTOMER_SQL);
            ps.setString(1,"%" +nameSearch+ "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){

                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customer = new Customer(customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
