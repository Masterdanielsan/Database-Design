USE [s15guest31]
GO
/****** Object:  StoredProcedure [dbo].[getPresentersByTrack]    Script Date: 4/28/2015 2:52:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getPresentersByTrack]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	BEGIN TRY
    SELECT distinct Class.Title, Class.fk_Topic, Person.Fname, Person.Lname
 FROM Class, Person
 WHERE Class.fk_PersonID=Person.PersonID

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
