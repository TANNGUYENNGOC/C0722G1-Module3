import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Darius","1983-08-29","Top","https://www.gamosaurus.com/wp-content/uploads/League-of-Legends/Guides/S10/Vignettes/guide-lol-s10-stuff-build-sort-objet-competence-comment-jouer-darius-top-680x382.jpg"));
        customerList.add(new Customer("Javan IV","1983-08-21","Jungle","https://images.contentstack.io/v3/assets/blt370612131b6e0756/blt5229d29d4ea748ac/5f7f71fd472a560f4335f3d4/jarvaniv_skin01.jpg"));
        customerList.add(new Customer("Katarina","1983-08-19","Mid","https://images.contentstack.io/v3/assets/blt187521ff0727be24/blt3dafcae87ee7c45a/60ee0e8fa9af29474648beef/Katarina_0.jpg"));
        customerList.add(new Customer("Miss Fortune","1983-08-25","ADC","https://cdnmedia.webthethao.vn/thumb/720-405/uploads/img/files/images/fullsize/2020/04/21/bang-ngoc-miss-fortune-ad-lien-minh-huyen-thoai-mua-10.jpg"));
        customerList.add(new Customer("malphite","1983-08-14","Support","https://lienminh.garena.vn/images/champions/skin/54_Malphite/0-1.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
