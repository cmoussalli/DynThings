CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
    [FullName]             NVARCHAR (50)  NULL,
    [LanguageID]           INT            NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([UserName] ASC);


GO
create trigger TR_NewUser on aspnetusers
for insert
as 
begin
declare @UserName nvarchar(256)
select @UserName =  UserName from inserted
update AspNetUsers set FullName = @UserName where UserName = @UserName

end
GO
create trigger TR_FirstUser on AspNetUsers  for insert
as
begin
declare @UserID nvarchar(128)
select @UserID =  Id from inserted

if not Exists(select * from aspnetusers u, AspNetUserRoles r where u.Id = r.UserId and r.RoleId = 1 )
insert into AspNetUserRoles (UserID,RoleId) values (@UserID,1)

end