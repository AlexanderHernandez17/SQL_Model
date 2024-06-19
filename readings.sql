-- Consultas

//Ver la lista de espacios de trabajo disponibles de una sala en una sesión x.

-- Supongamos que tenemos el room_id y el session_id

SELECT w.workspace_id, w.row_number, w.col_number
FROM Workspaces w
LEFT JOIN Bookings b ON w.workspace_id = b.workspace_id AND b.session_id = 12
WHERE w.room_id = 12
  AND b.booking_id IS NULL; -- Espacios de trabajo que no están reservados en la sesión x


//Ver la lista de espacios de trabajo ocupados de una sala en una sesión x.

-- Supongamos que tenemos el room_id y el session_id

SELECT w.workspace_id, w.row_number, w.col_number
FROM Workspaces w
JOIN Bookings b ON w.workspace_id = b.workspace_id AND b.session_id = 1
WHERE w.room_id = 12;


//Ver las sesiones con orden por las más ocupadas

SELECT s.session_id, COUNT(b.booking_id) AS num_bookings
FROM Sessions s
LEFT JOIN Bookings b ON s.session_id = b.session_id
GROUP BY s.session_id
ORDER BY num_bookings DESC;


//Ver las sesiones con orden por las más disponibles

SELECT s.session_id, COUNT(b.booking_id) AS num_bookings
FROM Sessions s
LEFT JOIN Bookings b ON s.session_id = b.session_id
GROUP BY s.session_id
ORDER BY num_bookings ASC;


//Ver la lista de espacios de trabajo asignados a un usuario

-- Supongamos que tenemos el user_id del usuario

SELECT w.workspace_id, w.row_number, w.col_number
FROM Workspaces w
JOIN Bookings b ON w.workspace_id = b.workspace_id
WHERE b.user_id = 40;


//Ver la lista de espacios de trabajo asignados a una sesión.

-- Supongamos que tenemos el session_id

SELECT w.workspace_id, w.row_number, w.col_number
FROM Workspaces w
JOIN Bookings b ON w.workspace_id = b.workspace_id
WHERE b.session_id = 20;
