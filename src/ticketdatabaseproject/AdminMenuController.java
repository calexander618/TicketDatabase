/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticketdatabaseproject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;

/**
 * FXML Controller class
 *
 * @author chasealexander
 */
public class AdminMenuController implements Initializable {
    public String host = "localhost";
    public String databaseName = "ticketdatabase";
    public String baseURL = "jdbc:mysql://" + host;
    public String myURL = baseURL + "/" + databaseName;
    Connection conn;
    
    ObservableList<String> searchOptions;
    
    @FXML
    private ChoiceBox choiceBox;
    
    @FXML
    private TextField textField;
    
    @FXML
    private RadioButton insertRadioButton;
    
    @FXML
    private RadioButton deleteRadioButton;
    
    @FXML
    private Button executeButton;
    
    @FXML
    private Button populateTablesButton;
    
    @FXML
    private Button initializeDBButton;
    
    @FXML
    private void handleExecute(ActionEvent event) throws Exception {
        ResultSet rs;
        String table = choiceBox.getValue().toString();
        String columns = "";
        String items = textField.getText();
        System.out.println(table);
        try{
            System.out.println("Executing query...");
            conn = DriverManager.getConnection(myURL, "root", "");
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ticket'");
            while(rs.next()){
                columns.concat(rs.getString(1) + ", ");
            }
            if(insertRadioButton.isSelected()){
                stmt.executeUpdate("INSERT INTO " + table + "(" + columns + ")" + " VALUES " + "(" + items + ");");  
                System.out.println("INSERT INTO " + table + "(" + columns + ")" + " VALUES " + "(" + items + ");");
            }
            else if(deleteRadioButton.isSelected()){
                stmt.executeUpdate("DELETE FROM " + table + " WHERE " + items + ";");
                System.out.println("DELETE FROM " + table + " WHERE " + columns + ";");
            }
        } catch(Exception e){System.out.println(e);}
        conn.close();
    }
    
    @FXML
    private void handleInitializeDB(ActionEvent event) throws Exception{
        try{
            System.out.println("Connecting...");
            conn = DriverManager.getConnection(baseURL, "root", "");
            ScriptRunner runner1 = new ScriptRunner(conn, false, false);
            runner1.runScript(new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("TicketManagementDatabase.sql"))));
        } catch(Exception e){System.out.println(e);}
        
        conn.close();
    }
    
    @FXML
    private void handlePopulateTables(ActionEvent event) throws Exception{
        try{
            System.out.println("Populating Tables...");
            conn = DriverManager.getConnection(myURL, "root", "");
            ScriptRunner runner2 = new ScriptRunner(conn, false, false);
            runner2.runScript(new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("populateTables2.sql"))));
        } catch(Exception e){System.out.println(e);}
        
        conn.close();
    }
    
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(ClassNotFoundException ex) {
                System.out.println("Error: unable to load driver class!");
                System.exit(1);
        }
        searchOptions = FXCollections.observableArrayList("ticket");
        choiceBox.setItems(searchOptions);
    }    
    
}
