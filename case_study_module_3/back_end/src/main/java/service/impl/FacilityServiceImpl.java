package service.impl;

import model.Customer;
import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityServiceImpl implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public boolean add(Facility facility) {
        return facilityRepository.add(facility);
    }

    @Override
    public boolean updateFacility(Facility facility, int id) {
        return facilityRepository.updateFacility(facility,id);
    }

    @Override
    public Facility selectFacility(int id) {
        return facilityRepository.selectFacility(id);
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public List<Customer> searchFacility(String nameSearch) {
        return null;
    }
}
