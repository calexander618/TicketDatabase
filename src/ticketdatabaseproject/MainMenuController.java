/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticketdatabaseproject;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import java.sql.*; // for standard JDBC programs
import javafx.event.EventHandler;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

/**
 *
 * @author Chase Alexander and Clark Walcott
 */
public class MainMenuController implements Initializable {
    public String host = "localhost";
    public String databaseName = "ticketdatabase";
    public String baseURL = "jdbc:mysql://" + host;
    public String myURL = baseURL + "/" + databaseName;
    Connection conn;
    
    ObservableList<String> searchOptions;
    ObservableList<String> popShows;
    ObservableList<String> results;
    String currentItemSelected;
    
    @FXML
    private ChoiceBox searchMenu;
    
    @FXML
    private ListView resultsList;
    
    @FXML
    private TextField searchTextField;
    
    @FXML
    private void handleVenue(ActionEvent event) throws Exception {
        String r = "";
        results.clear();
        try{
            System.out.println("Fetching Venues...");
            conn = DriverManager.getConnection(myURL, "root", "");
            Statement stmt = conn.createStatement();  
            ResultSet rs = stmt.executeQuery("SELECT venue_name, address FROM venue;");  
            while(rs.next()){  
                r = rs.getString(1) + "\n" + rs.getString(2);  
                results.add(r);
            }
        } catch(Exception e){System.out.println(e);}
        conn.close();
        resultsList.setItems(results);
    }
    
    @FXML
    private void handleArtists(ActionEvent event) throws Exception {
        String r = "";
        results.clear();
        try{
            System.out.println("Fetching Artists...");
            conn = DriverManager.getConnection(myURL, "root", "");
            Statement stmt = conn.createStatement();  
            ResultSet rs = stmt.executeQuery("SELECT * FROM artist;");  
            while(rs.next()){  
                r = rs.getString(1) + "  " + rs.getString(2); 
                results.add(r);
            }
        } catch(Exception e){System.out.println(e);}
        conn.close();
        resultsList.setItems(results);
    }
    
    @FXML
    private void handleEvents(ActionEvent event) throws Exception {
        String r = "";
        results.clear();
        try{
            System.out.println("Fetching Events...");
            conn = DriverManager.getConnection(myURL, "root", "");
            Statement stmt = conn.createStatement();  
            ResultSet rs = stmt.executeQuery("SELECT artist_name, venue_name, date FROM hosts;");  
            while(rs.next()){  
                r = rs.getString(1) + " at " + rs.getString(2) + "  " + rs.getString(3);  
                results.add(r);
            }
        } catch(Exception e){System.out.println(e);}
        conn.close();
        resultsList.setItems(results);
    }
    
    @FXML
    private void handleLogin(ActionEvent event) throws Exception {
        Stage newStage = new Stage();
        Parent root = FXMLLoader.load(getClass().getResource("LoginMenu.fxml"));
        
        Scene scene = new Scene(root);
        scene.getRoot().requestFocus();       
        newStage.setScene(scene);
        newStage.show();
    }
    
    @FXML
    private void handleSearch(ActionEvent event) throws Exception {
        String table = searchMenu.getValue().toString();
        String items = searchTextField.getText();
        ResultSet rs;
        String r = "";
        
        results.clear();
        try{
            System.out.println("Fetching Events...");
            conn = DriverManager.getConnection(myURL, "root", "");
            Statement stmt = conn.createStatement();  
            if(table.equals("Venue")){
                rs = stmt.executeQuery("SELECT concert_number, artist_name, date FROM hosts WHERE venue_name = \"" + items + "\";");  
            }
            else if(table.equals("Artist")){
                rs = stmt.executeQuery("SELECT concert_number, venue_name, date FROM hosts WHERE artist_name = \"" + items + "\";"); 
            }
            else{
                System.out.println("ERROR: Please select an item from the drop down menu.\n");
                conn.close();
                return;
            }
            while(rs.next()){  
                r = "Concert: " + rs.getString(1) + "  " + rs.getString(2) + " on " + rs.getString(3);  
                results.add(r);
            }
        } catch(Exception e){System.out.println(e);}
        conn.close();
        resultsList.setItems(results);
    }
    
//    @FXML
//    private void handleMouseClick(ActionEvent event) throws Exception{
//        resultsList.setOnMouseClicked((MouseEvent click) -> {
//            if (click.getClickCount() == 2) {
//                //Use ListView's getSelected Item
//                currentItemSelected = resultsList.getSelectionModel().getSelectedItem().toString();
//                //use this to do whatever you want to. Open Link etc.
//            }
//        }); 
//        
//        String r = "";
//        try{
//            System.out.println("Fetching Tickets...");
//            conn = DriverManager.getConnection(myURL, "root", "");
//            Statement stmt = conn.createStatement();  
//            ResultSet rs = stmt.executeQuery("SELECT ticket_number, seat_number "
//                    + "FROM has WHERE concert_number IN (SELECT concert_number FROM hosts
//                    + "WHERE venue_name=\"Blue Note\"
//                    + "AND artist_name=\"Carly Pearce\");");  
//            while(rs.next()){  
//                r = rs.getString(1) + " at " + rs.getString(2) + "  " + rs.getString(3);  
//                results.add(r);
//            }
//        } catch(Exception e){
//            System.out.println(e);
//            return;
//        }
//        conn.close();
//        results.clear();
//        resultsList.setItems(results);
//    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        searchOptions = FXCollections.observableArrayList("Venue", "Artist");
        searchMenu.setItems(searchOptions);
        
        // initializes results to the most popular shows
        popShows = FXCollections.observableArrayList();
        
        resultsList.setItems(popShows);
        
        results = FXCollections.observableArrayList();
        //resultsList.setItems(results);
          
    }    
    
}
