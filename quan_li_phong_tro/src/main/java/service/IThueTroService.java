package service;

import model.ThueTro;

import java.util.List;

public interface IThueTroService {
    List<ThueTro> findAll();
    boolean add(ThueTro thueTro);
    boolean updateThueTro(ThueTro thueTro, int maPhongTro);
    ThueTro selectThueTro(int maPhongTro);

    boolean deleteThueTro(int maPhongTro);
    List<ThueTro> searchThueTro(String searchInput);
}
