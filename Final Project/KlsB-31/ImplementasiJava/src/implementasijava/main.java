package implementasiJava;   
  import implementasijava.SQLQuery;

  public class main {   
   public static void main(String[] args){
        SQLQuery query1 = new SQLQuery
        ("CREATE VIEW LAUT_TERLUAS AS \n" +
        "SELECT TOP(1) Nama, Luas\n" +
        "FROM LAUT\n" +
        "ORDER BY Luas Desc");
        query1.executeQuery();
    }  
   }    