/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.Stateful;

/**
 *
 * @author Admin
 */
@Stateful
public class Bean {
    public Bean(){}
    
    public String bookRoom (String cn, String cmb, String rt) throws ClassNotFoundException, SQLException {
        String mssg = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","root");
                String query = "SELECT * FROM bookroom_07 WHERE type=? and status='Not Booked'";
                PreparedStatement psmt = con.prepareStatement(query);
                psmt.setString(1, rt);
                ResultSet rs = psmt.executeQuery();
                
                if (rs.next()) {    // if rs is not empty
                    String rno = rs.getString(1);
                    PreparedStatement psmt1 = con.prepareStatement("UPDATE bookroom_07 SET cust=? WHERE id=?");
                    psmt1.setString(1, cn);
                    psmt1.setString(2, rno);
                    psmt1.executeUpdate();
                    
                    psmt1 = con.prepareStatement("UPDATE bookroom_07 SET mob=? WHERE id=?");
                    psmt1.setString(1, cmb);
                    psmt1.setString(2, rno);
                    psmt1.executeUpdate();
                    
                    psmt1 = con.prepareStatement("UPDATE bookroom_07 SET status=? WHERE id=?");
                    psmt1.setString(1, "Booked");
                    psmt1.setString(2, rno);
                    psmt1.executeUpdate();
                    
                    mssg = "Room "+rno+" Booked and Charges "+rs.getString(3);
                    
                } else {
                    mssg = "Room "+rt+" Currently not available";
                }
                
        } catch(Exception e) {
            mssg = ""+e;
        }
         return mssg;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
