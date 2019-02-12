/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticketdatabaseproject;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author chasealexander
 */
public class LoginMenuController implements Initializable {

    @FXML
    private TextField userField;
    @FXML
    private TextField passField;

    @FXML
    private Button signInButton;
    
    private String username;
    private String password;
    
    @FXML
    public void signIn(ActionEvent event) throws Exception { //might throw exception

        username = userField.getText();
        password = passField.getText();
        
        if (username.equals("admin") && password.equals("password")) {
            Stage newStage = new Stage();
            Parent root = FXMLLoader.load(getClass().getResource("AdminMenu.fxml"));
        
            Scene scene = new Scene(root);
            scene.getRoot().requestFocus();       
            newStage.setScene(scene);
            newStage.show();
        }
        
        else {
            System.out.println("Goodbye World");
        }
        
        Stage oldStage = (Stage) signInButton.getScene().getWindow();
        oldStage.close();
    }
    
    
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
