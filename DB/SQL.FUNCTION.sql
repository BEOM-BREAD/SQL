USE BaseballData;

SELECT * FROM dbo.players;


SELECT nameFirst, nameLast,
DATEFROMPARTS(birthYear, birthMonth, birthDay) AS 생일, 
DATEFROMPARTS( deathYear , deathMonth, deathDay) AS 사망날짜,
(deathYear - birthYear) AS 생전나이
FROM players
WHERE deathYear IS NOT NULL AND DATEFROMPARTS(birthYear, birthMonth, birthDay) IS NOT NULL
ORDER BY 생전나이 DESC;


SELECT DISTINCT birthCity 
FROM players
WHERE birthCity LIKE 'New_____';

SELECT *
FROM players;


SELECT *
FROM players
WHERE birthCountry IS NOT NULL
GROUP BY birthCountry

SELECT *
FROM players;

SELECT birthCountry, COUNT(lahmanID) AS playerCount
FROM players
WHERE birthCountry IS NOT NULL
GROUP BY birthCountry
HAVING COUNT(lahmanID) > 10
ORDER BY playerCount DESC

SELECT *
FROM batting;

SELECT teamID, SUM(HR) AS homerunSum
FROM batting
GROUP BY teamID
ORDER BY SUM(HR) DESC;


SELECT *
FROM batting
WHERE HR =
(
	SELECT TOP(1) MAX(HR) AS maxHR
	FROM batting
	GROUP BY teamID
	ORDER BY MAX(HR) DESC
)



SELECT birthYear, nameFirst, nameLast
FROM players
WHERE birthYear >= 1900;


SELECT *
FROM
(
SELECT birthYear, nameFirst, nameLast
FROM players
WHERE birthYear >= 1900
) T0
WHERE T0.nameFirst LIKE 'A%';


SELECT TOP (1) playerID, birthYear, nameFirst, nameLast
FROM players
ORDER BY birthYear DESC;


SELECT nameFirst, nameLast, birthYear, birthMonth, birthDay
FROM players
WHERE playerID =
(
SELECT TOP (1) playerID
FROM players
ORDER BY birthYear DESC
);


(SELECT * FROM players
WHERE birthYear >= 1950)
UNION
(SELECT * FROM players
WHERE birthYear < 1900)

SELECT playerID, AVG(salary) AS 평균연봉
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000


SELECT playerID, birthMonth
FROM players
WHERE birthMonth = 12


SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000 AND playerID IS NOT NULL
UNION ALL-- 중복을 허용하지 않음
SELECT playerID
FROM players
WHERE birthMonth = 12 AND playerID IS NOT NULL
ORDER BY playerID


SELECT *
FROM
((SELECT TOP(100) * FROM players) T0
CROSS JOIN
(SELECT TOP(100) * FROM salaries) T1)


SELECT lahmanID, playerID, nameFirst, nameLast
FROM players

SELECT *
FROM salaries

SELECT lahmanID, pTable.playerID, nameFirst, nameLast, salary
FROM players AS pTable
INNER JOIN salaries AS sTable
ON pTable.playerID = sTable.playerID -- 외래키


SELECT lahmanID, pTable.playerID, nameFirst, nameLast, salary
FROM players AS pTable
LEFT JOIN salaries AS sTable
ON pTable.playerID = sTable.playerID;
