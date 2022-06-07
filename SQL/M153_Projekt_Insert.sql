USE m153_Zoo;


INSERT INTO Enclosures (name)
VALUES
    ('Ape-Enclosure'),
    ('Giraffe-Enclosure'),
    ('Lion-Enclosure'),
    ('Bird-Enclosure'),
    ('Crocodile-Enclosure'),
    ('Penguin-Enclosure');

INSERT INTO AnimalGroup (fk_EnclosureId, Name)
VALUES
(1,'Apes'),
(2,'Giraffes'),
(3,'Lions'),
(4,'Birds'),
(5,'Crocodiles'),
(6,'Penguins');

INSERT INTO Animal (fk_AnimalGroupId, name, Size, Birthday)
VALUES
(1,'Coco', 0.85,'2010-06-07'),
(1,'Manfred', 1.04,CURDATE()),
(2,'Yolo', 5.47,CURDATE()),
(3,'Jojo', 1.92, CURDATE()),
(4,'Bubatz', 0.48, CURDATE()),
(5, 'Joko', 3.75, CURDATE()),
(6, 'Class', 1.49, CURDATE()),
(6, 'Peter', 1.32, CURDATE());


INSERT INTO Feed (Feed_Name, description)
VALUES
('Avocado', 'The avocado is a plant species from the laurel family. From a botanical point of view, the fruit is a berry and has historically been given many other names that are now rare, such as avocado pear, alligator pear or butter fruit.'),
('Grape','Grapes are the infructescences of the vines, especially those of the noble vine. The individual fruits of the infructescence are called grapes. Colloquially, a clear distinction is not always made between berries and grapes.'),
('Leafs','Leaves are lateral outgrowths at the nodes (nodes) of the shoot axis. The original functions of the leaves are photosynthesis (construction of organic substances with the help of light) and transpiration'),
('Zebra-Meat','Zebra meat is a generic term used to describe the meat of various species of zebra that is consumed as food and animal feed. For reasons of species protection, only the meat of the plains zebra / roan zebra is available in limited quantities.'),
('Gnu-Meat','The designation of the wildebeest as "roebuck" should not obscure the fact that their meat is very lean game meat. In terms of taste, however, this is reminiscent of beef.'),
('oats','Seed oats or real oats is a species of plant in the genus oats within the grass family. It is used as grain.'),
('Bird-Seeds','Bird seed is used to feed or supplement birds. A distinction must be made between feed for wild birds and for birds kept as pets or zoo animals. Bird food is one of the ways in which mugwort ragweed, a feared allergy trigger, spreads.'),
('Fish','Fishes are aquatic vertebrates with gills. In the narrower sense, the term fish is restricted to aquatic animals with jaws. In a broader sense, it also includes jawless species, which are still represented among the recent species with the cyclostomes.'),
('Crab','With around 6,800 species, the crabs – also known as real crabs or short-tailed crabs – are the largest infra-order of the order decapods. Most crab species live in the sea, but some also live in fresh water or on land.');


INSERT INTO Feeding (fk_AnimalGroupId, fk_FeedId, Amount, Feeding_Time)
VALUES
(1,1,50,'12:00:00'),
(1,2,90,'18:00:00'),
(2,3,300,'08:00:00'),
(3,4,200,'13:00:00'),
(3,5,200,'20:00:00'),
(4,6,15,'07:00:00'),
(4,7,30,'15:00:00'),
(5,8,300,'12:00:00'),
(6,9,200,'11:00:00');


INSERT INTO Properties (AnimalId, Description)
VALUES
(1,'communicative'),
(1,'playful'),
(2,'diligent'),
(2,'scared'),
(3,'old'),
(3,'aggressive'),
(4,'communicative'),
(4,'scared'),
(5,'playful'),
(5,'playful'),
(6,'aggressive'),
(7,'playful'),
(8,'playful');


