package implementasijava;

import java.sql.*;

public class SQLQuery {
    static final String JDBC_DRIVER = "net.sourceforge.jtds.jdbc.Driver";  
    static final String jdbc = "jdbc:jtds:sqlserver://";
    static final String host = "LAPTOP-USPSQM4R:"; 
    static final String port = "1433/";
    static final String database = "KELAUTAN INDONESIA";  
    static final String dburl = jdbc + host + port + database;   
    static final String dbuser = "test"; 
    static final String dbpass = "tes123";
    static String query;
    
public SQLQuery(String query) {
    this.query = query;
}

public void executeQuery() {
    Connection con = null;
    Statement stmt = null;
    
    try {
	con = DriverManager.getConnection(dburl, dbuser, dbpass);	    
	stmt=con.createStatement();	    
	stmt.executeUpdate(query);
	    
	System.out.println("Record Inserted Successfully");
        
    } 
	
    catch (SQLException e) {
	System.err.println("Cannot connect ! ");
	    e.printStackTrace();
	}
	
    finally {
	System.out.println("Closing the connection.");
	    if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
	
}
}