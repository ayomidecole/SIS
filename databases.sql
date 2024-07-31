-- Creating the players table
create table players (
    id serial primary key,
    name varchar(100) not null,
    position varchar(100) not null,
    date_of_birth date not null
);

-- Creating the game stats table
create table game_stats (
    id serial primary key,
    game_date date not null,
    opponent varchar(100) not null,
    score_for integer,
    score_against integer,
    total_passes integer default 0,
    total_shots integer default 0,
    total_tackles integer default 0,
    total_distance_covered_meters numeric(7,2) default 0.0
);

-- Creating player game stats table
create table player_game_stats (
    id serial primary key,
    game_id integer references game_stats(id) not null,
    player_id integer references players(id) not null,
    goals integer default 0,
    assists integer default 0,
    passes integer default 0,
    shots integer default 0,
    tackles integer default 0,
    distance_covered_meters numeric(7,2) default 0.0
);

-- Creating player medicals table
create table medicals (
    id serial primary key,
    player_id integer references players(id) not null,
    check_up_date date not null,
    quarter integer not null check (quarter between 1 and 4),
    year integer not null,
    height_cm numeric(5,2) not null,
    weight_kg numeric(5,2) not null,
    vo2_max numeric(4,1),
    body_fat_percentage numeric(4,1),
    resting_heart_rate integer,
    blood_pressure_systolic integer,
    blood_pressure_diastolic integer,
    flexibility_score integer,
    strength_score integer,
    notes text
);

-- Creating training performance table
create table training_performance (
    id serial primary key,
    player_id integer references players(id) not null,
    session_date date not null,
    session_type varchar(50) not null, -- e.g., 'Fitness', 'Tactical', 'Technical', 'Recovery'
    duration_minutes integer not null,
    intensity_level varchar(20) not null, -- e.g., 'Low', 'Medium', 'High'
    distance_covered_meters numeric(7,2) not null,
    max_speed_kmh numeric(4,1),
    avg_heart_rate integer,
    max_heart_rate integer,
    rpe_score integer check (rpe_score between 1 and 10), -- Rate of Perceived Exertion
    technical_score integer, -- Overall technical performance in session
    tactical_score integer, -- Overall tactical performance in session
    notes text
);