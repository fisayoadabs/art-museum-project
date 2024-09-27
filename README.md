# Art Museum Database Application

This project was developed by Oluwafisayo Adabs, Obaapanin Agyekum, and Kameel Kasumu as part of our database systems coursework. The goal of this application is to manage an art museum's sql database, allowing users with different roles (Admin, Employee, Guest) to interact with the system in various ways. We designed the database structure using an **Entity-Relationship (ER) diagram** and mapped it into a relational schema.

## Features

### User Roles:
1. **Admin**: Has full control over the database, including altering tables and managing the database schema.
2. **Employee (Data Entry)**: Can insert, delete, and update records in the museum's database.
3. **Guest**: Can browse the museum's data (e.g., art objects, artists, exhibitions) but cannot make any changes.

### Supported Operations:
- **Insert**: Add new records to the database.
- **Delete**: Remove records based on specific criteria.
- **Update**: Modify existing records.
- **Show Table**: Display data from the tables with optional search and sort functionalities.
- **Alter Table (Admin Only)**: Modify the database schema by adding, dropping, or modifying columns.

## Database Design
We started by constructing an **Entity-Relationship (ER) diagram** to model the relationships between different entities such as `Art Objects`, `Artists`, `Exhibitions`, and `Collections`. From this ER diagram, we derived a **Relational Data Mapping** which was then implemented as a MySQL database. The schema includes tables for:
- Art Objects
- Artists
- Exhibitions
- Collections
- Displays
- Paintings
- Sculptures/Statues
- Permanent Collections
- Borrowed Items

[FINAL PROJECT RELATIONAL DATA MODEL.pdf](https://github.com/user-attachments/files/17166439/FINAL.PROJECT.RELATIONAL.DATA.MODEL.pdf)

[FINAL PROJECT EER DIAGRAM.pdf](https://github.com/user-attachments/files/17166437/FINAL.PROJECT.EER.DIAGRAM.pdf)

## Technologies Used

- **MySQL**: Database system used to store and manage the museum data.
- **Python**: Programming language used to develop the application.
- **Tabulate**: Python library for formatting tables in a human-readable format.
- **ER Diagram & Relational Mapping**: Used to design and structure the database.

This project reflects our understanding of database management systems, relational database design, and Python-based interactions with MySQL.
