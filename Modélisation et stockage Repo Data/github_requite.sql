use master

CREATE DATABASE Github_DB



use Github_DB

------------------
select * from Repositorys

select * from Contributors

select * from Contributor_bridge

select * from Languages

select * from Owner
------------------- 
-- Number of repo of such contributor name :
SELECT TOP 100 
  Contributors.name AS contributor_name,
  COUNT(Repositorys.Id) AS number_of_repos
FROM Contributors
JOIN Contributor_bridge ON Contributors.Id = Contributor_bridge.Id_contributor
JOIN Repositorys ON Repositorys.Id = Contributor_bridge.Id_repo
GROUP BY Contributors.name;

------------------------------------
-- Top 10 Contributors :
SELECT TOP 10 name, COUNT(name) as name_count
FROM Contributors
GROUP BY name
ORDER BY name_count DESC;

-----------------------------------------

-- The Language and Owner Name of such repo  :
SELECT Repositorys.Id, Repositorys.Url, Languages.name AS language_name, Owner.name AS owner_name
FROM Repositorys
JOIN Languages ON Repositorys.language_id = Languages.Id
JOIN Owner ON Repositorys.owner_id = Owner.Id;

-----------------------------------------
-- top 10 stars repo : 
SELECT TOP 10 name, stars, created_at
FROM Repositorys
WHERE stars > 100
ORDER BY created_at DESC;