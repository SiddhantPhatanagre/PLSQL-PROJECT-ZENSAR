# Cinema Ticket Booking System

## Project Overview

The Cinema Ticket Booking System is a PL/SQL-based project designed to manage and facilitate movie ticket bookings. It includes functionalities for managing users, movies, theaters, and bookings, ensuring seamless operations in a cinema environment.

## Features
User Management:Handles user registration with roles like Admin and Customer.Stores user information securely with validations.

Movie Management:Tracks movies with attributes like title, genre, duration, and release date.Supports CRUD operations for managing movie details.
	
Theater and Screening Management:Manages theater details and movie screenings.
		
Booking System:	Enables customers to book tickets for available screenings.Admins can view and manage bookings.

## Database Design:

The project involves the following key tables:
	1.	Users:
	•	Tracks user details such as name, email, phone, and user type (Admin or Customer).
	2.	Movies:
	•	Stores movie details including title, genre, duration, and release date.
	3.	Theaters:
	•	Manages theater information such as name, location, and capacity.
	4.	Bookings (possibly):
	•	Handles ticket bookings, associating users, movies, and screening details.

## Technologies Used
PL/SQL: For database programming.
Oracle Database: Backend database.
SQL*Plus: Command-line interface for running scripts.

## How to Run
Ensure you have Oracle Database installed and running.
Use SQL*Plus or any PL/SQL-compatible IDE to execute the provided SQL script.
Load the database schema by running the .sql file.
Test functionalities using queries for CRUD operations on the respective tables.

## Future Enhancements:
Add a web or mobile interface for easier user interaction.
Include advanced features like payment integration and ticket cancellation.
Implement comprehensive error handling and reporting mechanisms.

## Guidance:
This project is created under the guidance of aniruddha gaikwad sir.
