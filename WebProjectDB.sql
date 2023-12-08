CREATE TABLE administrator (
    administratorID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    LastLogin TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE ItemCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE BaseItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    Description TEXT,
    Category VARCHAR(50),
    Quantity INT NOT NULL
);

CREATE TABLE Rescuers (
    RescuerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    LastLogin TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Announcements (
    AnnouncementID INT AUTO_INCREMENT PRIMARY KEY,
    AnnouncementText VARCHAR(1000) NOT NULL,
    ItemID INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

CREATE TABLE RescuerCargo (
    RescuerID INT,
    CargoID INT,
    ItemID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (RescuerID) REFERENCES Rescuers(RescuerID),
    FOREIGN KEY (ItemID) REFERENCES BaseItems(ItemID)
);

CREATE TABLE MapMarkers (
    MarkerID INT AUTO_INCREMENT PRIMARY KEY,
    MarkerType VARCHAR(50) NOT NULL,
    Latitude DECIMAL(10, 8) NOT NULL,
    Longitude DECIMAL(11, 8) NOT NULL,
    AdditionalInfo TEXT
);

CREATE TABLE MapFilters (
    FilterID INT AUTO_INCREMENT PRIMARY KEY,
    FilterName VARCHAR(255) NOT NULL
);

CREATE TABLE MapMarkerFilterRelationship (
    RelationshipID INT AUTO_INCREMENT PRIMARY KEY,
    MarkerID INT,
    FilterID INT,
    FOREIGN KEY (MarkerID) REFERENCES MapMarkers(MarkerID),
    FOREIGN KEY (FilterID) REFERENCES MapFilters(FilterID)
);

CREATE TABLE ServiceStatistics (
    StatisticID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    NewUserRequests INT,
    NewOffers INT,
    ProcessedRequests INT,
    ProcessedOffers INT
);

CREATE TABLE RescuerTasks (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    RescuerID INT,
    RequestID INT,
    OfferID INT,
    Status VARCHAR(50), 
    FOREIGN KEY (RescuerID) REFERENCES Rescuers(RescuerID),
    FOREIGN KEY (RequestID) REFERENCES Requests(RequestID),
    FOREIGN KEY (OfferID) REFERENCES Offers(OfferID)
);

CREATE TABLE RescuerMapMarkers (
    RescuerID INT,
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    PRIMARY KEY (RescuerID),
    FOREIGN KEY (RescuerID) REFERENCES Rescuers(RescuerID)
);

CREATE TABLE Requests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    CitizenID INT, 
    ItemID INT,
    Quantity INT,
    Status VARCHAR(50), 
    FOREIGN KEY (CitizenID) REFERENCES Citizens(CitizenID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

CREATE TABLE Offers (
    OfferID INT AUTO_INCREMENT PRIMARY KEY,
    CitizenID INT, 
    ItemID INT,
    Quantity INT,
    Status VARCHAR(50), 
    FOREIGN KEY (CitizenID) REFERENCES Citizens(CitizenID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);


CREATE TABLE Citizens (
    CitizenID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8)
);

CREATE TABLE CitizenRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    CitizenID INT,
    ItemID INT,
    Quantity INT, 
    PeopleCount INT,
    Status VARCHAR(50), 
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    AcceptanceDate TIMESTAMP,
    CompletionDate TIMESTAMP,
    FOREIGN KEY (CitizenID) REFERENCES Citizens(CitizenID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

CREATE TABLE CitizenOffers (
    OfferID INT AUTO_INCREMENT PRIMARY KEY,
    CitizenID INT,
    AnnouncementID INT,
    Status VARCHAR(50), 
    OfferDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    AcceptanceDate TIMESTAMP,
    CompletionDate TIMESTAMP,
    FOREIGN KEY (CitizenID) REFERENCES Citizens(CitizenID),
    FOREIGN KEY (AnnouncementID) REFERENCES Announcements(AnnouncementID)
);
