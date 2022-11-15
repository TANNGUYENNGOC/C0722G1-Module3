package model;
public class Facility {
    private int id;
    private String name;
    private int area;
    private double cost;
    private int max_people;
    private RentType rentTypeId;
    private FacilityType facilityTypeId;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberOfFloors;
    private String facilityree;

    public Facility() {
    }

    public Facility(int id, String name, int area, double cost, int max_people, RentType rentTypeId, FacilityType facilityTypeId, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String facilityree) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.rentTypeId = rentTypeId;
        this.facilityTypeId = facilityTypeId;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.facilityree = facilityree;
    }

    public Facility(String name, int area, double cost, int max_people, RentType rentTypeId, FacilityType facilityTypeId, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String facilityree) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.rentTypeId = rentTypeId;
        this.facilityTypeId = facilityTypeId;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.facilityree = facilityree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMax_people() {
        return max_people;
    }

    public void setMax_people(int max_people) {
        this.max_people = max_people;
    }

    public RentType getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(RentType rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public FacilityType getFacilityTypeId() {
        return facilityTypeId;
    }

    public void setFacilityTypeId(FacilityType facilityTypeId) {
        this.facilityTypeId = facilityTypeId;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public String getFacilityree() {
        return facilityree;
    }

    public void setFacilityree(String facilityree) {
        this.facilityree = facilityree;
    }
}
