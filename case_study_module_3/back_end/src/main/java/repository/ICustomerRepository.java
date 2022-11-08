package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer user);
    boolean updateUser(Customer user, int id);
    Customer selectUser(int id);

    public boolean deleteUser(int id);
    List<Customer> searchCountry(String count);
}
