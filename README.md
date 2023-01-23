# NHL_db

This is a personal PostgreSQL project I created using all real NHL players and teams to create views on specific stats across the NHL. 

## Table of Contents
-[Installation](#installation) 

-[Usage](#usage) 

-[Contributors](#contributors) 

-[Mock-Up](#mockup)

## Installation

Open up the script.sql file, this will have all the database and table creation queries. To date (January 2023) there should only be the following tables:
 Teams
 Nation
 Position 
 Player 

 Make sure to run the drop table query prior to creating each table. The Players table must be created last, as it has constraints that are dependent on the previous tables existing. 

Once all tables have been completed, you can then run the Create View queries. To date (January 2023), there should be the following views:

Highest 20 Salaries
Oldest 20 Players
Youngest 20 Players
Nation Representation

Make sure to run the drop view query prior to creating each view. 

Once all tables and views are created successfully, you can enter the seeds by clicking on each respective seed file and running the INSERT INTO query.

Once this step is complete, your database is successfully installed.

## Usage

Once the installation process is complete, you can then run the SELECT queries in the VIEWS section. The Highest 20 Salaries displays the top 20 highest paid players based on current year, the Oldest/Youngest 20 players is based on the Age input, not birthdate, and the Nation Representation displays the total amount of players representing each country in the NHL in descending order.

## Contributors

All data in this project was created by me and me alone. 

## Mock Up

![SalaryMockUp](https://user-images.githubusercontent.com/98717384/213924110-2b9be5b8-f6b4-45e6-a3b8-541f343d7072.jpg)


![NationMockUp](https://user-images.githubusercontent.com/98717384/213924124-bc0629dd-675c-41d9-8843-101e1aa6f027.jpg)








