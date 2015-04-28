USE [s15guest31]
GO

	CREATE TABLE [dbo].[Joke2](
	[jokeId] [int] IDENTITY,
	[jokeName] [nvarchar](32) NOT NULL,
	[jokeItself] [nvarchar](max) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
