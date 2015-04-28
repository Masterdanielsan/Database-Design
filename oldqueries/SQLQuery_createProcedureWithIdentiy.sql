USE [s15guest31]
GO

CREATE PROCEDURE [dbo].[add_new_joke4]
(@jokeId int, @jokeName nvarchar(32), @jokeItself nvarchar(max))
AS 

BEGIN TRY
IF NOT EXISTS (SELECT * FROM dbo.Joke)
	CREATE TABLE [dbo].[Joke2](
	[jokeId] [int] IDENTITY,
	[jokeName] [nvarchar](32) NOT NULL,
	[jokeItself] [nvarchar](max) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

INSERT INTO [dbo].[Joke2]
           ([jokeName]
           ,[jokeItself])
     VALUES
           (@jokeName,@jokeItself)

END TRY

BEGIN CATCH

	DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

	SELECT @ErrorMessage = ERROR_MESSAGE(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE();

	---use RAISERROR inside the CATCH block to return error
	--- information about the original error that caused
	--- execution to jump...

	RAISERROR (@ErrorMessage, ---Alert!!!!
			@ErrorSeverity, ---Very Severe!!!
			@ErrorState ---Porcupine
			);
END CATCH

SELECT * FROM Joke2