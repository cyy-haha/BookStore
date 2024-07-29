package myCode;

import Obj.Book;
import com.mysql.jdbc.Driver;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "RestfulServlet", value = "/RestfulServlet")
public class RestfulServlet extends HttpServlet {
    private PreparedStatement preparedStatement;
    PrintWriter out;

//    public void init() throws ServletException {
//        initializeJDBC();
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        String method = request.getParameter("_method");
        initializeJDBC("search");
        try {
            preparedStatement.setString(1, request.getParameter("bookId"));
            ResultSet rs = preparedStatement.executeQuery();
            Book book = null;
            if (rs.next()){
                book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setName(rs.getString("name"));
                book.setPrice(rs.getInt("price"));
                book.setAuthor(rs.getString("author"));
            }
            if (book == null){
                out.println("Book not found.");
                out.close();
            }
            else {
                request.setAttribute("book", book);
                if (method == null) request.getRequestDispatcher("/book.jsp").forward(request, response);
                else if (method.equals("PUT"))
                    request.getRequestDispatcher("/updateBook.jsp").forward(request, response);
            }
        } catch (SQLException e) {
//            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        String method = request.getParameter("_method");
        if (method == null) {
            initializeJDBC("insert");
            String bookId = request.getParameter("bookId");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String author = request.getParameter("author");

            if (bookId == "" || name == "" || price == "" || author == ""){
                out.println("The book information is incomplete.");
                return;
            }

            storeBook(Integer.parseInt(bookId), name, Integer.parseInt(price), author);
            out.println("Book " + name + " has been added to the database.");

            out.close();
        }
        else if ("PUT".equals(method)) doPut(request, response);
        else if ("DELETE".equals(method)) doDelete(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        initializeJDBC("update");
        String bookId = request.getParameter("bookId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String author = request.getParameter("author");

        if (bookId == "" || name == "" || price == "" || author == ""){
            out.println("The book information is incomplete.");
            return;
        }

        updateBook(Integer.parseInt(bookId), name, Integer.parseInt(price), author);

        out.println("Book " + name + " has been updated from the database.");
        out.close();
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        initializeJDBC("delete");
        String bookId = request.getParameter("bookId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String author = request.getParameter("author");

        if (bookId == "" || name == "" || price == "" || author == ""){
            out.println("The book information is incomplete.");
            return;
        }

        int res = storeBook(Integer.parseInt(bookId), name, Integer.parseInt(price), author);
        if (res > 0) out.println("Book " + name + " has been deleted from the database.");
        else out.println("The book information is wrong!");
        out.close();
    }

    private void initializeJDBC(String method) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded...");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cyyDB", "cyy", "ch7109ch");
            System.out.println("Database connected...");

            if (method.equals("insert")) preparedStatement = conn.prepareStatement("Insert into Book" + "(bookId, name, price, author) values (?,?,?,?);");
            else if (method.equals("search")) preparedStatement = conn.prepareStatement("select * from book where bookId = ?;");
            else if (method.equals("delete")) preparedStatement = conn.prepareStatement("delete from book where bookId = ? and name = ? and price = ? and author = ?;");
            else if (method.equals("update")) preparedStatement = conn.prepareStatement("update book set name = ?, price = ?, author = ? where bookId = ?;");
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e.getMessage());
            out.close();
//            throw new RuntimeException(e);
        }
    }

    private int storeBook(int id, String name, int price, String author) {
        int res = 0;
        try {
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setInt(3, price);
            preparedStatement.setString(4, author);
            System.out.println(preparedStatement);
            res = preparedStatement.executeUpdate();
            System.out.printf("SQL Excute Result: %d\n", res);
        } catch (SQLException e) {
            out.println(e.getMessage());
            out.close();
//            throw new RuntimeException(e);
        }
        return res;
    }

    private void updateBook(int id, String name, int price, String author) {
        try {
            preparedStatement.setInt(4, id);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, price);
            preparedStatement.setString(3, author);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            out.println(e.getMessage());
            out.close();
//            throw new RuntimeException(e);
        }
    }
}