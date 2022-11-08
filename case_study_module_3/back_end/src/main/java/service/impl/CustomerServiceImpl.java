package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
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
