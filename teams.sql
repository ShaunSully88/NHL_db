DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS nation;
DROP TABLE IF EXISTS position;

CREATE TABLE teams (
    team_id SERIAL NOT NULL PRIMARY KEY,
    team_name character varying (30),
    arena_location character varying (20),
    arena_capacity numeric (5),
    date_established numeric(4) 
);

CREATE TABLE nation (
    nation_id SERIAL PRIMARY KEY NOT NULL,
    nationality CHAR(30)
);

CREATE TABLE position (
    id SERIAL PRIMARY KEY NOT NULL,
    position CHAR(10)
);



CREATE TABLE players (
    player_id SERIAL PRIMARY KEY NOT NULL,
    first_name CHAR(15) NOT NULL, 
    last_name CHAR(20) NOT NULL, 
    shoots CHAR(1) NOT NULL,
    pos_id INT NOT NULL,
    team_id INT,
    salary INT NOT NULL, 
    years_left INT,
    nation_id INT,
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

INSERT INTO position (position) 
VALUES ('Center'),
       ('Left Wing'),
       ('Right Wing'),
       ('Defense'),
       ('Goalie');

INSERT INTO nation (nationality)
VALUES ('Canada'),
        ('United States'),
        ('Sweden'),
        ('Finland'),
        ('Latvia'),
        ('Russia'),
        ('Czech Republic'),
        ('Switzerland'),
        ('Slovakia');


INSERT INTO players (first_name, last_name, shoots, pos_id, team_id, salary, years_left, nation_id) 
VALUES ('Teddy', 'Blueger', 'L', 1, 23, 2400000, 1, 4),
       ('Jeff', 'Carter', 'R', 1, 23, 3250000, 2, 1),
       ('Sidney', 'Crosby', 'L', 1, 23, 3000000, 3, 1),
       ('Casey', 'DeSmith', 'L', 5, 23, 1700000, 2, 2),
       ('Brian', 'Dumolin', 'L', 4, 23, 4100000, 1, 2),
       ('Taylor', 'Fedun', 'R', 4, 23, 750000, 2, 1),
       ('Mark', 'Friedman', 'R', 4, 23, 750000, 2, 1),
       ('Jake', 'Guentzel', 'L', 2, 23, 5000000, 2, 2),
       ('Danton', 'Heinen', 'L', 2, 23, 1000000, 1, 1),
       ('Pierre-Olivier', 'Joseph', 'L', 4, 23, 800000, 2, 1),
       ('Kasperi', 'Kapanen', 'R', 3, 23, 3200000, 2, 4),
       ('Evgeni', 'Malkin', 'L', 1, 23, 4000000, 4, 6),
       ('Brock', 'McGinn', 'L', 2, 23, 2750000, 3, 1),
       ('Drew', 'O''Connor', 'L', 1, 23, 750000, 1, 2),
       ('Jeff', 'Petry', 'R', 4, 23, 4500000, 3, 2),
       ('Marcus', 'Pettersson', 'L', 4, 23, 4025175, 3, 3),
       ('Rickard', 'Rakell', 'R', 3, 23, 6000000, 6, 3),
       ('Chad', 'Ruhwedel', 'R', 4, 23, 800000, 2, 2),
       ('Bryan', 'Rust', 'R', 3, 23, 6100000, 6, 2),
       ('Jan', 'Rutta', 'R', 4, 23, 3250000, 3, 7),
       ('Ty', 'Smith', 'L', 4, 23, 832500, 1, 1),
       ('Dustin', 'Tokarski', 'L', 5, 23, 775000, 1, 1),
       ('Jason', 'Zucker', 'L', 2, 23, 5200000, 1, 2),
       ('Kris', 'Letang', 'R', 4, 23, 4000000, 6, 1),
       ('Tristan', 'Jarry', 'L', 5, 23, 4500000, 1, 1);

       SELECT first_name, last_name, salary FROM players
       ORDER BY salary DESC;

INSERT INTO teams 
VALUES 
(1, 'Anaheim Mighty Ducks', 'Anaheim', 20000, 1993),
(2, 'Arizona Coyotes', 'Tempe', 5000, 1971),
(3, 'Boston Bruins', 'Boston', 19580, 1924),
(4, 'Buffalo Sabres', 'Buffalo', 19200, 1970),
(5, 'Calgary Flames', 'Calgary', 19289, 1971),
(6, 'Carolina Hurricanes', 'Raleigh', 19772, 1971),
(7, 'Chicago Blackhawks', 'Chicago', 23500, 1926),
(8, 'Colorado Avalanche', 'Denver', 20000, 1971),
(9, 'Columbus Blue Jackets', 'Columbus', 20000, 1997),
(10, 'Dallas Stars', 'Dallas', 20000, 1965),
(11, 'Detroit Red Wings', 'Detroit', 19515, 1926),
(12, 'Edmonton Oilers', 'Edmonton', 18500, 1971),
(13, 'Florida Panthers', 'Sunrise', 20737, 1992),
(14, 'Los Angeles Kings', 'Los Angeles', 20000, 1967),
(15, 'Minnesota Wild', 'Saint Paul', 20554, 1997),
(16, 'Montreal Canadiens', 'Montreal', 21302, 1909),
(17, 'Nashville Predators', 'Nashville', 19891, 1997),
(18, 'New Jersey Devils', 'Newark', 19500, 1972),
(19, 'New York Islanders', 'Elmont', 17255, 1971),
(20, 'New York Rangers', 'New York City', 20789, 1926),
(21, 'Ottawa Senators', 'Ottawa', 18652, 1990),
(22, 'Philadelphia Flyers', 'Philadelphia', 19500, 1966),
(23, 'Pittsburgh Penguins', 'Pittsburgh', 19758, 1966),
(24, 'St. Louis Blues', 'St. Louis', 19260, 1966),
(25, 'San Jose Sharks', 'San Jose', 17562, 1993),
(26, 'Tampa Bay Lightning', 'Tampa', 21500, 1992),
(27, 'Toronto Maple Leafs', 'Toronto', 19800, 1917),
(28, 'Vancouver Canucks', 'Vancouver', 18910, 1970),
(29, 'Las Vegas Golden Knights', 'Paradise', 17500, 2017),
(30, 'Washington Capitals', 'Washington D.C.', 20356, 1974),
(31, 'Winnipeg Jets', 'Winnipeg', 16345, 1997);


