-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE UpdateClass
 -- Add the parameters for the stored procedure here
 @topic varchar(200),
 @classId int

AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;


 if Object_id('dbo.Class' , 'U') is Null
  Begin
  Create table Class (

    class_id int IDENTITY PRIMARY KEY NOT NULL ,
    date_time varchar(50) NOT NULL,
    title varchar(250) NOT NULL,
    descr varchar(250) NOT NULL,
    duration varchar(250) NOT NULL,
    presenter_grade varchar(25) NOT NULL,
    fk_PersonID int NOT NULL,
    fk_DifficultyID varchar(25) NOT NULL,
    fk_Topic varchar(200),
    fk_RoomID int NOT NULL,  
    CONSTRAINT fk_Class_Topic FOREIGN KEY (fk_Topic) REFERENCES Track (Topic),   
  )

  End 

    -- Update statements for procedure here
 update Class set fk_Topic = (Select topic from Track where topic = @topic) where class_id = @classId
END
GO