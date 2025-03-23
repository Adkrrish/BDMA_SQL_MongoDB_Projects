```markdown
# 🎵 Music Streaming Database (ERD Project)

## 📌 Overview
This project focuses on designing and implementing an **Entity-Relationship Diagram (ERD)** for a **Music Streaming Database**. The ERD defines the schema and relationships between key entities such as **Users, Playlists, Tracks, Albums, Artists, Music Labels, and Contracts**. The primary goal is to ensure **data integrity, normalization, and efficient retrieval** for a scalable and structured music streaming platform.

## 📄 Project Report
The full report, including a detailed breakdown of the ER diagram, data structure, and normalization processes, can be accessed ("ERD Report" file) from the repository.

## 🛠️ Technologies Used
- **MySQL** - Relational database management system
- **MySQL Workbench** - ERD design and visualization
- **Normalization Techniques (1NF, 2NF)** - Ensuring database efficiency and integrity

## 📊 Key Features
- 🎼 **Well-structured relational schema** to support a music streaming platform
- 🔄 **One-to-Many and Many-to-Many Relationships** properly defined
- 🔑 **Primary and Foreign Key Constraints** ensuring referential integrity
- 📌 **Normalization (1NF, 2NF)** to minimize redundancy and anomalies
- 📋 **Entities:** Users, Playlists, Tracks, Albums, Artists, Music Labels, and Contracts
- 🗄️ **Scalable Design** for future enhancements such as AI-driven music recommendations

## 🔗 ERD Structure
The database schema includes the following entities:
- **Users**: Stores user details and subscription types.
- **Playlists & Tracks**: Many-to-Many relationship managed via a junction table.
- **Albums & Artists**: Each album belongs to an artist, with relationships to music labels.
- **Music Labels & Contracts**: Defines agreements between labels and artists.

## 👨‍💻 Contributors
- **Krishnendu Adhikary** (055022)
- **Mohit Agarwal** (055024)

## 📜 License
This project is for educational purposes only.
