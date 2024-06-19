-- Active: 1718806554248@@ep-lively-cell-a4y72868-pooler.us-east-1.aws.neon.tech@5432@verceldb@public

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Rooms (
    room_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    num_columns INT,
    num_rows INT
);

CREATE TABLE Workspaces (
    workspace_id SERIAL PRIMARY KEY,
    room_id INT,
    row_numer INT,
    col_number INT,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Sessions (
    session_id SERIAL PRIMARY KEY,
    start_time DATE,
    end_time DATE,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    workspace_id INT,
    session_id INT,
    booking_time DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (workspace_id) REFERENCES Workspaces(workspace_id),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id)
);
