package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                save(request,response);
                break;
            case "delete":
                deleteForm(request,response);
                break;
        }
        
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int iD= Integer.parseInt(request.getParameter("id"));
        productService.delete(iD);
        response.sendRedirect("/product");

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int iD = Integer.parseInt(request.getParameter("iD"));
        String nameProduct = request.getParameter("nameProduct");
        double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
        String descriptionProduct = request.getParameter("descriptionProduct");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(iD,nameProduct,priceProduct,descriptionProduct,manufacturer);
        productService.add(product);
        request.setAttribute("mess","Thêm mới thành công");
        try {
            request.getRequestDispatcher("view/product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action = "";
        }
        switch (action){
            case "add":
                showFormCreate(request,response);
                break;
            case "delete":
                showDeleteProduct(request,response);
                break;
            default: showList(request,response);
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/delete.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList",productList);
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
