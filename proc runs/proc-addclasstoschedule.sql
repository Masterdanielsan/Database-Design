USE [s15guest31]
GO
/****** Object:  StoredProcedure [dbo].[AddClassToSchedule]    Script Date: 4/28/2015 2:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AddClassToSchedule]
 -- Add the parameters for the stored procedure here
 @DateAndTime varchar(50),
 @Title varchar(250),
 @Decription varchar(250),
 @Duration varchar(250),
 @PresenterGrade varchar(25),
 @fk_PersonID int,
 @fk_DifficultyID varchar(25),
 @fk_Topic varchar(200),
 @fk_RoomID int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 BEGIN TRY
    INSERT INTO [dbo].[Class]
           ([date_time]
           ,[title]
           ,[descr]
           ,[duration]
           ,[presenter_grade]
           ,[fk_PersonID]
           ,[fk_DifficultyID]
           ,[fk_Topic]
           ,[fk_RoomID])
     VALUES
           (@DateAndTime,
  @Title,
  @Decription,
  @Duration,
  @PresenterGrade,
  (SELECT PersonID FROM Person WHERE PersonID=@fk_PersonID),
  (SELECT DifficultyID FROM Difficulty WHERE DifficultyID=@fk_DifficultyID),
  (SELECT topic FROM Track WHERE Topic=@fk_Topic),
  (SELECT RoomID FROM Rooms WHERE RoomID=@fk_RoomID))

  END TRY
  BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
	RAISERROR (@ErrorMessage, ---Alert!!!!
			@ErrorSeverity, ---Very Severe!!!
			@ErrorState ---Porcupine
			);
  END CATCH

END
