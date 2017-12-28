
CREATE procedure [dbo].[GetThingExtensions]
@ThingID bigint,
@SearchFor nvarchar(50)
as
begin

	declare @ThingCategoryID bigint
	select @ThingCategoryID = CategoryID from Things where ID = @ThingID

	select 
		t.ID as 'ThingID',
		t.Title as 'ThingTitle' ,
		t.CategoryID,
		tc.Title as 'ThingCategoryTitle',
		te.ID as 'ThingExtensionID',
		te.GUID as 'ThingExtensionGUID',
		te.Code as 'ThingExtensionCode',
		te.Title as 'ThingExtensionTitle',
		te.DataTypeID,
		dt.Title as 'DataTypeTitle',
		te.IsList as 'IsList',
		v.ID as 'ValueID',
		v.Valu as 'Value'
	from 
		Things t,
		ThingExtensions te,
		ThingExtensionValues v,
		DataTypes dt,
		ThingCategorys tc

	where 
		t.CategoryID = te.ThingCategoryID
		and te.ID = v.ThingExtensionID
		and t.CategoryID = tc.ID
		and t.ID = v.ThingID
		and t.ID = @ThingID
		and te.DataTypeID = dt.ID
		and ( (te.Title like '%' + @SearchFor +'%') or (te.Code like '%' + @SearchFor +'%') or (v.Valu like '%' + @SearchFor +'%') )
		union (
		
		select t.ID,t.Title,t.CategoryID,tc.Title as 'ThingCategoryTitle',te.ID,te.GUID,te.Code,te.Title,te.DataTypeID,dt.Title,te.IsList,0,N''
	from 
		ThingCategorys tc,
		Things t,
		ThingExtensions te,
		DataTypes dt

	where 
		t.CategoryID = te.ThingCategoryID
		and t.CategoryID = tc.ID
		and te.DataTypeID = dt.ID
		and te.ID not in (select ThingExtensionID from ThingExtensionValues where ThingID = @ThingID)
		and t.ID = @ThingID		
		and ( (te.Title like '%' + @SearchFor +'%') or (te.Code like '%' + @SearchFor +'%') )	
		)

end

