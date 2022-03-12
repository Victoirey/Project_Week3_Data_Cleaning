<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Data cleaning
*Victoire Rey & Eric Martinet*

**Data Analytics bootcamp @IronHack Paris, Feb-Apr 22**

## Content
- [Project Description](#project-description)
- [Technical Approach](#technical-approach)
- [Step-by-step approach](#step-by-step-approach)
- [Challenges and Highlights](#challenges-highlights)
- [Repo structure](#repo-structure)
- [Links](#links)

## Project Description

The goals of this project are:

1. To import, wrangle, clean, and manipulate a dataset with Python (here about the **entrepreneurial competency** of hundreds of students in India),
3. To export the clean dataset to a CSV file and to a MySQL database,
4. To implement MySQL queries to analyse the clean dataset.


## Technical Approach

We imported and manipulated the dataset using Pandas. For statisticals description and manipulation, we used Numpy.

We developped several functions that can be helpful for analysing / manipulating / cleaning any other dataset:

- description of the dataset and of each colum: general statistics, distribution of values, missing values
- filtering of columns: columns with null values, with numeric types, with non numeric types, low variance, with possibity to join the filters (e.g. to get the column with numeric types and with null values)
- drop of unnecessary columns: too many missing values or duplicates based on a subset of columns
- homogeneisation of data: columns names and values based on replacement dictionaries
- fill of missing values based on a method/columns dictionary

We eventually exported the clean dataset to a CSV file and to a AWS-hosted MySQL database using the sqlalchemy library, and we implemented several queries to analyse this database (students' profiles, likeliness to have entrepreneurial competency based on education sector and gender, key traits of entrepreneurs vs. non entrepreneurs, reasons for not having entrepreneurial competency).

## Step-by-step Approach

Overall approach was to reduce the dataset to necessary information, fill out missing information, and amend incorrect information, before export.

1. Description of general dataset
2. Homogeneisation of columns names (strip of whitespaces and special characters)
3. Drop of duplicate rows
4. Drop of low variance columns
4. Idenfication of missing values
5. Drop of rows with too many missing values
6. Fill missing numeric values
7. Fill missing non numeric values
8. Amendment of incorrect values
9. Homogeneisation of values
10. Treatment of specific columns for which an ad-hoc approach is required
11. Homogeneisation of datatypes at the end once information is complete, correct, and homogeneous
12. Final check
13. Export

## Challenges & Highlights

While developping a functional approach in Python to the analysis, wrangling and manipulation of the dataset might seem time-consuming at first, it offers great flexibility and reusability for any other dataset.


## Repo structure

Our repo is organised as follows:

- [data](./data): original dataset in Excel format and cleaned dataset in CSV format
- [python](./python): Python code for data import, wrangling, manipulation, and export to CSV & MySQL
- [sql](./sql): SQL queries for analysis of the cleaned database

## Links
[Original repository](https://github.com/Victoirey/Project_Week3_Data_Cleaning)
