import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    public static double addition(double a, double b){
        return a+b;
    }
    public static double subtraction(double a, double b){
        return a-b;
    }
    public static double multiplication(double a, double b){
        return a*b;
    }
    public static double division(double a, double b){
        return a/b;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double a = Double.parseDouble(request.getParameter("first_operand"));
        double b = Double.parseDouble(request.getParameter("second_operand"));
        double result;
        String operator = request.getParameter("operator");
        if(operator.equals("+")){
            result =  addition(a,b);
        } else if(operator.equals("-")){
            result = subtraction(a,b);
        } else if(operator.equals("*")){
            result = multiplication(a,b);
        } else {
            result = division(a,b);
        }

        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
