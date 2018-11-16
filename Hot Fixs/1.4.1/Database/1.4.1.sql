create procedure [dbo].[AppDelete]
@AppID bigint
as
begin

delete from AppUserTokens where AppID = @AppID
delete from APIUtilisations where AppID = @AppID
delete from AppAPIEntitys where AppID = @AppID
delete from AppThingExtensions where AppID = @AppID
delete from AppThingCategorys where AppID = @AppID
delete from AppEndpointTypes where AppID = @AppID
delete from AppMediaFiles where AppID = @AppID
delete from apps where id = @AppID

end

GO

CREATE TABLE [dbo].[DBChanges](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CentralChangeID] [bigint] NOT NULL,
	[ChangeCode] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_DBChanges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

