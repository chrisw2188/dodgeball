DROP TABLE matches;
DROP TABLE teams;


CREATE TABLE teams (
  id SERIAL4 primary key, 
  name VARCHAR(255), 
  location VARCHAR(255)
  );

CREATE TABLE matches (
  id serial4 primary key,
  away_team_score VARCHAR(255),
  home_team_score VARCHAR(255),
  away_team_id INT4 REFERENCES teams(id),
  home_team_id INT4 REFERENCES teams(id),
  winner_id INT4 REFERENCES teams(id)
)