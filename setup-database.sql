CREATE TABLE ta_users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE ta_user_roles (
  user_role_id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  ROLE VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (ROLE,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_ta_username FOREIGN KEY (username)
    REFERENCES ta_users (username));

INSERT INTO ta_users(username,password,enabled)
  VALUES ('teacher1','leet', TRUE);

INSERT INTO ta_user_roles (username, ROLE)
  VALUES ('teacher1', 'ROLE_ADMIN');