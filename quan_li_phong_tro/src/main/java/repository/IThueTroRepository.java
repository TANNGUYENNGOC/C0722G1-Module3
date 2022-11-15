package repository;

import model.ThueTro;

import java.util.List;

public interface IThueTroRepository {
    List<ThueTro> findAll();
    boolean add(ThueTro thueTro);
    boolean updateThueTro(ThueTro thueTro, int maPhongTro);
    ThueTro selectThueTro(int maPhongTro);

    boolean deleteThueTro(int maPhongTro);
    List<ThueTro> searchThueTro(String searchInput);
}
