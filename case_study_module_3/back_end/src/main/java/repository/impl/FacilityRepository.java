package repository.impl;

import model.Customer;
import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final static String SELECT_ALL_FACILITY = "SELECT facility.id,facility.name name_facility, facility.area,facility.cost,facility.max_people,rent_type.name name_rent_type,facility_type.name name_facility_type,facility.standard_room,facility.description_other_convenience,facility.pool_area,facility.number_of_floors,facility.facility_free FROM facility JOIN rent_type ON rent_type.id = facility.rent_type_id JOIN facility_type ON facility_type.id = facility.facility_type_id;";
    private final static String INSERT_FACILITY = "insert into facility(name, area, cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free) values(?,?,?,?,?,?,?,?,?,?,?);";
    private final  static String SELECT_FACILITY_BY_ID = "select * from facility where id =?;";
    private static final String UPDATE_FACILITY_SQL = "update facility set name = ?,area= ?, cost =?,max_people=?,rent_type_id=?,facility_type_id=?,standard_room=?,description_other_convenience=?,pool_area=?,number_of_floors=?,facility_free=? where id = ?;";

    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name_facility");
                int area = resultSet.getInt("area");
                double cost = Double.parseDouble(resultSet.getString("cost"));
                int maxPeople = resultSet.getInt("max_people");
                String nameRentType = resultSet.getString("name_rent_type");
                String nameFacilityType = resultSet.getString("name_facility_type");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double pooLArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");

                RentType rentType = new RentType(nameRentType);
                FacilityType facilityType = new FacilityType(nameFacilityType);
                Facility facility = new Facility(id,name,area,cost,maxPeople,rentType,facilityType,standardRoom,descriptionOtherConvenience,pooLArea,numberOfFloors,facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean add(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_FACILITY);
            ps.setString(1,facility.getName());
            ps.setInt(2,facility.getArea());
            ps.setDouble(3,facility.getCost());
            ps.setInt(4,facility.getMax_people());
            ps.setInt(5,facility.getRentTypeId().getId());
            ps.setInt(6,facility.getFacilityTypeId().getId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescriptionOtherConvenience());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloors());
            ps.setString(11,facility.getFacilityree());
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateFacility(Facility facility, int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps  = connection.prepareStatement(UPDATE_FACILITY_SQL);
            ps.setString(1,facility.getName());
            ps.setInt(2,facility.getArea());
            ps.setDouble(3,facility.getCost());
            ps.setInt(4,facility.getMax_people());
            ps.setInt(5,facility.getRentTypeId().getId());
            ps.setInt(6,facility.getFacilityTypeId().getId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescriptionOtherConvenience());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloors());
            ps.setString(11,facility.getFacilityree());
            ps.setInt(12,id);
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility selectFacility(int id) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY_BY_ID);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeID = resultSet.getInt("rent_type_id");
                RentType rentType = new RentType(rentTypeID);
                int facilityTypeID = resultSet.getInt("facility_type_id");
                FacilityType facilityType = new FacilityType(facilityTypeID);
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                facility = new Facility(id  ,name,area,cost,maxPeople,rentType,facilityType,standardRoom,
                        descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public List<Facility> searchFacility(String nameSearch) {
        return null;
    }
}
