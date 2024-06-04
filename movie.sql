CREATE DATABASE movies;

USE movies;

CREATE TABLE movies_details(
id INT,
name VARCHAR(25)UNIQUE,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE(10,5),
collections DOUBLE(10,5),
ratings FLOAT CHECK(ratings>0 AND ratings<10),
PRIMARY KEY(id)
);

SHOW TABLES;

DESC movies_details;
-- MODIFY THE TABLE IN DOUBLE TO BIGINT--
ALTER TABLE movies_details MODIFY COLUMN budget BIGINT;
ALTER TABLE movies_details MODIFY COLUMN collections BIGINT;

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(1,"GGVV",2020,"Kannada","Raj B Shetty",10000000,30000000,9.1);

SELECT*FROM movies_details;

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(2,"ASN",2019,"Kannada","Sachin",23000000,56000000,7.9);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(3,"Rathanan Prapancha",2021,"Kannada","Rohit",33000000,16000000,8.6);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(4,"KGF",2018,"Kannada","Prashantha",25000000,66000000,8.9), 
(5,"Yuvarathana",2021,"Kannada","Santosh Anada Ram",27000000,88000000,9.5), 
(6,"suryavamshi",2021,"Kannada","Akshaya",21000000,44000000,9.0),
(7,"Pushpa",2021,"Telagu","Prashantha",23000000,54000000,7.9);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(8,"Sakath",2021,"Kannada","Simple Suni",25000000,66000000,8.1),
(9,"Kotigobba 3",2021,"Kannada","Shiva Karthik",19000000,43000000,8.8),
(10,"Madhagaja",2021,"Kannada","S. Mahesh Kumar",12000000,44000000,8.6);

SELECT*FROM movies_details WHERE ratings>=8;

UPDATE movies_details SET platform="Netflix" WHERE id='2';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='3';
UPDATE movies_details SET platform="Netflix" WHERE id='4';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='5';
UPDATE movies_details SET platform="Netflix" WHERE id='6';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='7';
UPDATE movies_details SET platform="Netflix" WHERE id='8';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='9';

SELECT*FROM movies_details WHERE ratings>=8 AND platform='Netflix';

SELECT*FROM movies_details WHERE lang='Kannada';

SELECT*FROM movies_details WHERE director='Akshaya' OR director='Simple Suni' OR director='Raj B Shetty' OR director='Shiva Karthik';

SELECT*FROM movies_details WHERE year=2020;

SELECT*FROM movies_details WHERE year>2020 AND year<=2020;
-- only display in movie name --
SELECT name FROM movies_details;
-- only display in director name and movie name --
SELECT name, director FROM movies_details;
-- only display in director name --
SELECT director FROM movies_details;
-- it is diplay in distinct values --
SELECT DISTINCT director FROM movies_details;
-- duplicte value not display--
SELECT DISTINCT director,year FROM movies_details;
-- Year in ACENDING--
SELECT*FROM movies_details ORDER BY YEAR;
-- Rating in DESCENDING--
SELECT*FROM movies_details ORDER BY ratings DESC;

INSERT INTO movies_details(id,name,year,lang,budget,collections,ratings) VALUE(12,"Avangers Endgame",2019,"English",18000000,48000000,7.3);

UPDATE movies_details SET id=11 WHERE name='Avangers Endgame';

INSERT INTO movies_details(id,name,year,lang,budget,collections,ratings) VALUE(12,"Avatar",2006,"English",36000000,39000000,6.3);

-- display in is null values --
SELECT*FROM movies_details WHERE director IS NULL;
-- display in is null not values --
SELECT*FROM movies_details WHERE director IS NOT NULL;
-- Change the varchar values --
ALTER TABLE movies_details MODIFY COLUMN platform VARCHAR(20) NOT NULL;
-- add the primary key values--
-- ALTER TABLE movies_details ADD PRIMARY KEY(id);--

DELETE FROM movies_details WHERE name='Avangers Endgame';

DELETE FROM movies_details WHERE name='Avatar' AND year=2008;
-- IT IS DISPLAY THE ONLY 5 VALUE BECAUSE USING LIMIT --
SELECT*FROM movies_details LIMIT 5;
-- search the movie name last word %prapancha --
SELECT*FROM movies_details WHERE name LIKE '%prapancha';
-- search the movie name first two character gg% --
SELECT*FROM movies_details WHERE name LIKE 'gg%';
-- search the movie name in the middle word %rathna --
SELECT*FROM movies_details WHERE name LIKE '%rathana%';
-- search the movie director name in the middle word %rathna --
SELECT*FROM movies_details WHERE director LIKE '%Anada%';
-- search the movie name in the middle letter _g% --
SELECT*FROM movies_details WHERE name LIKE '_g%';
-- search the movie name in the start letter and third letter A_A% --
SELECT*FROM movies_details WHERE name LIKE 'A_A%';
-- search the movie name in the third letter __T% --
SELECT*FROM movies_details WHERE name LIKE '__T%';
-- search the movie name in the secand letter and six letter __T% --
SELECT*FROM movies_details WHERE name LIKE '_U__A%';
-- using alias as --
SELECT name AS movies_name FROM movies_details;
-- using alias as --
SELECT collections AS total_movie_collections FROM movies_details;

SELECT movies_details.name,movies_details.director FROM movies_details;
-- short cut using movies_details of M --
SELECT M.name,M.director FROM movies_details M;
-- maximum value OF COLLECTIONS --
SELECT MAX(collections) AS Heighest_Movie_Collection FROM movies_details;
-- maximum value OF BUDGET --
SELECT MAX(budget) AS Heighest_Movie_Budget FROM movies_details;
-- minimum value OF COLLECTIONS --
SELECT MIN(collections) AS Lowest_Movie_Collection FROM movies_details;
-- minimum value OF BUDGET --
SELECT MIN(budget) AS Lowest_Movie_Budget FROM movies_details;
-- Avarage value OF COLLECTIONS --
SELECT AVG(collections) AS Avarage_Movie_Collection FROM movies_details;
-- sum value OF COLLECTIONS --
SELECT SUM(collections) AS Total_Movie_Collection FROM movies_details;
-- count the movies name --
SELECT COUNT(name) AS Number_Of_Movies FROM movies_details;
-- count the director name --
SELECT COUNT(director) AS Number_Of_Director FROM movies_details;
-- count the movies name --
SELECT COUNT(*) AS Number_Of_Movies FROM movies_details;
-- count the particular director name --
SELECT COUNT(DISTINCT director) AS Number_Of_Movies_By_Unique_Director FROM movies_details;
-- count the particular language --
SELECT COUNT(DISTINCT lang) AS Number_Of_Movies_By_Unique_Language FROM movies_details;
-- cuurent date--
SELECT CURDATE() AS Present_Date;
-- current time--
SELECT CURTIME() AS Present_Time;
-- date and time--
SELECT NOW() AS Present_Date_Time;

INSERT INTO movies_details(id,name,lang,platform,Released_date_time) VALUE(13,'Badava Rascal','Kannada','Theaters','2021-12-19 13:05:05');

INSERT INTO movies_details(id,name,lang,platform,Released_date_time) VALUE(14,'Spider Man','English','Theaters',NOW());
-- ADD THE TABLE Released_date_time--
ALTER TABLE movies_details ADD COLUMN Released_date_time DATETIME;
-- DISPLAY ONLY DATE--
SELECT name,DATE(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY ONLY TIME--
SELECT name,TIME(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY THE MONTH NAME--
SELECT name,MONTHNAME(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY THE YEAR--
SELECT name,YEAR(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY DAY--
SELECT name,DAY(Released_date_time) FROM movies_details WHERE id=13;
-- DAY NAME-- 
SELECT name,DAYNAME(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY HOUR--
SELECT name,HOUR(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY MINUTE--
SELECT name,MINUTE(Released_date_time) FROM movies_details WHERE id=13;
-- DISPLAY SECOND--
SELECT name,SECOND(Released_date_time) FROM movies_details WHERE id=13;


DESC movies_details;
SELECT*FROM movies_details;

SELECT COUNT(name) AS No_of_Movies_in_2021, YEAR FROM movies_details WHERE YEAR=2021;
-- NO OF MOVIES IN EACH YEAR--
SELECT COUNT(name) AS No_of_Movies_in_2021, YEAR FROM movies_details GROUP BY year;
-- NO OF MOVIES DONE BY EACH DIRECTOR--
SELECT COUNT(name) AS  No_of_Movies_By_Director, Director FROM movies_details GROUP BY director;

-- no of movies avilable in each platform-
SELECT COUNT(name) AS  No_of_Movies_By_Platform, platform FROM movies_details GROUP BY platform;

-- no of movies done in each month--
SELECT COUNT(name) AS No_of_Movies_By_Month, MONTHNAME(Released_date_time) AS released_month FROM movies_details GROUP BY released_month;

-- no of movies done in each lang--
SELECT COUNT(name) AS No_of_Movies_By_Lang, lang FROM movies_details GROUP BY lang;

-- No of movies by each year and director--
SELECT COUNT(name) AS No_of_Year_And_Director, year,director FROM movies_details GROUP BY year,director;

-- heighest collection done in each year and name--
SELECT MAX(collections) AS Highest_Collections_By_Year, year FROM movies_details GROUP BY year;

-- heighest collection done in each year and name ORDER BY COLLECTION DESC--
SELECT MAX(collections) AS Highest_Collections_By_Year, year FROM movies_details GROUP BY year ORDER BY Highest_Collections_By_Year DESC;

-- heighest collection done in each year and name ORDER BY YEAR DESC--
SELECT MAX(collections) AS Highest_Collections_By_Year, year FROM movies_details GROUP BY year ORDER BY YEAR DESC;

-- HIGHEST RATING IN EACH PLATFORM  AND IN ORDER IT BY RATING DESC ORDER--
SELECT MAX(ratings) AS Highest_Rating_By_Platform, platform FROM movies_details GROUP BY platform ORDER BY Highest_Rating_By_Platform DESC;

-- lowest collection of each year--
SELECT MAX(collections) AS Lowest_Collection_By_Year, year FROM movies_details GROUP BY year ORDER BY Lowest_Collection_By_Year;

-- LOWEST BUDGET BY EACH DIRECTOR--
SELECT MIN(budget) AS Lowest_Budget_Director, director FROM movies_details GROUP BY director ORDER BY Lowest_Budget_Director;

-- TOTAL COLLECTIONS DONE BY EACH PLATFORM ORDER BY COLLECTIONS IN desc--
SELECT SUM(collections) Total_Collections_By_Platform, platform FROM movies_details GROUP BY platform ORDER BY Total_Collections_By_Platform DESC;

-- Average collection by each year --
SELECT AVG(collections) AS Avarage_Collection_By_Year, year FROM movies_details GROUP BY year ORDER BY Avarage_Collection_By_Year;

-- average collection selected director --
SELECT AVG(collections) AS Average_collection_By_Director,director FROM movies_details WHERE director IN('Raj B Shetty', 'Rohit', 'Sachin') GROUP BY director;

-- average collection by each director having collections greter than 50thousand--
SELECT AVG(collections) AS Average_collection_By_Director,director FROM movies_details  GROUP BY director HAVING Average_collection_By_Director>50000000;


-- total collection done by each director  having total lesser than 90000--
SELECT AVG(collections) AS Average_collection_By_Director,director FROM movies_details  GROUP BY director HAVING Average_collection_By_Director<60000000;

SELECT MAX(collections) FROM movies_details;
-- GET THE DETAILS OF THE MOVIE WHICH HAS THE HIGHTEST COLLECTIONS;
-- OUTER QUERY                                  -- INNER QUERY
SELECT*FROM movies_details WHERE collections=(SELECT MAX(collections) FROM movies_details);

-- GET SECAND HIGHEST COLLECTION OF THE MOVIE --
SELECT MAX(collections) FROM movies_details WHERE collections <(SELECT MAX(collections) FROM movies_details);

-- GET THE DETAILS OF THE MOVIE WHICH HAS  THE SECAND HIGHEST COLLECTIONS --
SELECT*FROM movies_details WHERE collections = (SELECT MAX(collections) AS Secand_Heighest_Collection FROM movies_details WHERE collections <(SELECT MAX(collections) FROM movies_details));

	-- GET THE DETAILS OF THE MOVIE WHICH HAS  THE THIRD HIGHEST COLLECTIONS --
    SELECT*FROM movies_details WHERE collections = (SELECT MAX(collections) AS Third_Heighest_Collection FROM movies_details WHERE collections < 
    (SELECT MAX(collections) FROM movies_details WHERE collections)<(SELECT MAX(collections) FROM movies_details));

-- second highest collection of the movie in kannada lang
SELECT * FROM movies_details WHERE lang='Kannada';
SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada')AND lang='Kannada';

-- Get the details of the movie which has the second highest collection in kannnada lang
SELECT* FROM movies_details WHERE collections=(SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada'));


-- get the movie details which has lowest collection 
SELECT * FROM movies_details WHERE collections=(SELECT MIN(collections)FROM movies_details);

-- get the details of the movies which has both highest and lowest
SELECT * FROM movies_details WHERE collections IN ((SELECT MAX(collections)FROM movies_details),(SELECT MIN(collections)FROM movies_details)) ;

-- get the movies details which has the highest collection done by each director
SELECT MAX(collections),director FROM movies_details GROUP BY director;

SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director);

-- get the movies details which has the highest collection done by each director having greater than 10000
SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director HAVING MAX(collections)>50000);


CREATE TABLE movies_details_duplicate(
id INT,
name VARCHAR(25)UNIQUE,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE(10,5),
collections DOUBLE(10,5),
ratings FLOAT CHECK(ratings>0 AND ratings<10),
PRIMARY KEY(id)
);

DESC movies_details_duplicate;

ALTER TABLE movies_details_duplicate ADD COLUMN released_data_time DATETIME;

SELECT * FROM movies_details_duplicate;

ALTER TABLE movies_details MODIFY COLUMN budget double;
ALTER TABLE movies_details MODIFY COLUMN collections double;

INSERT INTO movies_details_duplicate SELECT * FROM movies_details WHERE id  IN (SELECT id FROM movies_details);

-- update the rating as 9 for movies the highest collection done by each director
UPDATE movies_details SET ratings=9.1 WHERE collections IN(SELECT MAX(collections) FROM movies_details_duplicate GROUP BY director);

DELETE FROM movies_details WHERE id IN(select id FROM movies_details_duplicate WHERE id>11);

SELECT*FROM movies_details;







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
Label resultLabel = new Label("Output Result");
Label noResultLabel = new Label("No results found for the given query.");
VBox resultLayout = new VBox(10);

@Override
public void start(Stage primaryStage) {

    GridPane gridPane = new GridPane();

    gridPane.setHgap(10);
    gridPane.setVgap(10);
    Label headingLabel = new Label("Guidewire Error Assist");

    headingLabel.setStyle("-fx-font-size: 24px; -fx-font-weight: bold;");
    GridPane.setConstraints(headingLabel, 0, 0);

        GridPane.setColumnSpan(headingLabel, 3);

    GridPane.setHalignment(headingLabel, HPos.CENTER);
    gridPane.getChildren().add(headingLabel);

    Separator separator = new Separator();
    gridPane.add(separator, 0, 1, 3, 1);


    Label searchLabel = new Label("Enter error message ");
    TextField searchField = new TextField();

    searchField.setPromptText("Enter search text");

    Button submitButton = new Button("Submit");
    GridPane.setHalignment(submitButton, HPos.RIGHT);
    Button clearButton = new Button("Clear");
    GridPane.setHalignment(clearButton, HPos.CENTER);

    gridPane.add(searchLabel, 0, 2);
    gridPane.add(searchField, 1, 2);
    gridPane.add(submitButton, 1, 3, 2, 1);
    gridPane.add(clearButton, 1, 3);
    GridPane.setMargin(searchLabel, new Insets(0, 10, 0, 50)); // Add left-side margin to search label

    gridPane.setPadding(new Insets(0, 20, 0, 20)); // 20 pixels left and right margins
    resultLayout.getChildren().add(resultLabel);
    resultLayout.getChildren().add(resultListView);
    resultLayout.getChildren().add(noResultLabel);
    noResultLabel.setVisible(false);



    gridPane.add(resultLayout, 0, 4, 3, 1);
    Scene scene = new Scene(gridPane, 600, 400);

    primaryStage.setTitle("Guidewire Error Assist");
    primaryStage.setScene(scene);
    primaryStage.show();

 submitButton.setOnAction(e -> {
     try {
         String query = searchField.getText();
         String[] searchResults = performSearch(query);
        if (searchResults != null && searchResults.length > 0) {
            displaySearchResults(query, searchResults);
        } else {
            displaySearchResultsNotFound(query);
        }
     } catch (Exception ex) {
         ex.printStackTrace();
}
});

clearButton.setOnAction(e -> {
    try {
        searchField.clear();
        resultListView.getItems().clear();
        resultLabel.setText("Output Result");
        noResultLabel.setVisible(false);
    } catch (Exception ex) {
    ex.printStackTrace();
}

});


}
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

 */

public static void main(String[] args) {
    launch(args);
}

private void displaySearchResultsNotFound(String query) {
    resultListView.getItems().clear();
    resultLabel.setText("Output Result");
    noResultLabel.setVisible(true);
}

private void displaySearchResults(String query, String[] searchResults) {
    resultLabel.setText("Results for: " + query);
    resultListView.getItems().clear();
    resultListView.getItems().addAll(searchResults);
    noResultLabel.setVisible(false);

    resultListView.setOnMouseClicked(e->{
        if (e.getClickCount()==1){
        String selectedResults = resultListView.getSelectionModel().getSelectedItem();
        displayResultDetails(selectedResults);
        }
    });
}
    private void displayResultDetails(String result) {
        Label detailLabel = new Label("Details for: " + result);
        Stage detailStage = new Stage();
        detailStage.setTitle("Result Details");
        VBox detailLayout = new VBox(10);
        detailLayout.getChildren().add(detailLabel);

        String resultDetails = getresultDetails(result);

        Scene detailScene = new Scene(detailLayout, 300, 200);
        detailStage.setScene(detailScene);
        detailStage.show();
    }

    private String getresultDetails(String result){
    switch (result){
        case "How to fix FileNotFoundError in Python":
            return "Details for Result: Error can't resolve";
        case "Result 2":
            return "Details for Result:";
        case "Result 3":
            return "Details for Result :";
        default:
            return "Details not available";
    }
    }

private String[] performSearch(String query) {
    if (query.equals("How to fix FileNotFoundError in Python")) {
        return new String[]{"How to fix FileNotFoundError in Python", "Result 2", "Result 3"};

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




































 
