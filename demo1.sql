SELECT * FROM sys.sys_config;

CREATE DATABASE web_series1;

USE web_series1;
CREATE TABLE web_series_details(
name VARCHAR(20),
released_year YEAR,
seasons TINYINT,
lang CHAR(20),
platform VARCHAR(10),
episodes INT,
ratings FLOAT
);

SHOW TABLES;

DESC series_details;

SELECT * FROM series_details;

INSERT INTO web_series_details VALUE('Squid Game',2021,1,'Korean','Netflix',8,9.8);
-- adding multiple rows at a time
INSERT INTO web_series_details VALUE('Mirzapur',2020,2,'Hindi','Prime',9,8.5),('Stranger Things',2019,2,'English','Netflix',8,7.5);

-- other way of inserting data 
INSERT INTO web_series_details(name,seasons,platform,ratings)VALUE('Wheel of the Time',1,'Prime',3.8);

ALTER TABLE web_series_details ADD COLUMN director VARCHAR(20)AFTER name;
INSERT INTO web_series_details VALUE('Dark',2019,4,'English','Netflix',26,9.8,'Baran bo');
ALTER TABLE web_series_details  DROP COLUMN director;
ALTER TABLE web_series_details RENAME COLUMN raweb_series_detailstings TO imdb_ratings;
ALTER TABLE web_series_details RENAME TO series_details;
ALTER TABLE series_details MODIFY COLUMN episodes BIGINT;
UPDATE series_details SET released_year=2021 WHERE name='Wheel of the Time';

-- DELETE VALUES--
TRUNCATE TABLE series_details;

DROP TABLE series_details;

DROP DATABASE web_series1;

SELECT * FROM series_details;

package com.cognizant.bluebolt.gw.errorassist.app;

import javafx.application.Application;
import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * @author Cognizant
 * @see
 * @since 12-Mar-24
 **/
public class ErrorAssistApplication extends Application {


    ListView<String> resultListView = new ListView<>();

    @Override
    public void start(Stage primaryStage) {

        // Set up the layout
        GridPane gridPane = new GridPane();
        gridPane.setHgap(10);
        gridPane.setVgap(10);

        // Application heading
        Label headingLabel = new Label("Guidewire Error Assist");
        headingLabel.setStyle("-fx-font-size: 24px; -fx-font-weight: bold;");
        GridPane.setConstraints(headingLabel, 0, 0);
        GridPane.setColumnSpan(headingLabel, 3);
        GridPane.setHalignment(headingLabel, HPos.CENTER);
        gridPane.getChildren().add(headingLabel);

        // Add a new horizontal separator below the title
        Separator separator = new Separator();
        gridPane.add(separator, 0, 1, 3, 1);

        // Search Label, TextField and Submit Button
        Label searchLabel = new Label("Enter error message ");
        TextField searchField = new TextField();
        searchField.setPromptText("Enter search text");
        Button submitButton = new Button("Submit");
        GridPane.setHalignment(submitButton, HPos.RIGHT);

        Label detailLabel = new Label();
        submitButton.setOnAction(e -> {
            try {
                String query = searchField.getText();
                String[] searchResults = performSearch(query);


                if (searchResults != null) {
                    displaySearchResults(query, searchResults);
                } else {
                    displaySearchResultsNotFound(query);
                }
            }catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        Button clearButton = new Button("Clear");
        GridPane.setHalignment(clearButton, HPos.CENTER);
        clearButton.setOnAction(e -> {
            try {
            //clear the search field
            searchField.clear();
            // List<ErrorAssistTO> resultList = ErrorAssistService.execute(searchStr);
            //setupTableView(resultList);
            //resultsTableView.getItems().clear();

            } catch (Exception ex) {
             ex.printStackTrace();
            }
        });

        gridPane.add(searchLabel, 0, 2);
        gridPane.add(searchField, 1, 2);
        gridPane.add(submitButton, 1, 3, 2, 1);
        gridPane.add(clearButton, 1, 3);
        GridPane.setMargin(searchLabel, new Insets(0, 10, 0, 50)); // Add left-side margin to search label


        // Set left and right margins for the GridPane
        gridPane.setPadding(new Insets(0, 20, 0, 20)); // 20 pixels left and right margins

        // Set up the scene
        Scene scene = new Scene(gridPane, 600, 400);
        primaryStage.setTitle(AppConstants.APPLICATION_TITLE);
        primaryStage.setScene(scene);
        primaryStage.show();

     
        
    }


    public static void main(String[] args) {
        launch(args);
    }

    private void displaySearchResultsNotFound(String query)  {
        Alert alert=new Alert(Alert.AlertType.WARNING);
        alert.setTitle("No Result Found");
        alert.showAndWait();

    }
    private void displaySearchResults(String query,String[] searchResults) {
        Label resultLabel = new Label("Results for: " + query);
        Stage resultStage = new Stage();
        resultStage.setTitle("Search Results");

        VBox resultLayout = new VBox(10);
        resultLayout.getChildren().add(resultLabel);

      // String[] searchResults = {"Result 1", "Result 2", "Result 3"}; // Example search results
        ListView<String> resultListView = new ListView<>();
        resultListView.getItems().addAll(searchResults);
        resultLayout.getChildren().add(resultListView);

        resultListView.setOnMouseClicked(event -> {
                if (event.getClickCount() == 1) {
                    String selectedOutput = resultListView.getSelectionModel().getSelectedItem();
                    displayResultDetails(selectedOutput);
                    System.out.println("Selected Result:" +selectedOutput);
                }
            });

        Scene resultScene = new Scene(resultLayout, 300, 200);
        resultStage.setScene(resultScene);
        resultStage.show();
    }

    private void displayResultDetails(String result) {
        Label detailLabel = new Label("Details for: " + result);
        Stage detailStage = new Stage();
        detailStage.setTitle("Result Details");
        VBox detailLayout = new VBox(10);
        detailLayout.getChildren().add(detailLabel);

        Scene detailScene = new Scene(detailLayout, 300, 200);
       detailStage.setScene(detailScene);
       detailStage.show();
}

    private String[] performSearch(String query) {
        if (query.isEmpty()) {
            return new String[]{"Result 1", "Result 2", "Result 3"};
        } else {
            return new String[0];
        }
    }


}













 /*
        resultsTableView = new TableView<>();
        TableColumn<LabelValuePair, String> labelColumn = new TableColumn<>("Label");
        labelColumn.setCellValueFactory(new PropertyValueFactory<>("label"));
        TableColumn<LabelValuePair, String> valueColumn = new TableColumn<>("Value");
        valueColumn.setCellValueFactory(new PropertyValueFactory<>("value"));
        resultsTableView.getColumns().addAll(labelColumn, valueColumn);

        resultsTableView.setFixedCellSize(25);

        gridPane.add(resultsTableView, 0, 3, 3, 1);
        GridPane.setHalignment(resultsTableView, HPos.CENTER); // Center-align the TableView


         */


/*

    private void setupTableView(List<ErrorAssistTO> resultList)
    {
        if(resultList != null && resultList.size() > 0) {
            //For now take only the first row
            ErrorAssistTO errorAssistTO = resultList.get(0);
            if (errorAssistTO != null) {
                LabelValuePair lvp1 = new LabelValuePair("Application", errorAssistTO.applicationName);
                LabelValuePair lvp2 = new LabelValuePair("Applies To", errorAssistTO.versions);
                LabelValuePair lvp3 = new LabelValuePair("Error Code", errorAssistTO.errorCode);
                LabelValuePair lvp4 = new LabelValuePair("Description", errorAssistTO.description);
                LabelValuePair lvp5 = new LabelValuePair("Cause", errorAssistTO.cause);
                LabelValuePair lvp6 = new LabelValuePair("Solution", errorAssistTO.solution);
                LabelValuePair lvp7 = new LabelValuePair("Other Comments", errorAssistTO.otherComments);
                LabelValuePair lvp8 = new LabelValuePair("Source", errorAssistTO.source);
                LabelValuePair lvp9 = new LabelValuePair("Last Updated", errorAssistTO.lastUpdated);
                resultsTableView.getItems().addAll(lvp1, lvp2, lvp3, lvp4, lvp5, lvp6, lvp7, lvp8, lvp9);
            }
        }
        else
        {
            System.out.println("I am here");
            LabelValuePair lvp1 = new LabelValuePair("Application", "TEST_VALUE");
            resultsTableView.getItems().add(lvp1);
        }

    }


 */



/*



        public class LabelValuePair {
            private final String label;
            private final String value;

            public LabelValuePair(String label, String value) {
                this.label = label;
                this.value = value;
            }

            public String getLabel() {
                return label;
            }

            public String getValue() {
                return value;
            }
        }


    }


 */

