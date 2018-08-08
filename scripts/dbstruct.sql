CREATE DATABASE IF NOT EXIST cstournament;

CREATE TABLE IF NOT EXIST user (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    avatar CHAR(10),
    email VARCHAR(255) NOT NULL,
    created_at DATE DEFAULT NOW(),
    steam_id VARCHAR(20) NOT NULL,
    is_admin BOOLEAN DEFAULT 0 NOT NULL,
    is_verified BOOLEAN DEFAULT 0 NOT NULL,
    team_id INT(11),
    CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXIST team (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    tag VARCHAR(20),
    avatar VARCHAR(10),
    country VARCHAR(255) NOT NULL,
    link VARCHAR(255),
    created_at DATE DEFAULT NOW(),
    CONSTRAINT team_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXIST team_users (
    user_id INT(11) NOT NULL REFERENCES user(user_pk),
    team_id INT(11) NOT NULL REFERENCES team(team_pk),
    is_active BOOLEAN DEFAULT 0,
    is_admin BOOLEAN DEFAULT 0,
    is_creator BOOLEAN DEFAULT 0,
    requested_at DATE DEFAULT NOW()
);

CREATE TABLE IF NOT EXIST tournament (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    description TEXT(700) NOT NULL,
    max_slot SMALLINT,
    start_at DATE NOT NULL,
    on_request BOOLEAN DEFAULT 1,
    winner_team INT(11),
    CONSTRAINT tournamenent_pk PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXIST tournament_teams (
    team_id INT(11) NOT NULL REFERENCES team(team_pk),
    accepted BOOLEAN DEFAULT 0,
    accepted_at DATE,
    requested_at DATE DEFAULT NOW()
)

CREATE TABLE IF NOT EXIST tournament_steps (
    id INT(11) NOT NULL AUTO_INCREMENT,
    tournament_id INT(11) NOT NULL REFERENCES tournament(tournamenent_pk),
    ref_id INT(11) NOT NULL,
    type SET("stage", "bracket") NOT NULL,
    is_completed BOOLEAN DEFAULT 0,
    CONSTRAINT steps_pk PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXIST stage (
    id INT(11) NOT NULL AUTO_INCREMENT,
    step_id INT(11) NOT NULL REFERENCES tournament_steps(steps_pk),
    nb_winner SMALLINT NOT NULL DEFAULT 2,
    CONSTRAINT stage_pk PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXIST stage_teams (
    stage_id INT(11) NOT NULL
    team_id INT(11) NOT NULL REFERENCES team(team_pk),
    score SMALLINT DEFAULT 0
)

CREATE TABLE IF NOT EXIST match (
    id INT(11) NOT NULL AUTO_INCREMENT,
    team_a INT(11) NOT NULL REFERENCES team(team_pk),
    team_b INT(11) NOT NULL REFERENCES team(team_pk),
    start_at DATE NOT NULL,
    score_a SMALLINT,
    score_b SMALLINT,
    nb_maps SMALLINT DEFAULT 1,
    map_one SET("dust2", "nuke", "inferno", "train", "tuscan", "mirage", "lite") NOT NULL,
    map_two SET("dust2", "nuke", "inferno", "train", "tuscan", "mirage", "lite"),
    map_three SET("dust2", "nuke", "inferno", "train", "tuscan", "mirage", "lite"),
    CONSTRAINT match_pk PRIMARY KEY (id)
)
