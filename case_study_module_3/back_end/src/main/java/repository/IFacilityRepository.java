package repository;

import model.Customer;
import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();
    boolean add(Facility facility);
    boolean updateFacility(Facility facility, int id);
    Facility selectFacility(int id);

    boolean deleteFacility(int id);
    List<Facility> searchFacility(String nameSearch);
}
