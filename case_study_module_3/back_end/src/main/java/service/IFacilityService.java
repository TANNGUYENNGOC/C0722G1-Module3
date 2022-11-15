package service;

import model.Customer;
import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAll();
    boolean add(Facility facility);
    boolean updateFacility(Facility facility, int id);
    Facility selectFacility(int id);

    public boolean deleteFacility(int id);
    List<Customer> searchFacility(String nameSearch);
}
