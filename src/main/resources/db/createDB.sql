DROP TABLE StudentFile IF EXISTS;
DROP TABLE Student IF EXISTS;
DROP TABLE District IF EXISTS;
DROP TABLE City IF EXISTS;

  CREATE TABLE City (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    UNIQUE (city_name)
    );


  CREATE TABLE District (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    district_name VARCHAR(100),
    city_id INTEGER NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City
    );

  CREATE TABLE Student (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    phone  VARCHAR(100),
    description  VARCHAR(255),
    city_id INTEGER NOT NULL,
    district_id INTEGER NOT NULL,
    deleted BOOLEAN NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(id),
    FOREIGN KEY (district_id) REFERENCES District(id)
       );

  CREATE TABLE StudentFile (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    file_name  VARCHAR(100) NOT NULL,
    description  VARCHAR(255),
    content BLOB NOT NULL,
    content_type VARCHAR(100) NOT NULL,
    deleted BOOLEAN NOT NULL,
    student_id INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id)
      );
