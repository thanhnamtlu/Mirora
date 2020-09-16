create database DB_Watch
go
use DB_Watch
go
create table Categories(
	CatalogID int identity(1,1) primary key,
	CatName nvarchar(100),
	CatPriority int,
	CatDescription ntext,
	ParentID int,
	CatStatus bit
)

go
create table Colors(
	ColorID int identity(1,1) primary key,
	ColorName nvarchar(50),
	ColorStatus bit
)
go
create table Product(
	ProductID varchar(5) primary key,
	ProductName nvarchar(100) unique,
	Title nvarchar(100),
	ProductDescription ntext,
	CreatedDate date default getdate(),
	Discount float,
	ProductView int,
	Price float,
	ProductStatus bit,
)
go
create table CatProduct(
	CatProId int identity(1,1) primary key,
	CatId int foreign key references Categories(CatalogID),
	ProductID varchar(5) foreign key references Product(ProductID),
)
go
create table ProductDetail(
	ProductDetailID int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	ColorID int foreign key references Colors(ColorID),
	Imagelink varchar(100),
	Quantity int,
	ProductDtStatus bit
)
create table Users(
	UserId varchar(10) primary key,
	UserName nvarchar(50),
	UserPassword varchar(16),
	Gender bit,
	Mail varchar(100),
	Phone char(10),
	UserAddress varchar(200),
	UserStatus bit,
	Permission bit default 0, 
)
go
create table Orders(
	OrderId int identity primary key,
	UserID varchar(10) foreign key references Users(UserID),
	CreatedDate date default getdate(),
	TotalAmount float,
	OrderStatus tinyint
)
create table OrderDetail(
	OrderId int foreign key references Orders(OrderId),
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	Quantity int,
	Amount float,
	OrderStatus bit,
	Primary key(OrderId,ProductDetailID)
)
create table Comment(
	CommentId int primary key,
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	UserID varchar(10) foreign key references Users(UserID),
	CreatedateComment date default getdate(),
	CommentContent ntext,
	ParentId int ,
	CommentStatus bit
)
create table Stars(
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	UserID varchar(10) foreign key references Users(UserID),
	Mark int
)
Create table Favorite(
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	UserID varchar(10) foreign key references Users(UserID),
)
Create table Banner(
	BannerID int primary key,
	BannerName varchar(10),
	Imagelink varchar(100),
	BannerLink varchar(100),
	BannerPriority int,
	BannerStatus bit
)
create table Images(
	ImageId int primary key,
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	ImageLink varchar(100),
	ImageStatus bit	 
)
create table NewType(
	NewsTypeID varchar(10) primary key,
	TypeName nvarchar(100),
	NewsTypeStatus bit
)
create table News(
	NewsID int primary key,
	CreateDate datetime,
	NewsTypeID varchar(10) foreign key references NewType(NewsTypeID),
	Tittle ntext,
	NewsDescription ntext,
	NewsStatus bit
)
create table SystemWatch(
	SystemID int primary key identity(1,1),
	SystemName varchar(100),
	Systemvalue ntext,
)