USE [s15guest31]
GO
/****** Object:  StoredProcedure [dbo].[EnterTrack]    Script Date: 4/28/2015 12:39:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  <Smith,,Daniel>
-- Create date: <04/28/15,,>
-- Description: <Create topic>
-- =============================================
CREATE PROCEDURE [dbo].[EnterTrack]
 -- Add the parameters for the stored procedure here
 @topic varchar(200)
 
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 if Object_id('dbo.Track' , 'U') is Null
  Begin
  Create table Track (

   track_id int identity(1,1) not null primary key,
   topic varchar(200) unique,
   
  )

  End 

    -- Insert statements for procedure here
 if not Exists(select * from Track where topic = @topic)
  insert into Track (topic) values (@topic);
END
