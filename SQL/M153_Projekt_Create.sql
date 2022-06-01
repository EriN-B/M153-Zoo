DROP DATABASE IF EXISTS m153_Zoo;
CREATE DATABASE m153_Zoo;
USE m153_Zoo;

CREATE TABLE Enclosures(
    EnclosureId int primary key auto_increment,
    `name` varchar(255)
);

CREATE TABLE Animal(
    AnimalId int primary key auto_increment,
    fk_EnclosureId int,
    `name` varchar(255),
    Birthday date,
    FOREIGN KEY (fk_EnclosureId) REFERENCES Enclosures (EnclosureId)
);

CREATE TABLE Feed(
    FeedId int primary key auto_increment,
    Feed_Name varchar(255),
    `description` varchar(255)
);

CREATE TABLE Feeding(
    FeedingId int primary key auto_increment,
    fk_AnimalId int,
    fk_FeedId int,
    Amount int,
    Feeding_Time int,
    FOREIGN KEY (fk_AnimalId) REFERENCES Animal(AnimalId),
    FOREIGN KEY (fk_FeedId) REFERENCES Feed(FeedId)
);

CREATE TABLE Properties(
    AnimalId int,
    Description varchar(255)
);

DROP TRIGGER AddProperties;

CREATE TRIGGER AddProperties
    BEFORE INSERT ON Animal
    for each row
        IF (NEW.Birthday > CURDATE()) THEN
            SET NEW.Birthday = NULL;
        END IF;


INSERT INTO Enclosures(name)
VALUES ('Affengehäge'),
       ('Löwengehäge'),
       ('Elefantengehäge');

INSERT INTO Animal(fk_EnclosureId, name, Birthday)
VALUES (1, 'Huhrensohn', '2022-01-01'),(1, 'Affe', '2023-01-01');




select * from Animal;
delete from Animal;



