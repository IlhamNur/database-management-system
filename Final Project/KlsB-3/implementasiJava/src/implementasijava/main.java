package implementasiJava;   
  import implementasijava.SQLQuery;

  public class main {   
   public static void main(String[] args){
        SQLQuery query1 = new SQLQuery("INSERT INTO LAUT(Kode, Nama) VALUES (111111, 'Laut rrrr')");
        query1.executeQuery();
    }  
   }    