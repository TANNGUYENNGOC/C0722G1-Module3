package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> findAll();
    boolean add(User user);
    boolean updateUser(User user, int id);
    User selectUser(int id);
    boolean deleteUser(int id) throws SQLException;

}
