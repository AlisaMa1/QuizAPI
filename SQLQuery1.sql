-- Step 1: Create the database
CREATE DATABASE QuizDB;
GO

-- Step 2: Use the new database
USE QuizDB;
GO

-- Step 3: Create the Participant table
CREATE TABLE Participant (
    ParticipantId INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(50) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Score INT NOT NULL,
    TimeTaken INT NOT NULL
);
GO

-- Step 4: Create the Question table
CREATE TABLE Question (
    QnId INT IDENTITY(1,1) PRIMARY KEY,
    QnInWords NVARCHAR(250) NOT NULL,
    ImageName NVARCHAR(50) NULL,
    Option1 NVARCHAR(50) NOT NULL,
    Option2 NVARCHAR(50) NOT NULL,
    Option3 NVARCHAR(50) NOT NULL,
    Option4 NVARCHAR(50) NOT NULL,
    Answer INT NOT NULL
);
GO

-- Step 5: Create the ParticipantResult table
CREATE TABLE ParticipantResult (
    ParticipantId INT NOT NULL,
    Score INT NOT NULL,
    TimeTaken INT NOT NULL,
    PRIMARY KEY (ParticipantId),
    CONSTRAINT FK_ParticipantResult_Participant FOREIGN KEY (ParticipantId) REFERENCES Participant(ParticipantId) ON DELETE CASCADE
);
GO

-- Step 6: Insert sample data (optional)
INSERT INTO Participant (Email, Name, Score, TimeTaken) VALUES
('john.doe@example.com', 'John Doe', 85, 120),
('jane.smith@example.com', 'Jane Smith', 90, 110);

INSERT INTO Question (QnInWords, ImageName, Option1, Option2, Option3, Option4, Answer) VALUES
('What is the capital of France?', NULL, 'Berlin', 'Madrid', 'Paris', 'Lisbon', 3),
('What is the largest planet in our Solar System?', NULL, 'Earth', 'Mars', 'Jupiter', 'Saturn', 3);

INSERT INTO ParticipantResult (ParticipantId, Score, TimeTaken) VALUES
(1, 85, 120),
(2, 90, 110);
GO

Select * from Participant

Select  * from Question 

Select * from ParticipantResult

SELECT @@SERVERNAME

USE QuizDB;
GO
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Participants';

EXEC sp_rename 'Question', 'Questions';
GO
