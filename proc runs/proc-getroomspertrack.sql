USE [s15guest31]
GO
/****** Object:  StoredProcedure [dbo].[getRoomsPerTrack]    Script Date: 4/28/2015 2:52:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getRoomsPerTrack]
	-- Add the parameters for the stored procedure here
	@topic varchar(200)

AS
BEGIN

BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct fk_topic,fk_RoomID
	FROM Class where fk_topic = @topic

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
