USE m153_Zoo;


select animal.AnimalId, animal.name, animalgroup.AnimalGroupId, animalgroup.Name, enclosures.name, feeding.Feeding_Time, feed.Feed_Name,properties.Description from animal
join animalgroup on animalgroup.AnimalGroupId = animal.fk_AnimalGroupId
join enclosures on enclosures.EnclosureId = animalgroup.fk_EnclosureId
join feeding on animal.fk_AnimalGroupId = feeding.fk_AnimalGroupId
join feed on feeding.fk_FeedId = feed.FeedId
join properties on animal.AnimalId = properties.AnimalId;
