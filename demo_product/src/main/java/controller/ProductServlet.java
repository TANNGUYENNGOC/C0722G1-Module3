package controller;

import model.Product;
import model.ProductType;
import service.IProductService;
import service.IProductTypeService;
import service.impl.ProductService;
import service.impl.ProductTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private IProductTypeService productTypeService = new ProductTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            default:
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
         String productCode = request.getParameter("productCode");
         String name = request.getParameter("name");
         int price =0;
         try{
             price= Integer.parseInt(request.getParameter("price"));
         }catch (Exception e){
             price=-1;
         }
         int productTypeId = Integer.parseInt(request.getParameter("productTypeId"));
         ProductType productType = new ProductType(productTypeId);
         Product product = new Product(productCode,name,price,productType,1);
         Map<String,String> errorMap =productService.add(product);
         String mess="Thêm mới thành công";
         if (!errorMap.isEmpty()){
             mess="Thêm mới không thành công";
             request.setAttribute("errorMap",errorMap);
             request.setAttribute("productCode",productCode);
             request.setAttribute("name",name);
             request.setAttribute("price",price);
         }
         request.setAttribute("mess",mess);
          showFormCreate(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = productService.delete(deleteId);
        String mess ="Xoá không thành công";
        if (check){
            mess ="Xoá thành công";
        }
        request.setAttribute("mess", mess);
        showProductList(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormCreate(request,response);
                break;
            case "delete":
                break;
            default:
                showProductList(request,response);
        }
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<ProductType> productTypeList = productTypeService.findAll();
        request.setAttribute("productTypeList",productTypeList);
        try {
            request.getRequestDispatcher("/view/product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList",productList);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
