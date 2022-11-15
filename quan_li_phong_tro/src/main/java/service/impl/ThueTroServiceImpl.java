package service.impl;

import model.ThueTro;
import repository.IThueTroRepository;
import repository.impl.ThueTroRepositoryImpl;
import service.IThueTroService;

import java.util.List;

public class ThueTroServiceImpl implements IThueTroService {
    IThueTroRepository thueTroRepository = new ThueTroRepositoryImpl();
    @Override
    public List<ThueTro> findAll() {
        return thueTroRepository.findAll();
    }

    @Override
    public boolean add(ThueTro thueTro) {
        return thueTroRepository.add(thueTro);
    }

    @Override
    public boolean updateThueTro(ThueTro thueTro, int maPhongTro) {
        return thueTroRepository.updateThueTro(thueTro,maPhongTro);
    }

    @Override
    public ThueTro selectThueTro(int maPhongTro) {
        return thueTroRepository.selectThueTro(maPhongTro);
    }

    @Override
    public boolean deleteThueTro(int maPhongTro) {
        return thueTroRepository.deleteThueTro(maPhongTro);
    }

    @Override
    public List<ThueTro> searchThueTro(String searchInput) {
        return thueTroRepository.searchThueTro(searchInput);
    }


}
