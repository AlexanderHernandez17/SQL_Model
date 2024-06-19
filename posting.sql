-- Inserciones


--Un Usuario pueda reservar un espacio de trabajo en una sesión x.
INSERT INTO Bookings (user_id, session_id, workspace_id, booking_time)
VALUES (user_id, session_id, workspace_id, booking_time);

--Un usuario pueda cancelar una reserva.

DELETE FROM Bookings
WHERE booking_id = <booking_id>;