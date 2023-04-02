
CREATE TABLE user
(
    userID   INT AUTO_INCREMENT NOT NULL,
    userName VARCHAR(45)        NULL,
    email    VARCHAR(45)        NULL,
    password VARCHAR(15)        NOT NULL,
    type     INT                NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (userID)
);

ALTER TABLE user
    ADD CONSTRAINT uc_user_email UNIQUE (email);