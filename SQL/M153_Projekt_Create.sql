DROP DATABASE IF EXISTS m153_Zoo;
CREATE DATABASE m153_Zoo;
USE m153_Zoo;

CREATE TABLE Enclosures(
    EnclosureId int primary key auto_increment,
    `name` varchar(255)
);

CREATE TABLE Feed(
    FeedId int primary key auto_increment,
    Feed_Name text,
    `description` varchar(255)
);


CREATE TABLE AnimalGroup(
    AnimalGroupId int primary key  auto_increment,
    fk_EnclosureId int,
    `name` varchar(255),
    FOREIGN KEY (fk_EnclosureId) REFERENCES Enclosures (EnclosureId)
);

CREATE TABLE Animal(
    AnimalId int primary key auto_increment,
    fk_AnimalGroupId int,
    `name` varchar(255),
    Birthday date,
    Size float,
    FOREIGN KEY (fk_AnimalGroupId) REFERENCES AnimalGroup (AnimalGroupId)
);


CREATE TABLE Feeding(
    FeedingId int primary key auto_increment,
    fk_AnimalGroupId int,
    fk_FeedId int,
    Amount int,
    Feeding_Time TIME,
    FOREIGN KEY (fk_AnimalGroupId) REFERENCES AnimalGroup(AnimalGroupId),
    FOREIGN KEY (fk_FeedId) REFERENCES Feed(FeedId)
);



CREATE TABLE Properties(
    AnimalId int,
    Description varchar(255)
);



/* If the birthday date lays in the future, change it to Today's date*/
CREATE TRIGGER CheckBirthday
    BEFORE INSERT ON Animal
    for each row
        BEGIN
            IF (NEW.Birthday > CURDATE()) THEN
                SET NEW.Birthday = CURDATE();
            END IF;
        END;

CREATE TRIGGER RemoveAnimalGroupAndFeefing
    AFTER DELETE ON Animal
    FOR EACH ROW
        BEGIN
            IF (select count(AnimalId) from Animal where Animal.fk_AnimalGroupId = OLD.fk_AnimalGroupId) = 0 THEN
                DELETE FROM Feeding WHERE Feeding.fk_AnimalGroupId = OLD.fk_AnimalGroupId;
                DELETE FROM AnimalGroup WHERE AnimalGroup.AnimalGroupId = OLD.fk_AnimalGroupId;
            END IF;
END;

delete from Animal where fk_AnimalGroupId = 1 AND AnimalId = 1



