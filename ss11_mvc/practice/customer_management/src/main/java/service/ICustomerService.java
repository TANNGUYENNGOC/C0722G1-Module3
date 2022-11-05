package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    //Trả về danh sách tất cả khách hàng
    List<Customer> findAll();

    //Lưu 1 khách hàng
    void save(Customer customer);

    //Tìm 1 khách hàng theo ID
    Customer findById(int id);

    //Cập nhật thông tin của 1 khách hàng
    void update(int id, Customer customer);

    //Xóa 1 khách hàng ra khỏi danh sách theo ID
    void remove(int id);
}
