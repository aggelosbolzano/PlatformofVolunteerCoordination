-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Create the ItemCategories table
CREATE TABLE ItemCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Create the Items table
CREATE TABLE Items (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES ItemCategories(CategoryID)
);

-- Create the BaseItems table to track available items in the base
CREATE TABLE BaseItems (
    BaseItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Create the RescuerAccounts table
CREATE TABLE RescuerAccounts (
    RescuerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Create the Announcements table
CREATE TABLE Announcements (
    AnnouncementID INT AUTO_INCREMENT PRIMARY KEY,
    AnnouncementText VARCHAR(1000) NOT NULL,
    ItemID INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Create the MapMarkers table
CREATE TABLE MapMarkers (
    MarkerID INT AUTO_INCREMENT PRIMARY KEY,
    MarkerType VARCHAR(50) NOT NULL, -- e.g., Vehicle, Request, Offer
    MarkerData VARCHAR(1000) NOT NULL -- JSON or serialized data for marker details
);

-- Create the MapFilters table
CREATE TABLE MapFilters (
    FilterID INT AUTO_INCREMENT PRIMARY KEY,
    FilterName VARCHAR(255) NOT NULL
);

-- Create the MapMarkerFilterRelationship table to associate filters with markers
CREATE TABLE MapMarkerFilterRelationship (
    RelationshipID INT AUTO_INCREMENT PRIMARY KEY,
    MarkerID INT,
    FilterID INT,
    FOREIGN KEY (MarkerID) REFERENCES MapMarkers(MarkerID),
    FOREIGN KEY (FilterID) REFERENCES MapFilters(FilterID)
);

-- Create the ServiceStatistics table
CREATE TABLE ServiceStatistics (
    StatisticID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    NewUserRequests INT,
    NewOffers INT,
    ProcessedRequests INT,
    ProcessedOffers INT
);

