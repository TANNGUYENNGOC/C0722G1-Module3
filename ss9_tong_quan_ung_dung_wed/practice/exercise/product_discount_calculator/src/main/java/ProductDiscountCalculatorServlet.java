import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/display-discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_description = request.getParameter("describe");
        double list_price = Double.parseDouble(request.getParameter("list_price"));
        double discount_price = Double.parseDouble(request.getParameter("discount_percent"));
        double result = list_price * discount_price *0.01;
        request.setAttribute("describe",product_description);
        request.setAttribute("list_price",list_price);
        request.setAttribute("discount_percent",discount_price);
        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
