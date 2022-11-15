package controller;

import model.Facility;
import model.FacilityType;
import model.RentType;
import service.IFacilityService;
import service.impl.FacilityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addFacility(request, response);
                break;
            case "update":
                updateFacility(request,response);
                break;
        }
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeID = Integer.parseInt((request.getParameter("rentTypeID")));
        RentType rentType = new RentType(rentTypeID);
        int facilityTypeID = Integer.parseInt((request.getParameter("facilityTypeID")));
        FacilityType facilityType = new FacilityType(facilityTypeID);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(name, area, cost, maxPeople, rentType, facilityType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facilityService.updateFacility(facility,id);
        showListFacility(request,response);
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeID = Integer.parseInt((request.getParameter("rentTypeID")));
        RentType rentType = new RentType(rentTypeID);
        int facilityTypeID = Integer.parseInt((request.getParameter("facilityTypeID")));
        FacilityType facilityType = new FacilityType(facilityTypeID);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(name, area, cost, maxPeople, rentType, facilityType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);

        facilityService.add(facility);
        showListFacility(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                showFormUpdateHouse(request,response);
                break;
            case "add_house":
                showFormAddHouse(request, response);
                break;
            case "add_room":
                showFormAddRoom(request, response);
                break;
            case "add_villa":
                showFormAddVilla(request, response);
                break;
            default:
                showListFacility(request, response);
        }
    }

    private void showFormUpdateHouse(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.selectFacility(id);
        request.setAttribute("facility",facility);
        try {
            request.getRequestDispatcher("facility/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAddRoom(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("facility/add_room.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAddVilla(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("facility/add_villa.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAddHouse(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("facility/add_house.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAll();
        request.setAttribute("facilityList", facilityList);
        try {
            request.getRequestDispatcher("facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
