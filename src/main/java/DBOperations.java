import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBOperations  {





    static int user_id;
    static int exp_id;

    public static  void get_user_id() {
        try {

            Connection conObj = DBConnection.establishConnection();

            PreparedStatement ps = conObj.prepareStatement("SELECT user_id_seq_exp.nextval FROM dual");
            ResultSet rs = ps.executeQuery();
            rs.next();

            user_id = rs.getInt(1);

            conObj.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void get_exp_id() {
        try {

            Connection conObj = DBConnection.establishConnection();

            PreparedStatement ps = conObj.prepareStatement("SELECT exp_id_seq.nextval FROM dual");
            ResultSet rs = ps.executeQuery();
            rs.next();

            exp_id = rs.getInt(1);

            conObj.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void insertUsers(String username , String password ,String email ) {
        get_user_id();
        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "insert into user_for_expense_tracker values (?,?,?,?)";

            PreparedStatement stmt = conObj.prepareStatement(query);
            stmt.setInt(1, user_id);
            stmt.setString(2, username);
            stmt.setString(3, password);
            stmt.setString(4, email);


            int count = stmt.executeUpdate();

            conObj.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insertExpenses(int userid,double amount , String category ,String description , String expense_date ) {
        get_exp_id();
        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "insert into expenses values (?,?,?,?,?,TO_DATE(?, 'YYYY-MM-DD'))";

            PreparedStatement stmt = conObj.prepareStatement(query);
            stmt.setInt(1, exp_id);
            stmt.setInt(2, userid);
            stmt.setDouble(3, amount);
            stmt.setString(4, category);
            stmt.setString(5, description);
            stmt.setString(6, expense_date);


            int count = stmt.executeUpdate();

            conObj.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static void updateExpense(int id , double amount , String category ,String description,String date ) {

        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "update expenses set amount = ? , category = ? ,description = ?,expense_date = TO_DATE(?, 'YYYY-MM-DD') where expense_id = ?";

            PreparedStatement stmt = conObj.prepareStatement(query);
            stmt.setDouble(1, amount);
            stmt.setString(2, category);
            stmt.setString(3, description);
            stmt.setString(4,date);
            stmt.setInt(5, id);


            int count = stmt.executeUpdate();

            conObj.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static void deleteExpense(int id ) {

        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "delete from expenses  where expense_id = ?";

            PreparedStatement stmt = conObj.prepareStatement(query);

            stmt.setInt(1, id);


            int count = stmt.executeUpdate();

            conObj.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
