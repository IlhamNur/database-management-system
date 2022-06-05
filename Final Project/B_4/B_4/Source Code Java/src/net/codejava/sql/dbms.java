package net.codejava.sql;

import java.util.*;
import java.sql.*;


public class dbms {

	public static void main(String[] args) {
		Connection connection = null;
		try {
		String url = "jdbc:sqlserver://LAPTOP-C2TTN0LB;databaseName= KEPENDUDUKAN4";
		String User = "bismillah";
		String Password ="1234";
		connection = DriverManager.getConnection(url,User,Password);
		
		PreparedStatement state ;
		

		Scanner inputCommand = new Scanner(System.in);
		Scanner inputTabel= new Scanner(System.in);
		Scanner inputKolom = new Scanner(System.in);
		Scanner inputData = new Scanner(System.in);
		Scanner stopKolomChoose = new Scanner(System.in);
		System.out.println("Masukkan command (insert, update, delete,exit)?"); 
		
		String sql_execute = "";
		String command_dipilih = inputCommand.nextLine(); // select , insert , update , delete
		switch(command_dipilih) {
			case "insert":
				sql_execute = sql_execute + "INSERT INTO ";
				System.out.println("Masukkan tabel yang akan diinput!");
				String tabel_dipilih = inputTabel.nextLine();
				sql_execute = sql_execute + tabel_dipilih + "(";
				
				ArrayList<String> columns = new ArrayList<String>();
				String stop_kolom = "yes";
				while (stop_kolom.equals("yes")) {
					System.out.println("Masukkan kolom yang akan diinput");
					String kolom_dipilih = inputKolom.nextLine();
					sql_execute = sql_execute + kolom_dipilih;
					columns.add(kolom_dipilih);
					System.out.println("ada lagi? (yes/no)");
					stop_kolom = stopKolomChoose.nextLine();

					if (stop_kolom.equals("yes")) {
						sql_execute = sql_execute + ",";
					}
				}

				sql_execute = sql_execute + ") VALUES ("; // sampai sini sql yang terbentuk "INSERT INTO nama_table ("nama_kolom") VALUES ("
				// loopin untuk data dari kolom yang akan diinput
				ArrayList<String> datas = new ArrayList<String>();
				for (int i=1; i<columns.size(); i++) {
					System.out.println("Masukkan data untuk kolom - " + columns.get(i));
					String data = inputData.nextLine();
					sql_execute = sql_execute + "?";
					datas.add(data);

					if (i != columns.size()-1) {
						sql_execute = sql_execute + ",";
					}
				}
				sql_execute = sql_execute + ");";
				System.out.println(sql_execute);

				// persiapan input
					state= connection.prepareStatement(sql_execute);
				for (int i=0; i<datas.size(); i++) {
					state.setString(i+1, datas.get(i));
				}

				int rowsInserted = state.executeUpdate();
				if (rowsInserted > 0) {
					System.out.println("The new data  was inserted successfully!");
				}
				break;
			case "update":
				sql_execute = sql_execute + "UPDATE ";
				System.out.println("Masukkan tabel yang ingin dipilih");
				String tabel_pilih = inputTabel.nextLine();
				
				sql_execute = sql_execute + tabel_pilih + " SET ";
				String stop_kolom1 = "yes";
				while (stop_kolom1.equals("yes")) {
					System.out.println("Masukkan kolom yang akan diubah");
					String kolom_dipilih = inputKolom.nextLine();
					sql_execute = sql_execute + kolom_dipilih + "=";
					System.out.println("Masukkan data untuk kolom - " + kolom_dipilih);
					String data = inputData.nextLine();
					sql_execute = sql_execute + data;

					System.out.println("ada lagi? (yes/no)");
					stop_kolom1 = stopKolomChoose.nextLine();
					if (stop_kolom1.equals("yes")) {
						sql_execute = sql_execute + ", ";
					}	
				}

				sql_execute = sql_execute + " WHERE ";
				String stop = "yes";
				while (stop.equals("yes")) {
					System.out.println("Masukkan kolom kondisi (where)");
					String kolom_pilih = inputKolom.nextLine();
					sql_execute = sql_execute + kolom_pilih + "=";
					System.out.println("Masukkan data untuk kolom - " + kolom_pilih);
					String data = inputData.nextLine();
					sql_execute = sql_execute + data;

					System.out.println("ada lagi? (yes/no)");
					stop = stopKolomChoose.nextLine();
					if (stop.equals("yes")) {
						sql_execute = sql_execute + " AND ";
					}
				}

				sql_execute = sql_execute + ";";
				state = connection.prepareStatement(sql_execute);
				System.out.println(sql_execute);
				int rowsInserteds = state.executeUpdate();
				if (rowsInserteds > 0) {
					System.out.println("Data updated");
				}
			      
				break;
			
			case "delete":
				sql_execute = sql_execute + "DELETE FROM ";
				System.out.println("Masukkan tabel yang ingin dipilih");
				String tabel_dipilih1 = inputTabel.nextLine();
				sql_execute = sql_execute + tabel_dipilih1 + " WHERE ";
				System.out.println("Masukkan kolom data yang ingin dipilih");
				String data_pilih = inputData.nextLine();
				sql_execute = sql_execute + data_pilih + "=";
				System.out.println("Masukkan data yang ingin dihapus");
				String data2_dipilih = inputData.nextLine();
				sql_execute = sql_execute + data2_dipilih;
				state = connection.prepareStatement(sql_execute);
				
				int rowsDeleted = state.executeUpdate();
				if (rowsDeleted > 0) {
				    System.out.println("the Data was deleted successfully!");
				} else  System.out.println("data not found!");
				break;
			}
     
      		} catch (SQLException e) {
			System.out.println("oops");
			e.printStackTrace();
		}
			
	}

}
