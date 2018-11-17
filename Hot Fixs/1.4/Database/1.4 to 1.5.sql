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

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dbo].[Apps]') 
         AND name = 'IsStoreApp'
)
BEGIN
	ALTER TABLE Apps
    ADD [IsStoreApp] BIT NOT NULL
END 

GO

Update DynSettings set DBVersion = 1.5

GO

ALTER Procedure [dbo].[PublishApp]
@AppID bigint
--,@userID nvarchar(128)
as
begin

--Insert new MediaFiles
insert into MediaFiles (guid,Title,IsSystem)
	select guid,title,0 from appmediafiles appMF where AppID = @AppID and [guid] not in (select [guid] from MediaFiles where [GUID] is not null )
--Update existing MediaFiles
update MediaFiles set 
	Title = appMF.[Title]
	from MediaFiles as mf
		inner join appMediaFiles as appMF on mf.[guid] = appMF.[guid]
		where appMF.appid = @AppID

--Insert new EndPointTypes
insert into EndPointTypes (Code,Title,measurement,TypeCategoryID,IconID)
	(select appEndTyp.Code,appEndTyp.Title,appEndTyp.Measurement,appEndTyp.TypeCategoryID,mf.ID 
		from AppEndpointTypes appEndTyp, MediaFiles mf 
		where appEndTyp.IconGUID = mf.GUID and appEndTyp.AppID = @AppID and Code not in (select code from EndPointTypes where code is not null  ) )
--Update Existing EndPointTypes
update EndPointTypes set 
	Title = appEt.[Title],measurement = appEt.measurement,TypeCategoryID = appEt.TypeCategoryID,IconID =mf.ID 
	from EndPointTypes as et
		inner join AppEndpointTypes as appEt on et.Code = appEt.Code
		inner join MediaFiles as mf on mf.GUID = appEt.IconGUID
		where appEt.appid = @AppID

--Insert new ThingCategories
insert into ThingCategorys (Title,IconID,Code)
	(select appCat.Title,mf.ID , appCat.Code  
		from AppThingCategorys appCat, MediaFiles mf
		where appCat.IconGUID = mf.GUID and appCat.AppID = @AppID and appCat.Code not in (select code from ThingCategorys where code is not null )
	)
--Update existing ThingCategories
update ThingCategorys set
	Title = appThnCat.Title, IconID = mf.ID
	from ThingCategorys as thnCat
		inner join AppThingCategorys as appThnCat on appThnCat.Code = thnCat.Code
		inner join MediaFiles as mf on mf.GUID = appThnCat.IconGUID 
		where appThnCat.AppID = @AppID

--Insert new ThingExtensions
insert into ThingExtensions (GUID,ThingCategoryID,Title,DataTypeID,IsList)
	(select appThnExt.GUID,  thnCat.ID    , appThnExt.Title,appThnExt.DataTypeID,appThnExt.IsList
		from AppThingExtensions appThnExt, ThingCategorys thnCat
		where appThnExt.Code not in (select code from ThingExtensions where code is not null )
		 and appThnExt.AppID = @AppID
		 and appThnExt.AppThingCategoryCode = thnCat.Code
	)
--Update existing ThingExtensions	
update ThingExtensions set
	ThingCategoryID = thnCat.ID , Title = appThnExt.Title , DataTypeID = appThnExt.DataTypeID, IsList = appThnExt.IsList 
	from ThingCategorys thnExt
		inner join AppThingExtensions as appThnExt on appThnExt.Code = thnExt.Code
		inner join ThingCategorys as thnCat on thnCat.Code = appThnExt.AppThingCategoryCode
		where appThnExt.AppID = @AppID

update Apps set StatusID = 3 where id = @AppID


end

GO
