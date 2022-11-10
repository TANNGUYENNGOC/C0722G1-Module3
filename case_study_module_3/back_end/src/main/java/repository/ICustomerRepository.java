package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer user);
    boolean updateCustomer(Customer user, int id);
    Customer selectCustomer(int id);

    public boolean deleteCustomer(int id);
    List<Customer> searchCustomer(String nameSearch);
}
