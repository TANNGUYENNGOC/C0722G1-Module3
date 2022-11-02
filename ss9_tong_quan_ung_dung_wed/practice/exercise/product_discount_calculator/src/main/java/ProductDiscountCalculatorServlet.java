import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/display-discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_description = request.getParameter("mota");
        double list_price = Double.parseDouble(request.getParameter("n1"));
        double discount_price = Double.parseDouble(request.getParameter("n2"));
        double result = list_price * discount_price *0.01;
        request.setAttribute("mt",product_description);
        request.setAttribute("gny",list_price);
        request.setAttribute("tlck",discount_price);
        request.setAttribute("chiet_khau",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
