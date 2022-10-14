CREATE OR REPLACE TRIGGER order_insert
  AFTER INSERT ON Orden
  FOR EACH ROW
BEGIN
  CASE
    WHEN INSERTING THEN
      UPDATE Client
        SET discount = 0.00
        WHERE client_id=:NEW.client_id;
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER return_insert
  AFTER INSERT ON Return
  FOR EACH ROW
BEGIN
  CASE
    WHEN INSERTING THEN
      UPDATE Client
        SET discount = discount + :NEW.total
        WHERE client_id=:NEW.client_id AND (sysdate - register_date) > 4*365;
  END CASE;
END;
/