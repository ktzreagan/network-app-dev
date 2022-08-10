import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;


public class GetData extends HttpServlet{

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{

        PrintWriter out = response.getWriter();

        int cartId = 2;
        int customerId =1;

        HttpSession session = request.getSession();
        if(session.getAttribute("cart_id")!=null){
            cartId = Integer.parseInt(session.getAttribute("cart_id").toString());
        }

        try{
        Connection con = DB.initializeDatabase();
        Statement statement = con.createStatement();
        Statement statement2 = con.createStatement();
        String query = "SELECT * from products";
        ResultSet rs = statement.executeQuery(query);
        ResultSet cartRs = statement2.executeQuery("SELECT distinct * FROM cart_items join cart on cart_items.cart_id=cart.cart_id join products on products.product_id = cart_items.product_id where cart.customer_id="+customerId+" and cart.cart_id="+cartId+" and cart.cart_status=0");
        //request.getSession().put("results",rs);
        getServletContext().setAttribute(
            "data_products",rs
        );
        // getServletContext().setAttribute(
        //     "cart_items",cartRs
        // );

        getCartCount(request,response);


        request.getRequestDispatcher("view_product.jsp").include(request,response);

        statement.close();
        statement2.close();
        con.close();

        }catch(Exception e){
            out.println(e);
        }

    }


    private void getCartCount(HttpServletRequest request,HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();

        int cartId = 2;
        HttpSession session = request.getSession();
        int customerId = Integer.parseInt(session.getAttribute("customer_id").toString());

        if(session.getAttribute("cart_id")!=null){
            cartId = Integer.parseInt(session.getAttribute("cart_id").toString());
        }
        try{
        Connection con = DB.initializeDatabase();
        Statement cartStatement = con.createStatement();
        ResultSet cartRs = cartStatement.executeQuery("SELECT distinct count(*) as cart_count  FROM cart_items join cart on cart_items.cart_id=cart.cart_id join products on products.product_id = cart_items.product_id where cart.customer_id="+customerId+" and cart.cart_id="+cartId+" and cart.cart_status=0");
        int cart_count = 0;
        if(cartRs.next()){
            cart_count = cartRs.getInt("cart_count");
            session.setAttribute("cart_count",cart_count+"");
        }

       cartStatement.close();
        con.close();

        }catch(Exception e){
            out.println(e);
        }

    }

}