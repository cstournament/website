CREATE DATABASE IF NOT EXIST cstournament;

CREATE TABLE IF NOT EXIST user (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at DATE DEFAULT NOW(),
    steam_id VARCHAR(20) NOT NULL,
    is_admin BOOLEAN DEFAULT 0 NOT NULL,
    team_id INT(11),
    is_pollable BOOLEAN DEFAULT 1,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXIST team (
    id INT(11) NOT NULL AUTO_INCREMENT,
    clan_name VARCHAR(30) NOT NULL,
    tag VARCHAR(20),
    avatar VARCHAR(10),
    country VARCHAR(255) NOT NULL,
    link VARCHAR(255),
    created_at DATE DEFAULT NOW(),
    CONSTRAINT team_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXIST team_member (
    user_id INTEGER NOT NULL REFERENCES user(user_pk),
    team_id INTEGER NOT NULL REFERENCES team(team_pk),
    is_active BOOLEAN DEFAULT 0,
    is_admin BOOLEAN DEFAULT 0,
    is_creator BOOLEAN DEFAULT 0,
    requested_at DATE DEFAULT NOW()
);
