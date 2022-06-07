USE m153_Zoo;

/*Man erhält von von jedem Tier die Tiergruppe, den Gehägename, die Fütterungszeit und das Futter*/
SELECT Animal.AnimalId, Animal.name, AG.AnimalGroupId, AG.name, E.name, FE.Feeding_Time, F.Feed_Name FROM Animal
JOIN AnimalGroup AG on Animal.fk_AnimalGroupId = AG.AnimalGroupId
JOIN Enclosures E on E.EnclosureId = AG.fk_EnclosureId
JOIN Feeding FE on AG.AnimalGroupId = FE.fk_AnimalGroupId
JOIN Feed F on F.FeedId = FE.fk_FeedId;

/* Man erhält die Grösse in Zentimeter des Tieres mit der Id 1 */
CALL GetAnimalsWithSizeInCentimeters((select Size FROM Animal WHERE AnimalId = 1), @Result);
select *, @Result AS 'Groesse in Zentimeter' FROM Animal WHERE AnimalId = 1;

/* Man erhält das Alter des Tieres mit der Id 1*/
CALL GetAge((select Birthday FROM Animal WHERE AnimalId = 1), @Age);
select *, @Age AS 'Alter' FROM Animal WHERE AnimalId = 1;

/*Wenn man das DELETE-Statement ausführt wird die Tiergruppe die Fütterungsinformationen und das Gehäge der Tiergruppe gelöscht*/
DELETE FROM Animal WHERE AnimalId = 3;
SELECT A.name, AG.name, E.name, F.fk_AnimalGroupId, F.Feeding_Time FROM AnimalGroup AS AG
join Enclosures E on E.EnclosureId = AG.fk_EnclosureId
join Animal A on AG.AnimalGroupId = A.fk_AnimalGroupId
join Feeding F on AG.AnimalGroupId = F.fk_AnimalGroupId;


/*Wenn man das INSERT-Statement ausführt, aber das Geburtsdatum in der Zukunft liegt, wird das Datum auf Heute geändert*/
INSERT INTO Animal(fk_AnimalGroupId, name, Birthday, Size)
VALUES(6, 'Hansu', '2023-01-01', 1.42);
SELECT * FROM Animal WHERE name = 'Hansu'