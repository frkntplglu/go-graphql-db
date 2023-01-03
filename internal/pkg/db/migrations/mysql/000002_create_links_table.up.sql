CREATE TABLE IF NOT EXISTS links(
    ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    Title VARCHAR (255) ,
    Address VARCHAR (255) ,
    UserID INT ,
    FOREIGN KEY (UserID) REFERENCES Users(ID) ,
    PRIMARY KEY (ID)
)

INSERT INTO links (Title, Address, UserID) VALUES ('Google', 'https://www.google.com', 1);
INSERT INTO links (Title, Address, UserID) VALUES ('Facebook', 'https://www.facebook.com', 1);
INSERT INTO links (Title, Address, UserID) VALUES ('Twitter', 'https://www.twitter.com', 1);