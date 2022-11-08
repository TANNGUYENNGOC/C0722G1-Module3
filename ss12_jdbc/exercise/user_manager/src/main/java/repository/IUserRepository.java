package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    boolean add(User user);
    boolean updateUser(User user, int id);
    User selectUser(int id);

    boolean deleteUser(int id) throws SQLException;
    List<User> searchCountry(String count);

    List<User> sortName();
}
