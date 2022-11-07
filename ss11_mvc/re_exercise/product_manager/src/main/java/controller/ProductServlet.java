package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "search":
                searchProduct(request,response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> productList =  productService.searchName(name);
        request.setAttribute("productList",productList);
        try {
            request.getRequestDispatcher("product/search.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
        String descriptionProduct = request.getParameter("descriptionProduct");
        String manufacturer = request.getParameter("manufacturer");
        Product product = productService.findByID(id);
        product.setNameProduct(nameProduct);
        product.setPriceProduct(priceProduct);
        product.setDescriptionProduct(descriptionProduct);
        product.setManufacturer(manufacturer);
        productService.update(product, id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("product/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int iD = Integer.parseInt(request.getParameter("iD"));
        String nameProduct = request.getParameter("nameProduct");
        double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
        String descriptionProduct = request.getParameter("descriptionProduct");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(iD, nameProduct, priceProduct, descriptionProduct, manufacturer);
        productService.save(product);
        request.setAttribute("mess", "Thêm mới thành công");

        try {
            request.getRequestDispatcher("product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findByID(id);

        request.setAttribute("product", product);

        try {
            request.getRequestDispatcher("product/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findByID(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("product/delete.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("productList", productService.findAll());
        try {
            request.getRequestDispatcher("product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
