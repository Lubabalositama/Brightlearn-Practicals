SELECT TOP (1000) [player_name]
      ,[team]
      ,[date_of_birth]
      ,[age]
      ,[marital_status]
      ,[number_of_kids]
      ,[nationality]
      ,[country_of_birth]
      ,[position]
      ,[preferred_foot]
      ,[height_cm]
      ,[weight_kg]
      ,[jersey_number]
      ,[injury_status]
      ,[agent]
      ,[matches_played]
      ,[minutes_played]
      ,[goals]
      ,[assists]
      ,[tackles]
      ,[interceptions]
      ,[saves]
      ,[clean_sheets]
      ,[yellow_cards]
      ,[red_cards]
      ,[passing_accuracy]
      ,[shot_accuracy]
      ,[previous_club]
      ,[years_at_club]
      ,[contract_end_year]
      ,[average_salary_zar]
      ,[market_value_zar]
      ,[signing_bonus_zar]
      ,[release_clause_zar]
  FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
  -----------------------------------------------------------------
 -- 1. View the first 100 rows of the dataset to understand its structure.
 SELECT TOP (100) *
 FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced];

 -- 2. Count the total number of players in the dataset.
 SELECT COUNT(DISTINCT player_name) AS Number_of_Players
  FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced];

 -- 3. List all unique teams in the league.
 SELECT DISTINCT(Team)
 FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced];

-- 4. Count how many players are in each team
SELECT COUNT(Player_name) AS Number_of_Players,
       Team
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;

-- 5. Identify the top 10 players with the most goals.
SELECT Top (10) Goals,
                Player_name
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY Goals DESC;

-- 6. Find the average salary for players in each team.
SELECT Team,
       AVG(CAST(average_salary_zar AS FLOAT)) AS avg_salary
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;

-- 7. Retrieve the top 10 players with the highest market value
SELECT TOP (10) Player_name,
                Market_value_zar
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY Market_value_zar DESC;

-- 8. Calculate the average passing accuracy for each position.
SELECT Position,
       AVG(CAST(Passing_accuracy AS FLOAT)) AS Average_passing_accuracy
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Position;

-- 9. Compare shot accuracy with goals to find correlations.
SELECT Goals,
       AVG(CAST(Shot_accuracy AS FLOAT)) AS Average_shot_accuracy,
       SUM(Goals*(CAST(Shot_accuracy AS FLOAT))) AS Goal_and_shot_correlation
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Goals
ORDER BY Goals DESC;

-- 10. Compute total goals and assists for each team.
SELECT Team,
       SUM(CAST(Goals AS FLOAT)) AS Number_of_Goals,
       SUM(CAST(Assists AS FLOAT)) AS Number_of_Assists
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team
ORDER BY Number_of_Goals;

-- 11. Count players by their marital status
SELECT Marital_status,
       Team,
       COUNT(*) AS Number_of_players
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Marital_status,Team;

-- 12. Count players by nationality.
SELECT Nationality,
       Team,
       COUNT(*) Number_of_players
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Nationality, Team;

-- 13. Find average market value grouped by nationality.
SELECT Nationality,
       AVG(CAST(Market_value_zar AS FLOAT)) AS Average_market_value
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Nationality
ORDER BY Average_market_value DESC;

-- 14. Determine how many player contracts end in each year.
SELECT Contract_end_year,
       COUNT(*) AS Number_of_Players
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Contract_end_year;

-- 15. Identify players whose contracts end next year.
SELECT Contract_end_year,
       COUNT(*) AS Number_of_Players
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Contract_end_year
HAVING Contract_end_year = 2026;

-- 16. Summarize the number of players by injury status
SELECT Injury_status,
       COUNT(*) AS Number_of_players
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Injury_status;

-- 17. Calculate goals per match ratio for each player.
SELECT Team,
       Player_name,
       Matches_played,
       Goals,
       CAST(Goals AS Float)/NULLIF(Matches_played, 0)*100 AS Goals_and_Match_Ratio
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced];
       
-- 18. Count how many players are managed by each agent.
SELECT Agent,
       COUNT(*) AS Number_of_Player
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Agent;

-- 19. Calculate average height and weight by player position
SELECT Position,
       Player_name,
       AVG(CAST(Height_cm AS FLOAT)) AS Player_height,
       AVG(CAST(Weight_kg AS FLOAT)) AS Player_weight
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Position,Player_name;

-- 20. Identify players with the highest combined goals and assists.
SELECT TOP 10
       Player_name,
       Team,
       Goals,
       Assists,
       SUM(CAST(Goals + Assists AS FLOAT)) Goals_and_Assists
FROM [SQLFundementals].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Player_name,Team,Goals,Assists
ORDER BY Goals_and_Assists DESC;
