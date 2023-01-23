
--Create Table Queries--

 --Team Query--
 DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name character varying (30),
    arena_location character varying (20),
    arena_capacity numeric (5),
    date_established numeric(4) 
);

--Nation Query--
DROP TABLE IF EXISTS nation;
CREATE TABLE nation (
    nation_id SERIAL PRIMARY KEY,
    nationality CHAR(30)
);

--Position Query--
DROP TABLE IF EXISTS position;
CREATE TABLE position (
    pos_id SERIAL PRIMARY KEY,
    position CHAR(10)
);

-- Player Query--
DROP TABLE IF EXISTS players;
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name CHAR(15) NOT NULL, 
    last_name CHAR(20) NOT NULL, 
    age INTEGER NOT NULL,
    shoots CHAR(1) NOT NULL,
    pos_id INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    team_id INTEGER, 
    nation_id INTEGER,
    CONSTRAINT fk_teams
    FOREIGN KEY(team_id)
        REFERENCES teams(team_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_nation
        FOREIGN KEY(nation_id)
            REFERENCES nation(nation_id)
                ON DELETE CASCADE,
    CONSTRAINT fk_position
        FOREIGN KEY(pos_id)
            REFERENCES position(pos_id)
                ON DELETE CASCADE
);



--Views--

--Highest 20 salaries--

DROP VIEW IF EXISTS highest_salary;
CREATE VIEW highest_salary AS
 SELECT players.player_id AS id,
    players.first_name|| ' ' ||players.last_name AS "Name", 
    teams.team_name AS "Team",
    players.salary AS "Salary"
FROM players 
    INNER JOIN teams ON players.team_id=teams.team_id
    ORDER BY salary DESC
    LIMIT 20;

SELECT * FROM highest_salary;

-- Lowest 20 Salaries --

DROP VIEW IF EXISTS lowest_salary;
CREATE VIEW lowest_salary AS
 SELECT players.player_id AS id,
    players.first_name|| ' ' ||players.last_name AS "Name", 
    teams.team_name AS "Team",
    players.salary AS "Salary"
FROM players 
    INNER JOIN teams ON players.team_id=teams.team_id
    ORDER BY salary ASC
    LIMIT 20;

SELECT * FROM lowest_salary;

--Oldest 20 players--

DROP VIEW IF EXISTS oldest_players;
CREATE VIEW oldest_players AS
 SELECT players.first_name|| ' ' ||players.last_name AS "Name",
        players.age AS "Age",
        teams.team_name AS "Team"
    FROM players
    INNER JOIN teams ON players.team_id=teams.team_id
    ORDER BY age DESC
    LIMIT 20;

SELECT * FROM oldest_players;

--Youngest 20 Players

DROP VIEW IF EXISTS youngest_players;
CREATE VIEW youngest_players AS
 SELECT players.first_name|| ' ' ||players.last_name AS "Name",
        players.age AS "Age",
        teams.team_name AS "Team"
    FROM players
    INNER JOIN teams ON players.team_id=teams.team_id
    ORDER BY age ASC
    LIMIT 20;

SELECT * FROM youngest_players;

-- Nation Representation--

DROP VIEW IF EXISTS nation_rep;
CREATE VIEW nation_rep AS
 SELECT nation.nationality AS "Nation",
       COUNT(players.nation_id)      
    FROM nation 
    INNER JOIN players ON nation.nation_id=players.nation_id 
    GROUP BY nationality 
    ORDER BY COUNT DESC;  

SELECT * FROM nation_rep;


-- Functions --
DROP FUNCTION IF EXISTS fetch_player;
CREATE FUNCTION fetch_player (search_player varchar(30))
RETURNS CHAR(2)
AS $$ 
BEGIN 
RETURN (SELECT player_id
FROM players
WHERE last_name = search_player);
END;
$$ LANGUAGE plpgsql;


-- Procedures--

-- Insert Player Procedure --

CREATE PROCEDURE insert_player (
    player_id INT,
    first_name CHAR(15),
    last_name CHAR(20),
    age INTEGER,
    shoots CHAR(1),
    pos_id INTEGER,
    salary INTEGER,
    team_id INTEGER,
    nation_id INTEGER
)
LANGUAGE SQL AS $$
INSERT INTO players VALUES (player_id, first_name, last_name, age, shoots, pos_id, salary, team_id, nation_id);
$$;

--Call Function--
CALL insert_player ();










    




