package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean updateCustomer(Customer customer, int id);
    Customer selectCustomer(int id);

    public boolean deleteCustomer(int id);
    List<Customer> searchCustomer(String nameSearch);
}
