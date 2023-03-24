USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'website')
BEGIN
	ALTER DATABASE [website] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [website] SET ONLINE;
	DROP DATABASE [website];
END

GO

CREATE DATABASE [website]
GO

USE [website]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 


CREATE TABLE Accounts(
	[accountID] INT IDENTITY(1,1) NOT NULL,
	[userName] NVARCHAR(255) NOT NULL UNIQUE,
	[password] NVARCHAR(255) NOT NULL,
	[Amount] MONEY DEFAULT(0),
	[email] NVARCHAR(50) NULL,
	[registeredAt] DATE NULL DEFAULT(GETDATE()),
	[lastLogin] DATE NULL DEFAULT(NULL),
	PRIMARY KEY (accountID),
)
GO

CREATE TABLE Countries (
	[countryID] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	[countryName] NVARCHAR(255) NOT NULL UNIQUE,
	[location] NVARCHAR(255) NULL,
	[countryCreateAt] DATE NULL,
	[countryUpdateAt] DATE NULL,
)
GO

CREATE TABLE Informations (
	[accountID] INT NOT NULL PRIMARY KEY,
	[countryID] INT,
	[firstName] nvarchar(50) null,
	[lastName] nvarchar(50) null,
	[avatar] nvarchar(255) null,
	[address] nvarchar(255) null,
	[birthday] DATE NULL DEFAULT(NULL),
	[phone] NVARCHAR(15) NULL,
	[gender] INT NULL DEFAULT(-1),
	[status] NVARCHAR(255) NULL,
	CONSTRAINT fk_information_country FOREIGN KEY (countryID) REFERENCES Countries(countryID)
)
GO

CREATE TABLE Actions(
	adminID int identity(1, 1) primary key,
	adminRole nvarchar(255) null UNIQUE,
	[insertProduct] bit,
	[updateProduct] bit,
	[deleteProduct] bit,
	[viewProduct] bit,
	[updateAccount] bit,
	[deleteAccount] bit,	
	[viewAccount] bit,
	[addAction] bit,
	[dateStartAt] DATE NULL DEFAULT(GETDATE()),
	[dateEndAt] DATE NULL,
)
GO

CREATE TABLE ADMIN_Action (
	accountID int,
	adminID int,
	PRIMARY KEY(accountID, adminID),
	CONSTRAINT fk_Account_action FOREIGN KEY ([accountID]) REFERENCES Accounts ([accountID]),
	CONSTRAINT fk_Admin_action FOREIGN KEY (adminID) REFERENCES Actions (adminID)
)
GO

ALTER TABLE Informations
ADD constraint fk_information_account foreign key (accountID) references Accounts(accountID)
GO

CREATE TABLE Producers (
	[producerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[producerName] NVARCHAR(255) NOT NULL,
	[producerMeta] NVARCHAR(255) NOT NULL,
	[Country] NVARCHAR(255)
)
GO

CREATE TABLE Categories (
	[categoryID] INT IDENTITY(1, 1) NOT NULL,
	[categoryName] NVARCHAR(75) NOT NULL UNIQUE,
	[categoryParentID] INT NULL,
	[categoryMetaTitle] NVARCHAR(100) NULL DEFAULT(NULL),/*Tiêu đề meta được sử dụng cho tiêu đề trình duyệt và SEO.*/
	[categoryCreateAt] DATE NULL,
	[categoryUpdateAt] DATE NULL,
	PRIMARY KEY (categoryID)
)
GO

ALTER TABLE Categories
ADD CONSTRAINT fk_category_category FOREIGN KEY(categoryParentID) REFERENCES Categories(categoryID)
GO

CREATE TABLE CompanyShip(
	companyID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	companyName nvarchar(255) not null UNIQUE,
	feeShipping MONEY NOT NULL DEFAULT(0)
)
GO

CREATE TABLE Products (
	[productID] INT IDENTITY(1,1) NOT NULL,
	[producerID] int NOT NULL,
	[categoryID] int not null,
	[productName] NVARCHAR(75) NOT NULL UNIQUE,		/*Tiêu đề sản phẩm được hiển thị trên Trang cửa hàng và Trang sản phẩm.*/
	[productMetaTitle] NVARCHAR(100) NOT NULL,	/*Tiêu đề meta được sử dụng cho tiêu đề trình duyệt và SEO.*/
	[summary] NVARCHAR(255) NULL,
	[SKU]  NVARCHAR(100) NOT NULL, /*Stock Keeping Unit*/
	[price] MONEY NOT NULL DEFAULT(0),
	[discount] MONEY NOT NULL DEFAULT(0),
	[quantity] INT NOT NULL DEFAULT(0),
	[countBuy] INT NULL,
	[size] nvarchar(150) null,
	[screen] NVARCHAR(150) NULL DEFAULT(NULL),
	[camera] NVARCHAR(150) NULL DEFAULT(NULL),
	[cameraSelfie] NVARCHAR(150) NULL DEFAULT(NULL),
	[CPU] NVARCHAR(150) NULL DEFAULT(NULL),
	[memory] NVARCHAR(150) NULL DEFAULT(NULL),
	[RAM] NVARCHAR(150) NULL DEFAULT(NULL),
	[hardDrive] NVARCHAR(150) NULL DEFAULT(NULL),
	[card] NVARCHAR(150) NULL DEFAULT(NULL),	/*đồ họa */
	[weight] NVARCHAR(150) NULL DEFAULT(NULL),	/*trọng lượng*/
	[warranty] INT NULL DEFAULT(12),	/* thời gian bảo hành tính bằng tháng*/
	[productCreateAt] DATE NULL DEFAULT(GETDATE()),
	[productUpdateAt] DATE NULL DEFAULT(NULL),
	[productSaleStartAt] DATE NULL DEFAULT(NULL),
	[productSaleEndAt] DATE NULL DEFAULT(NULL),
	PRIMARY KEY(productID),
	CONSTRAINT fk_product_producer FOREIGN KEY (producerID) REFERENCES Producers(producerID),
	CONSTRAINT fk_product_category FOREIGN KEY (categoryID) REFERENCES Categories(categoryID),
)
GO

CREATE TABLE ProductColor (
	productID INT NOT NULL PRIMARY KEY,
	color1 NVARCHAR(255) NULL,
	color2 NVARCHAR(255) NULL,
	color3 NVARCHAR(255) NULL,
	color4 NVARCHAR(255) NULL,
	color5 NVARCHAR(255) NULL,
)
GO

ALTER TABLE ProductColor
ADD constraint fk_productColor_product foreign key ([productID]) references Products([productID])
GO

CREATE TABLE ProductImages (
	[productID] INT NOT NULL PRIMARY KEY,
	[image1] nvarchar(255) null,
	[image2] nvarchar(255) null,
	[image3] nvarchar(255) null,
	[image4] nvarchar(255) null,
	[image5] nvarchar(255) null,
)
GO

ALTER TABLE ProductImages
ADD constraint fk_productImages_product foreign key ([productID]) references Products([productID])
GO


CREATE TABLE ProductReview(
	[reviewID] INT IDENTITY(1, 1) NOT NULL,
	[productID] INT NOT NULL,
	[accountID] INT NULL DEFAULT(NULL),
	[content] NVARCHAR(255) NOT NULL,
	[rating] INT NOT NULL DEFAULT(0),
	[reviewCreateAt] DATE NULL DEFAULT(GETDATE()),
	[reviewUpdateAt] DATE NULL DEFAULT(null),
	PRIMARY KEY ([reviewID]),
	CONSTRAINT fk_review_product FOREIGN KEY(productID) REFERENCES Products(ProductID),
	CONSTRAINT fk_review_user FOREIGN KEY([accountID]) REFERENCES Accounts([accountID])
)
GO


CREATE TABLE Category_Producer(
	[producerID] INT NOT NULL,
	[categoryID] INT NOT NULL,
	PRIMARY KEY ([producerID], categoryID),
	CONSTRAINT fk_ct_producer FOREIGN KEY([producerID]) REFERENCES Producers([producerID]),
	CONSTRAINT fk_producer_catogory FOREIGN KEY(categoryID) REFERENCES categories(categoryID)
)
GO


CREATE TABLE PaymentMethods (
	methodID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	methodName NVARCHAR(255) NOT NULL UNIQUE,
)
GO

CREATE TABLE Orders(
	[orderID] INT IDENTITY(1, 1) NOT NULL,
	[accountID] INT,
	[paymentMethodID] INT NOT NULL,
	[companyShipID] INT NOT NULL,
	[status] INT NOT NULL DEFAULT(0),			/*Trạng thái của đơn đặt hàng có thể là
													New, Checkout, Paid, Failed, Shipped,
													Delivered, Returned, and Complete.*/
	[totalMoney] MONEY NOT NULL DEFAULT(0),		/*Tổng đơn hàng mà người mua phải thanh toán.*/
	[orderDiscount] MONEY NOT NULL DEFAULT(0),		/*Tổng chiết khấu của Đơn hàng dựa trên mã khuyến mãi hoặc chiết khấu tại cửa hàng.*/
	[firstName] nvarchar(255) null,
	[lastName] nvarchar(255) null,
	[country] nvarchar(255) null,
	[address] nvarchar(255)  null,
	[phone] nvarchar(15)  null,
	[orderNote] nvarchar(255) NULL,
	[orderCreatedAt] DATE NULL DEFAULT(GETDATE()),
	[orderUpdateAt] DATE NULL DEFAULT(GETDATE()),
	PRIMARY KEY (orderID),
	CONSTRAINT fk_order_account FOREIGN KEY ([accountID]) REFERENCES Accounts ([accountID])

)
GO

ALTER TABLE Orders
ADD CONSTRAINT fk_order_paymentMethod FOREIGN KEY (paymentMethodID) REFERENCES paymentMethods (methodID)
GO

ALTER TABLE Orders
ADD CONSTRAINT fk_order_companyShip FOREIGN KEY ([companyShipID]) REFERENCES CompanyShip ([companyID])
GO

CREATE TABLE OrderLines(
	[orderID] INT NOT NULL,
	[productID] INT NOT NULL,
	[unitPrice] MONEY NOT NULL DEFAULT(0),
	[discount] MONEY NOT NULL DEFAULT(0),
	[quantity] INT NOT NULL DEFAULT(0),
	[color] nvarchar(255) null,
	PRIMARY KEY ([productID], [orderID]),
	CONSTRAINT fk_order_item_product FOREIGN KEY (productID) REFERENCES Products(productID),
	CONSTRAINT fk_order_item_order FOREIGN KEY (orderID) REFERENCES Orders (orderID)
	
)
GO


/* ====================== Insert PayMentMethod ====================== */
INSERT INTO [dbo].[paymentMethods] ([methodName]) VALUES (N'Sử Dụng Số Dư Trong Tài Khoản Để Thanh Toán')
GO

INSERT INTO [dbo].[paymentMethods] ([methodName]) VALUES (N'Thanh Toán Qua Ngân Hàng')
GO

INSERT INTO [dbo].[paymentMethods] ([methodName]) VALUES (N'Thanh Toán Tiền Mặt')
GO

/* ===================================== END ===================================== */

/* ====================== Insert Actions ====================== */
INSERT INTO [dbo].[Actions] VALUES ('Administrator', 1, 1, 1, 1, 1, 1, 1, 1, '2022/01/01', '2022/12/31')
GO
INSERT INTO [dbo].[Actions] VALUES ('Admin Manager', 1, 1, 1, 1, 0, 0, 0, 0, '2022/01/01', '2022/12/31')
GO
INSERT INTO [dbo].[Actions] VALUES ('Admin Seller', 0, 0, 0, 1, 0, 0, 0, 0, '2022/01/01', '2022/12/31')
GO

/* ===================================== END ===================================== */

/* ====================== Insert Country ====================== */
INSERT INTO [dbo].[Countries] VALUES (N'Việt Nam', N'Việt Nam', GETDATE(), NULL)
GO
INSERT INTO [dbo].[Countries] VALUES (N'United Kingdom', N'UK', GETDATE(), NULL)
GO
INSERT INTO [dbo].[Countries] VALUES (N'United State', N'USA', GETDATE(), NULL)
GO
INSERT INTO [dbo].[Countries] VALUES (N'Japan', N'Japan', GETDATE(), NULL)
GO
INSERT INTO [dbo].[Countries] VALUES (N'India', N'India', GETDATE(), NULL)
GO

/* ===================================== END ===================================== */

/* ====================== Insert Account ADMIN ====================== */
INSERT INTO [dbo].[Accounts]	VALUES('admin', '123', 100000000000000, 'hieupmhe163385@fpt.edu.vn', GETDATE(), null)
GO

INSERT INTO [dbo].[Informations] VALUES(1, 1, N'Phan',N'Hiếu','adminPugins/images/avatar-user/phanhieu.jpg', N'Lai Châu', '2001/11/23','0838456798',1, N'Đẹp Là Có Quyền')
GO
INSERT INTO [dbo].[ADMIN_Action] VALUES (1, 1)
GO

INSERT INTO [dbo].[Accounts]	VALUES('123', '123', 100000000000000, 'hieupmhe163385@gmail', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(2, 1, N'Hồng', N'Nhung', 'adminPugins/images/avatar-user/hongnhung.jpg', N'Mộc Châu', '2004/09/13', '',  0, NULL)
GO
INSERT INTO [dbo].[ADMIN_Action] VALUES (2, 2)
GO

INSERT INTO [dbo].[Accounts]	VALUES('456', '456', 0, 'user1@fpt.edu.vn', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(3, 1, N'Nguyễn Văn', N'A', 'adminPugins/images/avatar-user/anh-girl-xinh-facebook-tuyet-dep-387x580.jpg', N'Hà Nội', '2000/11/15', '123456789', 1, NULL)
GO

INSERT INTO [dbo].[Accounts]	VALUES('789', '789', 0, 'user2@fpt.edu.vn', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(4, 1, N'Nguyễn Văn', N'B', 'adminPugins/images/avatar-user/Gai-xinh-nhieu-the-loai-31.jpg', N'Hưng Yên', '2000/10/31', '987654321', 1, NULL)
GO

INSERT INTO [dbo].[Accounts]	VALUES('1', '1', 0, 'user3@fpt.edu.vn', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(5, 1, N'Nguyễn Văn', N'C', 'adminPugins/images/avatar-user/1640793618_494_tong-hop-hinh-anh-gai-xinh-9x-dep-de-thuong.jpg', N'Nam Định', '2000/09/15', '456789123', 0, NULL)
GO

INSERT INTO [dbo].[Accounts]	VALUES('2', '2', 0, 'user4@fpt.edu.vn', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(6, 1, N'Nguyễn Văn', N'D', 'adminPugins/images/avatar-user/anh-gai-xinh-ky-le-hieu-1.jpg', N'Thanh Hóa', '2000/08/15', '321654987', 0, NULL)
GO

INSERT INTO [dbo].[Accounts]	VALUES('3', '3', 0, 'user5@fpt.edu.vn', GETDATE(), null)
GO
INSERT INTO [dbo].[Informations]	VALUES(7, 1, N'Nguyễn Văn', N'E', 'adminPugins/images/avatar-user/anh-gai-xinh-rang-khenh-cuc-yeu.jpg', N'Hà Nội', '2000/07/15', '234167859', 0, NULL)
GO


/* ===================================== END ===================================== */

/* ====================== Insert Category ====================== */
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('Laptop','Laptop')
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('SmartPhone','SmartPhone')
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('Tablet','Tablet')
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('Apple','Apple')
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('Accessories','Accessories')
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle]) VALUES('Tivi','Tivi')
GO
/* Insert Sub-category */
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('iPhone','iPhone', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('iPad','iPad', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('MacBook','MacBook', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('Apple Watch','Apple Watch', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('Apple Tai Nghe','Apple Tai Nghe', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES('Mac Mini','Mac Mini', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES(N'Sạc & Cáp',N'Sạc & Cáp', 4)
GO
INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES(N'AriTag',N'AriTag', 4)
GO

INSERT INTO [dbo].[Categories]([categoryName],[categoryMetaTitle],[categoryParentID]) VALUES(N'Mouse',N'Mouse', 5)
GO

/* ===================================== END ===================================== */

/* ====================== Insert Producer for SmartPhone ====================== */
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Apple',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'SamSung',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Oppo',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Vivo',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Asus',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Nokia',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'RealMe',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Xiaomi',N'SmartPhone','VN')
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (1,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (2,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (3,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (4,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (5,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (6,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (7,2)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (8,2)
GO
/* ===================================== END ===================================== */

/* ====================== Insert Producer for Laptop ====================== */
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Apple', N'Laptop', 'VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Asus', N'Laptop', 'VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'HP',N'Laptop','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Acer',N'Laptop','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'MSI',N'Laptop','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Lenovo',N'Laptop','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'DELL',N'Laptop','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'LG',N'Laptop','VN')
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (9,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (10,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (11,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (12,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (13,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (14,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (15,1)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (16,1)
GO
/* ===================================== END ===================================== */

/* ====================== Insert Producer for Tablet ====================== */
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Apple', N'Tablet', 'VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'SamSung', N'Tablet', 'VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Lenovo',N'Tablet','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Xiaomi',N'Tablet','VN')
GO
INSERT INTO [dbo].[Producers] ([producerName],[producerMeta],[Country]) VALUES (N'Oppo',N'Tablet','VN')
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (17,3)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (18,3)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (19,3)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (20,3)
GO
INSERT INTO [dbo].[Category_Producer] ([producerID],[categoryID]) VALUES (21,3)
GO
/* ===================================== END ===================================== */

/* ====================== Insert CompanyShip ====================== */
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('VNpost', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('Viettel Post', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES(N'Giao Hàng Nhanh', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES(N'Giao Hàng Tiết Kiệm', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('Ahamove', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('Nhanh.vn', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('J&T Express', 100000)
GO
INSERT INTO [dbo].[CompanyShip] ([companyName],[feeShipping])	VALUES('Best Express', 100000)
GO
/* ===================================== END ===================================== */

/* ================================ Insert Product SmartPhone =============================== */
INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'Iphone 13 Pro Max 128GB', N'Iphone', N'iPhone 13 Pro Max xứng đáng là một chiếc iPhone lớn nhất, mạnh mẽ nhất và có thời lượng pin dài nhất từ trước đến nay sẽ cho bạn trải nghiệm tuyệt vời, từ những tác vụ bình thường cho đến các ứng dụng chuyên nghiệp.'
		, N'Còn Hàng', 33990000, 6500000, 100, N'78.1 x 7.4 x 160.8 mm', N'6.7 inch, OLED, Super Retina XDR, 2778 x 1284 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'128 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'228 g', 12, 1, '2022/11/01', '2022/11/30')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (1,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (1, 'adminPugins/productImage/637859778843241685_iphone-13-pro-max-vang-1.webp', 'adminPugins/productImage/637859778843241685_iphone-13-pro-max-vang-2.webp'
		, 'adminPugins/productImage/637859778843397911_iphone-13-pro-max-vang-3.webp', 'adminPugins/productImage/637859778843554049_iphone-13-pro-max-vang-4.webp'
		, 'adminPugins/productImage/637859778843397911_iphone-13-pro-max-vang-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro Max 256GB', N'Iphone', N'iPhone 13 Pro Max 256GB', N'Còn Hàng'
		, 29490000, 7500000, 100, N'160.8 x 78.1 x 7.4 mm', N'6.7 inch, OLED, Super Retina XDR, 2778 x 1284 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'256 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'228 g', 12, 1, '2022/11/01', '2022/12/13')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (2,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (2, 'adminPugins/productImage/637840956036926900_iphone-13-pro-max-xanhreu-1.webp', 'adminPugins/productImage/637840956035676944_iphone-13-pro-max-xanhreu-2.webp'
		, 'adminPugins/productImage/637840956038958373_iphone-13-pro-max-xanhreu-3.webp', 'adminPugins/productImage/637840956035364398_iphone-13-pro-max-xanhreu-4.webp'
		, 'adminPugins/productImage/637840956034583098_iphone-13-pro-max-xanhreu-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy] , [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro Max 512GB', N'Iphone', N'iPhone 13 Pro Max 512GB', N'Còn Hàng'
		, 43990000, 10000000, 100, N'160.8 x 78.1 x 7.4 mm', N'6.7 inch, OLED, Super Retina XDR, 2778 x 1284 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'512 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'228 g', 12, 3, '2022/11/01', '2022/12/14')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (3,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (3, 'adminPugins/productImage/637859770669240063_iphone-13-pro-max-xanh-1.webp', 'adminPugins/productImage/637859770668458847_iphone-13-pro-max-xanh-2.webp'
		, 'adminPugins/productImage/637859770668927544_iphone-13-pro-max-xanh-3.webp', 'adminPugins/productImage/637859770668927544_iphone-13-pro-max-xanh-4.webp'
		, 'adminPugins/productImage/637859770668615150_iphone-13-pro-max-xanh-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty],[countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro Max 1TB', N'Iphone', N'iPhone 13 Pro Max 1TB', N'Còn Hàng'
		, 49990000, 11500000, 100, N'160.8 x 78.1 x 7.4 mm', N'6.7 inch, OLED, Super Retina XDR, 2778 x 1284 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'1TB', N'6 GB'
		, N'Apple GPU 5 nhân', N'228 g', 12, 1,'2022/11/01', '2022/12/15')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (4,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (4, 'adminPugins/productImage/637859751770980691_iphone-13-pro-max-xam-1.webp', 'adminPugins/productImage/637859751770824458_iphone-13-pro-max-xam-2.webp'
		, 'adminPugins/productImage/637859751770824458_iphone-13-pro-max-xam-3.webp', 'adminPugins/productImage/637859752824294356_iphone-13-pro-max-xam-4.webp'
		, 'adminPugins/productImage/637859751770824458_iphone-13-pro-max-xam-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty],[countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro 128GB', N'Iphone', N'iPhone 13 Pro 128GB', N'Còn Hàng'
		, 30990000, 6500000, 100, N'71.5 x 7.4 x 146.7 mm', N'6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'128 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'189 g', 12, 1,'2022/11/01', '2022/12/30')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (5,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (5, 'adminPugins/productImage/637862362161472689_iphone-13-pro-max-bac-1.webp', 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-2.webp'
		, 'adminPugins/productImage/637862362160535213_iphone-13-pro-max-bac-3.webp', 'adminPugins/productImage/637862362160691419_iphone-13-pro-max-bac-4.webp'
		, 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro 256GB', N'Iphone', N'iPhone 13 Pro 256GB', N'Còn Hàng'
		, 34990000, 8000000, 100, N'71.5 x 7.4 x 146.7 mm', N'6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'256 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'189 g', 12, 1,'2022/11/01', '2022/12/20')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (6,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (6, 'adminPugins/productImage/637862362161472689_iphone-13-pro-max-bac-1.webp', 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-2.webp'
		, 'adminPugins/productImage/637862362160535213_iphone-13-pro-max-bac-3.webp', 'adminPugins/productImage/637862362160691419_iphone-13-pro-max-bac-4.webp'
		, 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(1, 2, N'iPhone 13 Pro 512GB', N'Iphone', N'iPhone 13 Pro 512GB', N'Còn Hàng'
		, 40990000, 10000000, 100, N'71.5 x 7.4 x 146.7 mm', N'6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'512 GB', N'6 GB'
		, N'Apple GPU 5 nhân', N'189 g', 12, 1)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (7,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (7, 'adminPugins/productImage/637862362161472689_iphone-13-pro-max-bac-1.webp', 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-2.webp'
		, 'adminPugins/productImage/637862362160535213_iphone-13-pro-max-bac-3.webp', 'adminPugins/productImage/637862362160691419_iphone-13-pro-max-bac-4.webp'
		, 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(1, 2, N'iPhone 13 Pro 1TB', N'Iphone', N'iPhone 13 Pro 1TB', N'Còn Hàng'
		, 46990000, 12000000, 100, N'71.5 x 7.4 x 146.7 mm', N'6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels'
		, N'12.0 MP + 12.0 MP + 12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'1 TB', N'6 GB'
		, N'Apple GPU 5 nhân', N'189 g', 12, 3, '2022/06/01', '2022/12/31')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (8,N'Xanh',N'Vàng',N'Xanh Lá',N'Bạc',N'Xám')
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (8, 'adminPugins/productImage/637862362161472689_iphone-13-pro-max-bac-1.webp', 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-2.webp'
		, 'adminPugins/productImage/637862362160535213_iphone-13-pro-max-bac-3.webp', 'adminPugins/productImage/637862362160691419_iphone-13-pro-max-bac-4.webp'
		, 'adminPugins/productImage/637862362160378955_iphone-13-pro-max-bac-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(9, 1, N'MacBook Pro 14" 2021 M1 Pro Ram 32GB', N'MacBook', N'MacBook Pro 14" 2021 M1 Pro Ram 32GB', N'Còn Hàng'
		, 63990000, 6000000, 100, N'14.2 inch', N'14.2 inch, 3024 x 1964 Pixels'
		, N'Apple, M1 Pro', N'SSD 512 GB', N'32 GB'
		, N'Apple M1', N'	1.604 kg', 12, 3)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (9, NULL, NULL, NULL, NULL, NULL)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (9, 'adminPugins/productImage/637702664476604311_macbook-pro-14-2021-xam-2.webp', 'adminPugins/productImage/637702664477698071_macbook-pro-14-2021-xam-1.webp'
		, 'adminPugins/productImage/637702664476291805_macbook-pro-14-2021-xam-4.webp', 'adminPugins/productImage/637702664475510538_macbook-pro-14-2021-xam-3.webp'
		, NULL)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(9, 1, N'MacBook Pro 16" 2021 M1 Pro Ram 32GB', N'MacBook', N'MacBook Pro 16" 2021 M1 Pro Ram 32GB', N'Còn Hàng'
		, 76990000, 7000000, 100, N'16.2 inch', N'16.2 inch, 3456 x 2234 Pixels'
		, N'Apple, M1 Pro', N'SSD 512 GB', N'32 GB'
		, N'Apple M1', N'2.129 kg', 12, 2)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (10, NULL, NULL, NULL, NULL, NULL)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (10, 'adminPugins/productImage/637702664476604311_macbook-pro-14-2021-xam-2.webp', 'adminPugins/productImage/637702664477698071_macbook-pro-14-2021-xam-1.webp'
		, 'adminPugins/productImage/637702664476291805_macbook-pro-14-2021-xam-4.webp', 'adminPugins/productImage/637702664475510538_macbook-pro-14-2021-xam-3.webp'
		, NULL)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(9, 1, N'MacBook Pro 16" 2021 M1 Max 1TB', N'MacBook', N'MacBook Pro 16" 2021 M1 Max 1TB', N'Còn Hàng'
		, 92990000, 7000000, 100, N'35.57 x 24.81 x 1.68 cm', N'16.2 inch, 3456 x 2234 Pixels, OLED, 120 Hz, Retina'
		, N'Apple, M1 Max, 10-Core', N'SSD 1 TB', N'32 GB, LPDDR4, 3200 MHz'
		, N'Apple M1 Max GPU 32-core', N'2.129 kg', 12, 0)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (11, N'Bạc', N'Xám', NULL, NULL, NULL)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (11, 'adminPugins/productImage/637702684259410014_macbook-pro-16-2021-bac-2.webp', 'adminPugins/productImage/637702684259566248_macbook-pro-16-2021-bac-1.webp'
		, 'adminPugins/productImage/637702684258003720_macbook-pro-16-2021-bac-3.webp', 'adminPugins/productImage/637702684258628768_macbook-pro-16-2021-bac-4.webp'
		, NULL)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productSaleStartAt], [productSaleEndAt])
VALUES	(9, 1, N'MacBook Air M2 2022 13 inch 8CPU 8GPU 16GB 256GB', N'MacBook', N'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.'
		, N'Còn Hàng', 38990000, 3000000, 100, N'30.41 x 21.5 x 1.13 cm', N'13.6 inch, 2560 x 1644 Pixels, 500 nits, Retina'
		, N'Apple, M2, 8 - Core', N'SSD 256 GB', N'16 GB, LPDDR4, 3200 MHz'
		, N'Apple M2 GPU 8 nhân', N'1.24 kg', 12, 0, '2022/06/01', '2022/12/31')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (12, N'Xanh Đen', N'Bạc', N'Vàng', N'Xám', NULL)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (12, 'adminPugins/productImage/637901923612601202_macbook-air-m2-2022-den-1.webp', 'adminPugins/productImage/637901923613382101_macbook-air-m2-2022-den-2.webp'
		, 'adminPugins/productImage/637901923611350779_macbook-air-m2-2022-den-3.webp', 'adminPugins/productImage/637901923608538266_macbook-air-m2-2022-den-4.webp'
		, 'adminPugins/productImage/637901923607757000_macbook-air-m2-2022-den-6.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(9, 1, N'MacBook Pro 13" 2020 Touch Bar M1 256GB', N'MacBook', N'Tốc độ và sức mạnh hoàn hảo trong một thân máy nhỏ gọn. MacBook Pro M1 13 inch 2020 Touch Bar mới với bộ vi xử lý Apple M1 cho bạn hiệu suất và thời lượng pin tuyệt vời nhất từ trước đến nay'
		, N'Còn Hàng', 32999000, 4000000, 100, N'304.1 x 212.4 x 15.6 mm', N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone'
		, N'Apple, M1', N'SSD 256 GB', N'8 GB, LPDDR4'
		, N'Apple M1 GPU 8 nhân', N'1.4 kg', 12, 2)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (13, N'Bạc', N'Xám', NULL, NULL, NULL)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (13, 'adminPugins/productImage/637408006342832761_mbp-2020-m1-silver-1.webp', 'adminPugins/productImage/637408006343301015_mbp-2020-m1-silver-2.webp'
		, 'adminPugins/productImage/637408006342676182_mbp-2020-m1-silver-3.webp', 'adminPugins/productImage/637408006342676182_mbp-2020-m1-silver-4.webp'
		, null)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(17, 3, N'iPad Pro 11 2021 M1 Wi-Fi 128GB', N'iPad', N'Mạnh mẽ hơn tất cả những gì bạn từng biết trước đây về một thiết bị di động, iPad Pro M1 2021 với bộ vi xử lý Apple M1 hoàn toàn mới cho tốc độ cực nhanh và khả năng đáp ứng công việc hoàn hảo.'
		, N'Còn Hàng', 22999000, 3000000, 100, N'247.6 x 185.5 x 5.9 mm', N'11.0 inch, IPS LCD, Liquid Retina HD, 2388 x 1668 Pixels'
		, N'12.0 MP + 10.0 MP', N'12.0 MP', N'Apple M1', N'128 GB', N'8 GB'
		, N'Apple M1', N'471 g', 12, 1)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (14, N'Xám',N'Bạc', null , null , null )
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (14, 'adminPugins/productImage/637546013884494743_ipad-pro-11-wifi-xam-1.webp', 'adminPugins/productImage/637844101428975156_iPad Pro 11 2021 M1 Wi-F (5).webp'
		, 'adminPugins/productImage/637844101428818826_iPad Pro 11 2021 M1 Wi-F (2).webp', 'adminPugins/productImage/637844101431943977_iPad Pro 11 2021 M1 Wi-F (9).webp'
		, null)
GO


INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(17, 3, N'iPad Gen 9 2021 10.2 inch WiFi 64GB', N'Table-Apple', N'Mạnh mẽ, dễ dàng sử dụng, màn hình lớn, đặc biệt được bán ở mức giá rẻ, iPad Gen 9 10.2 2021.'
		, N'Còn Hàng', 9990000, 1200000, 100, N'250.6 x 174.1 x 7.5 mm', N'10.2 inch, IPS LCD, Liquid Retina HD, 2160 x 1620 Pixels'
		, N'8.0 MP', N'12.0 MP', N'Apple A13 Bionic', N'64 GB', N'3 GB, LPDDR4X'
		, N'Apple GPU 4 nhân', N'490 g', 12, 0)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (15, N'Bạc',N'Xám', null , null , null )
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (15, 'adminPugins/productImage/637673417056583747_ipad-10-2-2021-wi-fi-bac-1.webp', 'adminPugins/productImage/637673417055958761_ipad-10-2-2021-wi-fi-bac-2.webp'
		, 'adminPugins/productImage/637673417054552510_ipad-10-2-2021-wi-fi-bac-3.webp', null
		, null)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(17, 3, N'iPad mini 6 2021 8.3 inch WiFi 64GB', N'Table-Apple', N'Sức mạnh khủng khiếp trong một thiết kế nhỏ gọn đáng yêu, iPad Mini 6 2021 đánh dấu sự trở lại mạnh mẽ của dòng iPad mini luôn được người dùng yêu thích.'
		, N'Còn Hàng', 14990000, 1600000, 100, N'134.8 x 6.3 x 195.4 mm', N'8.3 inch, IPS LCD, Liquid Retina HD, 2048 x 1536 Pixels'
		, N'12.0 MP', N'12.0 MP', N'Apple A15 Bionic', N'64 GB', N'4 GB, LPDDR4X'
		, N'Apple GPU 5 nhân', N'293 g', 12, 1, '2021/09/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (16,N'Xám',N'Vàng',N'Tím',N'Hồng', null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (16, 'adminPugins/productImage/637673374179519726_ipad-mini-8-3-2021-wi-fi-xam-1.webp', 'adminPugins/productImage/637845984511003055_iPad Mini 8.3 2021 Wi-Fi (8).webp'
		, 'adminPugins/productImage/637845984511315506_iPad Mini 8.3 2021 Wi-Fi (9).webp', null
		, null)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy Z Fold4 5G 256GB', N'Samsung', N'Với Samsung Galaxy Z Fold4, smartphone màn hình gập đã trở nên thân thiện, tiện dụng và bền bỉ hơn rất nhiều. Những cải tiến thiết thực trong từng khía cạnh giúp sản phẩm biến hóa linh hoạt hơn và đem lại những trải nghiệm không thể tìm thấy ở đâu khác.'
		, N'Còn Hàng', 40990000, 3000000, 100, N'155.1 x 130.1 x 6.3 mm', N'Phụ: 6.2 inch, Chính: 7.6 inch, Dynamic AMOLED 2X, WXGA+, 1768 x 2208 Pixels'
		, N'50.0 MP + 12.0 MP + 10.0 MP', N'10.0 MP', N'Snapdragon 8+ Gen 1', N'256 GB', N'12 GB'
		, N'', N'271 g', 12, 1, '2022/08/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (17,N'Đen ',N'Xanh',N'Kem', null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (17, 'adminPugins/productImage/637957713446663124_samsung-galaxy-z-fold4-den-1.jpg', 'adminPugins/productImage/637957713446350652_samsung-galaxy-z-fold4-den-2.jpg'
		, 'adminPugins/productImage/637957713447131891_samsung-galaxy-z-fold4-den-3.jpg', 'adminPugins/productImage/637957713444475706_samsung-galaxy-z-fold4-den-4.jpg'
		, 'adminPugins/productImage/637957713443381857_samsung-galaxy-z-fold4-den-6.jpg')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy S22 Plus 5G 128GB', N'Samsung', N'Tận hưởng những công nghệ hàng đầu nhà Samsung, Galaxy S22 Plus 5G sẽ cho bạn trải nghiệm đỉnh cao từ thiết kế thời thượng, hiệu năng mạnh mẽ Snapdragon 8 Gen 1 và hệ thống camera đêm chuyên nghiệp nhất từ trước đến nay.'
		, N'Còn Hàng', 25990000, 4000000, 100, N'161.4 x 75.6 x 7.8 mm', N'6.6 inch, Dynamic AMOLED 2X, FHD+, 1080 x 2340 Pixels'
		, N'50.0 MP + 12.0 MP + 10.0 MP', N'10.0 MP', N'Snapdragon 8 Gen 1', N'128 GB', N'8 GB'
		, N'', N'189 g', 12, 0, '2022/03/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (18,N'Đen ',N'Xanh',N'Hồng', N'Trắng', null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (18, 'adminPugins/productImage/637800486734376188_samsung-galaxy-s22-plus-den-1.webp', 'adminPugins/productImage/637800486734063730_samsung-galaxy-s22-plus-den-2.webp'
		, 'adminPugins/productImage/637800486731251223_samsung-galaxy-s22-plus-den-4.webp', 'adminPugins/productImage/637800486733751326_samsung-galaxy-s22-plus-den-5.webp'
		, 'adminPugins/productImage/637800486731095059_samsung-galaxy-s22-plus-den-3.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy A73 5G', N'Samsung', N'Trải nghiệm hệ thống camera 108MP đầu tiên trên thế hệ Galaxy A, hiệu năng cực mạnh Snapdragon 778G, màn hình 120Hz mượt mà và kết nối 5G siêu tốc, Samsung Galaxy A73 5G đã sẵn sàng đưa bạn vào thế giới công nghệ đỉnh cao'
		, N'Còn Hàng', 11990000, 0, 100, N'163.7 x 76.1 x 7.6 mm', N'6.7 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels'
		, N'108.0 MP + 12.0 MP + 5.0 MP + 5.0 MP', N'32.0 MP', N'Snapdragon 778G', N'128 GB', N'8 GB'
		, N'Adreno 642L', N'181 g', 12, 3, '2022/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (19,N'Xám',N'Xanh',N'Trắng', null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (19, 'adminPugins/productImage/637849355333862203_samsung-galaxy-a73-xam-1.webp', 'adminPugins/productImage/637849355334018437_samsung-galaxy-a73-xam-2.webp'
		, 'adminPugins/productImage/637849355333080905_samsung-galaxy-a73-xam-3.webp', 'adminPugins/productImage/637849355333862203_samsung-galaxy-a73-xam-4.webp'
		, 'adminPugins/productImage/637849355332612180_samsung-galaxy-a73-xam-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy A04s', N'Samsung', N'Samsung Galaxy A04s nâng tầm trải nghiệm với hệ thống camera 50MP, màn hình siêu mượt mà 90Hz và pin lớn. Tất cả hội tụ để người dùng có thể tận hưởng được công nghệ tiện lợi ở mức giá phải chăng '
		, N'Còn Hàng', 3990000, 0, 100, N'164.2 x 75.9 x 9.1 mm', N'6.5 inch, PLS LCD, HD+, 720 x 1600 Pixels'
		, N'50.0 MP + 2.0 MP + 2.0 MP', N'5.0 MP', N'Exynos 850', N'64 GB', N'4 GB'
		, null, N'195 g', 12, 0, '2022/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (20,N'Đen',N'Đồng',N'Xanh Lá', null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (20, 'adminPugins/productImage/637987530648955323_samsung-galaxy-a04s-den-4.webp', 'adminPugins/productImage/637987530648799053_samsung-galaxy-a04s-den-1.webp'
		, 'adminPugins/productImage/637987530647861536_samsung-galaxy-a04s-den-3.webp', 'adminPugins/productImage/637987530646611531_samsung-galaxy-a04s-den-5.webp'
		, 'adminPugins/productImage/637987530645049161_samsung-galaxy-a04s-den-2.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy Z Flip4 5G 128GB', N'Samsung', N'Nhỏ gọn và tinh tế, Galaxy Z Flip4 là chiếc smartphone sinh ra dành cho các tín đồ thời trang. Cơ chế gập duyên dáng, bộ màu sắc nhẹ nhàng và loạt chức năng quay chụp sẽ làm say lòng những người yêu cái đẹp.'
		, N'Còn Hàng', 23990000, 3000000, 100, N'165.2 x 71.9 x 6.9 mm', N'Chính: 6.7 inch, Phụ: 1.9 inch, Dynamic AMOLED, FHD+, 1080 x 2636 Pixels'
		, N'12.0 MP + 12.0 MP', N'10.0 MP', N'Snapdragon 8+ Gen 1', N'128 GB', N'8 GB'
		, null, N'183 g', 12, 3, '2022/08/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (21,N'Tím',N'Vàng',N'Xanh', N'Xám', null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (21, 'adminPugins/productImage/637957658354316100_samsung-galaxy-z-flip4-tim-1.webp', 'adminPugins/productImage/637957703261967280_samsung-galaxy-z-flip4-tim-2.webp'
		, 'adminPugins/productImage/637957703260561099_samsung-galaxy-z-flip4-tim-3.webp', 'adminPugins/productImage/637957703262279890_samsung-galaxy-z-flip4-tim-4.webp'
		, 'adminPugins/productImage/637957703261029822_samsung-galaxy-z-flip4-tim-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(2, 2, N'Samsung Galaxy S22 Ultra 5G 512GB', N'Samsung', N'Samsung Galaxy S22 Ultra 5G là siêu phẩm kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S, tạo nên sức mạnh vô song đỉnh cao. Điện thoại đã thiết lập chuẩn mực mới cho dòng smartphone cao cấp từ sức mạnh hàng đầu Snapdragon 8 Gen 1'
		, N'Còn Hàng', 36990000, 6000000, 100, N'161.4 x 75.6 x 7.8', N'6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels'
		, N'108.0 MP + 12.0 MP + 10.0 MP + 10.0 MP', N'40.0 MP', N'Snapdragon 8 Gen 1', N'512 GB', N'12 GB'
		, null, N'189 g', 12, 1, '2022/03/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (22,N'Đen',N'Đỏ',N'Xanh', N'Trắng', null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (22, 'adminPugins/productImage/637800453115752334_samsung-galaxy-s22-ultra-den-1.webp', 'adminPugins/productImage/637800453116221065_samsung-galaxy-s22-ultra-den-2.webp'
		, 'adminPugins/productImage/637800453113877339_samsung-galaxy-s22-ultra-den-3.webp', 'adminPugins/productImage/637800453119346022_samsung-galaxy-s22-ultra-den-4.webp'
		, 'adminPugins/productImage/637800453116064927_samsung-galaxy-s22-ultra-den-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy])
VALUES	(10, 1, N'Laptop Asus TUF Gaming 4600H/8GB/512GB/GeForce GTX', N'Laptop-Asus', N'Asus TUF Gaming A15 FA506IHRB-HN019W là chiếc laptop chơi game đỉnh mà học tập và làm việc cũng rất tốt nhờ cấu hình không thể chê trong tầm giá. Một chiếc laptop gaming được bán với mức giá văn phòng chắc chắn sẽ rất hấp dẫn'
		, N'Còn Hàng', 18990000, 1500000, 100, N'359 x 256 x 22.8 mm', N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, Anti-Glare LED-Backlit Display'
		, N'AMD, Ryzen 5, 4600H', N'SSD 512 GB', N'8 GB (1 thanh 8 GB), DDR4, 3200 MHz'
		, N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics', N'2.30 kg', 24, 1)
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (23, N'Đen', null, null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (23, 'adminPugins/productImage/637950740525519524_asus-tuf-gaming-fa506ihr-den-1.webp', 'adminPugins/productImage/637950740525832274_asus-tuf-gaming-fa506ihr-den-4.webp'
		, 'adminPugins/productImage/637950740524582194_asus-tuf-gaming-fa506ihr-den-2.webp', 'adminPugins/productImage/637950740522706981_asus-tuf-gaming-fa506ihr-den-3.webp'
		, 'adminPugins/productImage/637950740525207232_asus-tuf-gaming-fa506ihr-den-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(10, 1, N'Laptop Asus Vivobook D515DA-EJ1364W/R3-3250U/4GB/512GB', N'Laptop-Asus', N'ASUS Vivobook D515DA-EJ1364W sở hữu màn hình lớn 15,6 inch Full HD sắc nét, thiết kế màu bạc thời thượng cùng ổ SSD dung lượng lên tới 512GB trong tầm giá rẻ, cho bạn phương tiện học tập và làm việc hiệu quả.'
		, N'Còn Hàng', 10990000, 1000000, 100, N'360 x 235 x 19.9 mm', N'15.6 inch, 1920 x 1080 Pixels, TN, 60 Hz, 200 nits, LED Backlit'
		, N'AMD, Ryzen 3, 3250U', N'SSD 512 GB', N'	4 GB (1 thanh 4 GB), DDR4, 2400 MHz'
		, N'AMD Radeon Graphics', N'1.8 kg', 24, 3, '2022/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (24, N'Bạc', null, null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (24, 'adminPugins/productImage/637503832634786560_asus-vivobook-x515-print-bac-1.webp', 'adminPugins/productImage/637503832634630358_asus-vivobook-x515-print-bac-2.webp'
		, 'adminPugins/productImage/637503832634630358_asus-vivobook-x515-print-bac-3.webp', 'adminPugins/productImage/637503832634319820_asus-vivobook-x515-print-bac-5.webp'
		, 'adminPugins/productImage/637503832634319820_asus-vivobook-x515-print-bac-4.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(10, 1, N'Laptop Asus Vivobook Pro R5 5600H/8GB/512GB SSD', N'Laptop-Asus', N'ASUS Vivobook Pro M3401QA KM006W là chiếc laptop mê hoặc mọi ánh nhìn, từ thiết kế màu bạc thời trang phá cách, cho đến màn hình 14 inch 2.8K OLED đẹp tuyệt đỉnh, mang tới trải nghiệm đắm chìm dù làm việc hay giải trí.'
		, N'Còn Hàng', 18990000, 1000000, 100, N'360 x 235 x 19.9 mm', N'14.0 inch, 2880 x 1800 Pixels, OLED, 90 Hz, 600 nits, OLED'
		, N'AMD, Ryzen 5, 5600H', N'SSD 512 GB', N'8 GB, DDR4, 3200 MHz'
		, N'AMD Radeon Graphics', N'1.4 kg', 24, 2, '2021/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (25, N'Bạc', null, null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (25, 'adminPugins/productImage/637764585584576434_asus-vivobook-pro-m3401qa-bac-1.webp', 'adminPugins/productImage/637764585583951463_asus-vivobook-pro-m3401qa-bac-2.webp'
		, 'adminPugins/productImage/637764585587232674_asus-vivobook-pro-m3401qa-bac-3.webp', 'adminPugins/productImage/637764585586295124_asus-vivobook-pro-m3401qa-bac-4.webp'
		, 'adminPugins/productImage/637764585583795188_asus-vivobook-pro-m3401qa-bac-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(11, 1, N'Laptop HP Pavilion 15 eg2036TX i5 1235U/8GB/512GB', N'Laptop-HP', N'Thiết kế nhỏ gọn, bộ vi xử lý Intel thế hệ thứ 12 kết hợp với card đồ họa rời mạnh mẽ, bàn di chuột chính xác, thời lượng pin dài, sạc nhanh, màn hình lớn sắc nét và âm thanh B&O sống động.'
		, N'Còn Hàng', 20590000, 1000000, 100, N'360 x 235 x 19.9 mm', N'14.0 inch, 2880 x 1800 Pixels, OLED, 90 Hz, 600 nits, OLED'
		, N'AMD, Ryzen 5, 5600H', N'SSD 512 GB', N'8 GB, DDR4, 3200 MHz'
		, N'AMD Radeon Graphics', N'1.4 kg', 24, 0, '2021/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (26, N'Bạc', null, null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (26, 'adminPugins/productImage/637947006435405914_hp-pavilion-15-eg-bac-2022-win11-1.webp', 'adminPugins/productImage/637947006435405914_hp-pavilion-15-eg-bac-2022-win11-2.webp'
		, 'adminPugins/productImage/637947006435093416_hp-pavilion-15-eg-bac-2022-win11-3.webp', 'adminPugins/productImage/637947006433687134_hp-pavilion-15-eg-bac-2022-win11-4.webp'
		, 'adminPugins/productImage/637947006430405777_hp-pavilion-15-eg-bac-2022-win11-5.webp')
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(11, 1, N'Laptop HP 240 G8 i3 1005G1/8GB/512GB', N'Laptop-HP', N'Hướng trọng tâm vào việc đem tới những trải nghiệm tốt nhất về hiệu năng, sự cơ động và bảo mật thông tin người dùng, HP 240 G8 i3 1005G1 là sản phẩm đáng tin cậy'
		, N'Còn Hàng', 14190000, 3200000, 100, N'360 x 235 x 19.9 mm', N'14.0 inch Chính:, 1366 x 768 Pixels, SVA, 60 Hz, 250 nits, Anti-glare LED Backlit Ultra Slim Chính:'
		, N'Intel, Core i3, 1005G1', N'SSD 512 GB', N'8 GB (1 thanh 8 GB), DDR4, 2666 MHz'
		, N'Intel UHD Graphics', N'1.47 kg', 24, 0, '2021/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (27, N'Bạc', null, null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (27, 'adminPugins/productImage/637583197350780092_hp-240-g8-bac-1.webp', 'adminPugins/productImage/637583197353436452_hp-240-g8-bac-3.webp'
		, 'adminPugins/productImage/637583197348592634_hp-240-g8-bac-2.webp', null, null)
GO

INSERT INTO [dbo].[Products] ([producerID],[categoryID],[productName],[productMetaTitle],[summary],[SKU]
		   ,[price],[discount],[quantity],[size],[screen],[camera],[cameraSelfie],[CPU],[memory],[RAM]
		   ,[card],[weight],[warranty], [countBuy], [productCreateAt])
VALUES	(18, 3, N'Samsung Galaxy Tab A8 2022', N'Table-Samsung', N'Sức mạnh khủng khiếp trong một thiết kế nhỏ gọn đáng yêu, iPad Mini 6 2021 đánh dấu sự trở lại mạnh mẽ của dòng iPad mini luôn được người dùng yêu thích.'
		, N'Còn Hàng', 14990000, 1600000, 100, N'134.8 x 6.3 x 195.4 mm', N'10.5 inch, TFT LCD, WUXGA, 1920 x 1200 Pixels'
		, N'8.0 MP', N'	5.0 MP', N'Unisoc T618', N'64 GB', N'4 GB'
		, N'Apple GPU 5 nhân', N'293 g', 12, 2, '2022/01/01')
GO
INSERT INTO [dbo].[ProductColor] ([productID],[color1],[color2],[color3],[color4],[color5])
VALUES (28,N'Xám',N'Bạc', null, null, null)
GO
INSERT INTO [dbo].[ProductImages] ([productID], [image1], [image2], [image3], [image4], [image5])
VALUES (28, 'adminPugins/productImage/637772299857867551_samsung-galaxy-tab-a8-xam-1.webp', 'adminPugins/productImage/637772299857867551_samsung-galaxy-tab-a8-xam-2.webp'
		, 'adminPugins/productImage/637772299857554683_samsung-galaxy-tab-a8-xam-3.webp', 'adminPugins/productImage/637772299858648454_samsung-galaxy-tab-a8-xam-4.webp'
		, 'adminPugins/productImage/637772299856460886_samsung-galaxy-tab-a8-xam-5.webp')
GO
/* ===================================== END ===================================== */

/* ================================ Insert Review =============================== */
/*Tháng 1/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (1, 1, N'Mua ip13 pro max nâng cấp ios 16 bị lỗi đem ra bảo hành thì hẹn 15 ngày. Đủ 15 ngày lại hẹn tiếp 12 đến 14 ngày nữa. Ra lấy hàng thì nhân viên thái độ', 1, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (2, 2, N'Pin khoẻ, cảm ứng rất mượt, nhân viên chú đáo dễ thương, 10 đỉm', 5, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (3, 3, N'Tuyệt vời', 5, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (4, 4, N'Cần người giải thích về việc, mua máy mới 100% nguyên seal mà lại đi dán keo 4 góc là như thế nào ạ.', 1, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (5, 5, N'Hàng ok . Phục phụ tận tình tại fptshop đông yên , yên phong , bắc ninh', 3, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (6, 6, N'Rất vừa tay. Màn hình lớn hiển thị tốt. Trọng lượng nhẹ cầm nắm tốt. Pin khoẻ. Dùng sương sương được một ngày.', 5, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (7, 7, N'Hàng chính hãng, tốt, nhân viên tư vấn nhiệt tình, tuy gía hơi cao hơn các chỗ khác một chút nhưng yên tâm về chất lượng.', 5, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (8, 7, N'Mua ip13 pro max nâng cấp ios 16 bị lỗi đem ra bảo hành thì hẹn 15 ngày. Đủ 15 ngày lại hẹn tiếp 12 đến 14 ngày nữa. Công nhận mần ăn ok ghê.', 1, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (9, 6, N'một thiết bị di động lý tưởng để giải quyết nhanh công việc', 5, '2022/01/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (10, 5, N'Quá tệ', 1, '2022/01/13', NULL)
GO
/*Tháng 2/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (11, 4, N'Không có gì để chê, mình dùng 12 PRM, đợi đến giwof giá máy rất tốt mới xuống tiền mua, không phụ kì vọng tí nào luôn ấy, nâng cấp cải thiện lớn giữa 2 sản pohaarm', 5, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (12, 3, N'Máy chụp hình siêu nét, cảm ứng mượt mà', 5, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (13, 2, N'Dùng không nóng máy, sạc pin vào nhanh, tiết kiệm điện, cảm biến thông minh. Nv tư vấn và cài đặt rất nhiệt tình', 5, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (14, 1, N'Mới mua tặng vợ hôm qua mà thất vọng quá. dây đeo thì bị đứt, hộp thì trầy sướt và dính đất', 2, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (15, 1, N'Bộ nhớ lớn, Camera chụp hình đẹp, Độ phân giải sắc nét, pin hơi hẹo', 4, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (16, 2, N'Fpt lừa mình mở cái thẻ tín dụng rồi ko giảm. Phí mất cái công đi mở thẻ TPBank', 1, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (17, 3, N'Không nên mua. Máy mới mua 7 ngày giật lag,khởi động máy lại cũng phải đợi cả nửa tiếng đồng. Xài youtube thoi cũng nóng máy. Nhân viên bán hàng mất vệ sinh. Gọi điện tổng đài mà tổng đài không giải quyết. Không nên mua ở đây', 1, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (18, 4, N'Đã mua sản phẩm này và khá ưng dịch vụ của shop nguyễn duy trinh', 4, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (19, 5, N'Máy có cấu hình khá tốt so với giá thành, thiết kế cũng bắt mắt nữa.', 4, '2022/02/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (20, 6, N'Mình Đã mua hàng tại FPT nhiều lần. Luôn cảm thấy hài lòng về sản phẩm, khuyến mãi và dịch vụ, đặc biệt là dịch vụ của shop 422 cầu giấy', 5, '2022/02/13', NULL)
GO
/*Tháng 3/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (21, 7, N'sp Điện thoại tích hợp cảm biến vân tay cạnh bên, giúp bạn mở khóa máy siêu nhanh chỉ sau một cú chạm.', 5, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (22, 7, N'Pin ok. Nếu ko xài gì nhiều thì 2 ngày mới phải xạc. Ngon', 5, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (23, 6, N'Pin sạc rất nhanh và OK thích lắm rất hài lòng, lần đầu sd xiaomi thấy OK', 5, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (24, 5, N'Sản phẩm có mặt lưng mang phong cách Glow tạo hiệu ứng chuyển sắc đẹp lung linh ảo cực kì ấy', 4, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (25, 4, N'Chất lượng sản phẩm tốt, shop tư vấn nhiệt tình, mình sẽ tiếp tục ủng hộ chi nhánh số 411 lê hồng phong', 4, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (26, 3, N'May dep, muot, nhung tuot pin mau', 3, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (27, 2, N'Sản phẩm được hỗ trợ trả góp nhanh, thủ tục đơn giản', 3, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (28, 1, N'Mới mua thời gian đầu pin đầu pin trâu nhưng nay cảm giác yếu hơn rồi, mấy các khác dùng vẫn ổn, chụp hình cũng được', 3, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (1, 1, N'Sản phẩm dùng tạm ổn. Rất hợp cho người lớn tuổi. Chạy nhiều ứng dụng hơi có hiện tượng giật nhé', 2, '2022/03/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (2, 2, N'màn hình lớn, chụp ảnh nét, shop tư vấn rất ưng, sẽ giới thiệu nhiều bạn bè qua ủng hộ', 2, '2022/03/13', NULL)
GO
/*Tháng 4/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (3, 3, N'Nói chung ổn ,chụp chưa được đẹp còn pin trâu, mong sẽ cải thiện sau này', 4, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (4, 4, N'CHính sách ưu đãi giảm giá tốt', 4, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (5, 5, N'Tốc độ xử lý thì ok, chụp hình đủ sáng đẹp, thiếu sáng thì hơi tệ, màn hình hiển thị đẹp. Máy hơi nóng. Thích nhất sạc pin rất nhanh rất tiện lợi', 4, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (6, 6, N'chơi game nhẹ chạy mươtj, game nặng bị lag. Camera chụp khá tốt có chống rung.', 5, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (7, 7, N'Game đỉnh, màn hình đẹp. Mình dùng lướt fb các kiểu trong 1 ngày thoải mái.', 5, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (8, 7, N'máy đẹp , chụp hình ổn, nghe nhạc bằng loa ngoài chất, mọi thao tác đều ok', 5, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (9, 6, N'giá máy đang được giảm giá nhiều, rất là ưng', 2, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (10, 5, N'ngoại trừ điểm trừ pin hơi kém còn lại siêuđỉnh', 3, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (11, 4, N'FPT bán hàng chất lượng, khuyến mãi hậu mãi tốt, đặc biệt rất thích cách phục vụ của shop 516 cách mạng tháng 8', 4, '2022/04/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (12, 3, N'mua sản phầm được 2 tháng dùng khá ok . Nhưng dạo này mình sạc đt thì máy đang sạc sờ vào thấy hơi tê tê, ko biết có sao ko', 4, '2022/04/13', NULL)
GO
/*Tháng 5/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (13, 2, N'Mới mua Xiaomi mi 11t hơn 1 tuần Pin tụt ngày càng nhanh, ngày đầu khá ổn, đến nay thì nhanh gấp đôi trong khi chỉ sử dụng game nhẹ, chrome, đã tắt các ứng dụng chạy ngầm chỉ sử dụng 60Hz. Hơi thất vọng', 3, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (14, 1, N'nhuoc diem:may choi liên quan giat lang.pin tụt nhanh phan tn k có dấu nhu samsung; ưu diem;camera chup dep.sac sieu nhanh', 3, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (15, 1, N'Dùng những ngày đầu khá mượt nhưng sau gần 1 tháng thì nhiều lỗi bh bật màn hình còn phải chờ 1s hơn để mở bán phím ấn phần biểu tượng cảm xúc đơ nhé mn', 3, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (16, 2, N'Sản phẩm tạm ổn, pin tạm ổn, sạc nhanh 45ph đầy, font chữ một số nơi bị lỗi vd danh bạ, bong bóng chát hình vuông bo tròn góc chứ k phải hình tròn, nhận thông báo có độ trễ. Nói chung hàng tạm ổn', 4, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (17, 3, N'Cấu hình quá tốt trong tầm giá, chính sách hậu mãi tốt, sẽ ủng hộ shop', 4, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (18, 4, N'Mua hôm trước hôm sau giảm 500k :))) nhưng cảm nhận đt Sài mượt sạc pin nhanh không bị nóng máy', 4, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (19, 5, N'Mua được em này đúng dịp giảm giá và nhiều khuyễn mãi, thích ghê.', 4, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (20, 6, N'chip xử lý đời mới khá nhanh nên cho tốc độ chơi game hay công việc ko cần chờ đợi lâu', 5, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (21, 7, N'May sài ngon, chụp đẹp man hinh sáng, khuyên mn nên mua nha', 5, '2022/05/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (22, 7, N'máy có khả năng thu sáng xuất sắc, hình ảnh rõ nét', 5, '2022/05/13', NULL)
GO
/*Tháng 6/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (23, 6, N'May sài ngon, chụp đẹp man hinh sáng, khuyên mn nên mua nha', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (24, 5, N'dùng mượt, chơi game ổn định không lag. Máy ảnh chụp đẹp.', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (25, 4, N'Khá ổn so với số tiền bỏ ra, hiệu năng tốt màn hình đẹp', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (26, 3, N'Sản phẩm tuyệt vời', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (27, 2, N'Tuyệt vời', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (28, 1, N'Tiền nào của nấy, nhưng với giá này thì dth như vậy mình cảm thấy rất ổn. Phù hợp với các bạn sinh viên và người lớn tuổi có nhu cần đơn giản mà giá nhẹ nhàng', 4, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (1, 1, N'Mới mua máy màu đen rất đẹp, loa nghe to. Pin sử dụng đc lâu mới hết. Khung viền vuông rất đẹp. Bắt sóng wifi tốt và xa.', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (2, 2, N'camera 50MP chụp đêm ấn tượng và hiệu năng vượt trội các đối thủ cùng tầm giá.', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (3, 3, N'Đang dùng ip chuyển qua đt này hơi hụt hẫng xíu nhưng đc cái pin trâu giao diện đẹp giao hàng đóng gói cẩn thận máy mới chưa thấy lỗi gì, tốt', 5, '2022/06/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (4, 4, N'Thiết kế đẹp chắc chắn, hình ảnh tố, loa cũng to', 5, '2022/06/13', NULL)
GO
/*Tháng 7/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (5, 3, N'Làm ăn vớ vẩn, thông tin khác hàng k được bảo mật, từ hôm qua mới mua máy mà toàn cty tài chính k tên tuổi gọi làm phiền', 1, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (6, 2, N'Mở khóa nhưng không sáng màn hình. Đã mua ở FPT mới được có một tháng rất thất vọng', 1, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (7, 1, N'Máy sài tốt, camera sau khá ấn tượng, màn hình dễ nhìn, loa không hay lắm, camera trước bình thường', 4, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (8, 2, N'Shop bán hàng chất lượng, nhiều khuyến mãi, nhân viên chi nhánh ngọc hồi hỗ trợ mình rất nhiệt tình.', 4, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (9, 3, N'Giao hàng tại nhà cũng được nhân viên hướng dẫn nhiệt tình là ưng lắm nha.', 4, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (10, 4, N'Cầm cái thẻ ngân hàng cấp ra quẹt cái là nhận máy rồi nhân viên hỗ trợ chuyển đổi sang trả góp, tính ra mỗi tháng đóng có 1 chút, khá là hợp lý', 3, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (11, 5, N'Cấu hình quá ngon trong tầm giá, trải nghiệm hoàn toàn hài lòng', 5, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (12, 6, N'Tất cả đều ổn,trừ bin và cam trước Bin hao nhanh mặc dù mình chỉ dùng tác vụ thông thường Cam trước siêu tối, chụp xấu dã man.thua xa con máy cùng 13mp trước của mình', 3, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (13, 7, N'Mọi thứ khá mượt, chơi game fps cao thi hơi lag và mess thì hay bị "đang chờ kết nối". Đã thử xóa đi tải lại nhiều lần nhưng vẫn khó không khắc phục đc', 3, '2022/07/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (14, 1, N'Bên mik có giảm giá cho học sinh k ạ !', 5, '2022/07/13', NULL)
GO
/*Tháng 8/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (15, 2, N'Mới dùng thì ổn, sau khoảng 2 tuần thì hơi lag, dần dần thì cũng ổn, tạm tạm', 3, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (16, 3, N'Máy dùng lướt web, xem phim sẽ ổn, chơi game thì giật lag khá nhiều, ai muốn chơi game nên cân nhắc nhé', 3, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (17, 4, N'Điện thoại giá rẻ, hiệu năng khá ổn, không đòi hỏi quá nhiều đc', 3, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (18, 5, N'Nhanh ghê. Nhân viên tư vấn rất nhiệt tình. Nên mua m.n ạ', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (19, 6, N'Vừa mới mua ở cửa hàng fpt bạn nhân viên tư vấn rất tuyệt, nhanh nhẹn. Sản phẩm màu mình rất thích phù hợp với mệnh.', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (20, 7, N'Máy mượt . Dùng rất thích . Chụp ảnh phê khỏi nói , mình ưng nhất khoản sạc nhanh và chụp ảnh .', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (21, 6, N'Máy rất mượt sạc rất nhanh nói chung dùng rất ok t sẽ giới thiệu cho người thân', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (22, 5, N'Đã mua. Dùng rất ok nha. Không nóng máy.', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (23, 4, N'Sản phẩm rất đẹp , sạc pin siêu nhanhh tần số quyét mượt mà', 5, '2022/08/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (24, 3, N'Rất hài lòng với chất lượng của sản phẩm và dịch vụ hỗ trợ của chi nhánh 489 huỳnh tấn phát', 5, '2022/08/13', NULL)
GO
/*Tháng 9/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (25, 2, N'chính sách mua hàng trả góp cực ok', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (26, 1, N'bảo mật tốt bằng nhận diện khuôn mặt', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (27, 2, N'sản phẩm ổn, ưng ý', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (1, 3, N'Hiệu năng tuyệt vời - đỡ nóng hơn máy cũ của mình. Nhưng pin hơi yếu, ko đủ cho 1 ngày làm việc', 3, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (2, 4, N'Sản phẩm rất tốt tôi đã dùng và rất thích. Sử dụng mượt mà, lượng pin ok mọi người nên mua. Nhược điểm máy cầm hơi nặng tay cho phái nữ', 4, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (3, 5, N'Máy thiết kế rất sang trọng, màn hình đẹp, loa nghe tuyệt vời, pin thì tạm ổn thôi', 4, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (4, 6, N'Máy như 1 chiếc tablet thu nhỏ tuy nhiên cực kì nhỏ gọn, hiệu năng tốt các ứng dụng tương thích tốt', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (5, 7, N'trải nghiệm thực sự quá hoàn hảo ở một thiết bị di động nhỏ gọn.', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (6, 6, N'Thật sứng đáng đồng tiền bỏ ra mua con này sài quá ok với lại nhân viên nhiệt tình và thân thiện cho 10 sao luôn', 5, '2022/09/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (7, 5, N'Bạn còn có thể thử tài đạo diễn nhờ khả năng quay video lấy nét chính xác, quay chuyển động nhanh hay cả quay video timelapse đầy lôi cuốn với những ánh đèn lung linh trong đêm tối.', 5, '2022/09/13', NULL)
GO
/*Tháng 10/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (8, 4, N'camera trước ẩn dưới màn hình, tạo nên những hình ảnh tuyệt đẹp không điểm khuyết', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (9, 3, N'Hài lòng với chất lượng sản phẩm và dịch vụ của chi nhánh 271 quang trung', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (10, 2, N'Màn hình ngoài cho phép bạn sử dụng điện thoại tiện lợi hơn, trong những trường hợp cần thao tác nhanh bằng một tay mà không cần phải mở màn hình lớn.', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (11, 1, N'Máy có màn hình lớn, chơi game rất đã', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (12, 2, N'Gập mở linh hoạt, màn hình lớn hơn nhưng lại nhỏ gọn hơn, tuyệt vời', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (13, 3, N'Sử dụng 6 ngày thấy xứng đáng là điện thoại tốt trong tầm giá', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (14, 4, N'Sản phẩm rất tuyệt vời tôi sẽ giới thiệu cho người thân.lần sau tôi sẽ lại ghé mua', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (15, 5, N'máy nhỏ gọn, tiện lợi, màn hình tuyệt đẹp, gập mở nhanh gọn', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (16, 6, N'Máy có sạc nhanh, cấu hình ổn để chơi game, pin ở mức khá thôi, nhưng bù lại có sạc nhanh nên cũng ok', 5, '2022/10/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (17, 7, N'Mình mua tặng mẹ không được dùng trực tiếp nên không ddasnhs giá cụ thể sản phẩm được, còn các bạn FPTShop thì rất nhiệt tình rồi', 5, '2022/10/13', NULL)
GO
/*Tháng 11/2022*/
INSERT INTO [dbo].[ProductReview] VALUES (18, 6, N'Điện thoại có camera xịn xò, chụp ảnh hay quay video đều đẹp', 5, '2022/11/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (19, 5, N'Máy thiết kế trẻ trung, màu sắc mới lạ và chạy đa nhiệm mượt khỏi bàn luôn.', 5, '2022/11/13', NULL)
GO
INSERT INTO [dbo].[ProductReview] VALUES (20, 4, N'Quá tốt trong tầm giá cận cao cấp, hiệu năng ổn phù hợp cho các nhu cầu nặng như chơi game quay video độ phân giải lớn. Rất tốt', 5, '2022/11/13', NULL)
GO

/* ===================================== END ===================================== */



/* ================================ Insert Order  =============================== */
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 2, 1, 27490000, 0, N'Hồng', N'Nhung', N'Việt Nam', N'Hà Nội', '03334349407', N'Order 1', '2022/01/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (1, 1, 27490000, 0, 1, 'Xanh')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 115980000, 0, N'Hồng', N'Nhung', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 2', '2022/01/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (2, 9, 57990000, 0, 2, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 57990000, 0, N'Hồng', N'Nhung', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 3', '2022/01/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (3, 7, 57990000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 57990000, 0, N'Hồng', N'Nhung', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 4', '2022/01/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (4, 9, 57990000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 38490000, 0, N'Hồng', N'Nhung', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 5', '2022/01/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (5, 4, 38490000, 0, 1, 'Xám')
GO
/**/

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 28999000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 6', '2022/02/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (6, 13, 28999000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 3990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 7', '2022/02/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (7, 20, 3990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (1, 1, 1, 1, 17990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 8', '2022/02/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (8, 25, 17990000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (1, 1, 1, 1, 37990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 9', '2022/02/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (9, 17, 37990000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (1, 1, 1, 1, 21990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 10', '2022/02/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (10, 2, 21990000, 0, 1, 'Xám')
GO

/**/

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (1, 1, 1, 1, 24490000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 11', '2022/03/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (11, 5, 24490000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 34990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 12', '2022/03/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (12, 8, 34990000, 0, 1, 'Xám')
GO

INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (1, 1, 1, 1, 11990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 13', '2022/03/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (13, 19, 11990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 34980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 14', '2022/03/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (14, 23, 17490000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 35980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 15', '2022/03/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (15, 25, 17990000, 0, 2, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 41980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 16', '2022/04/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (16, 21, 20990000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 26990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 17', '2022/04/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (17, 6, 26990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 35990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 18', '2022/04/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (18, 12, 35990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 28999000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 19', '2022/04/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (19, 13, 28999000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 139980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 20', '2022/04/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (20, 10, 69990000, 0, 2, 'Xám')
GO

/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 13390000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 21', '2022/05/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (21, 28, 13390000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 19980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 22', '2022/05/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (22, 24, 9990000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 19999000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 23', '2022/05/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (23, 14, 19999000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 28999000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 24', '2022/05/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (24, 13, 28999000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 709900000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 25', '2022/05/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (25, 26, 19590000, 0, 1, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 8790000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 26', '2022/06/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (26, 15, 8790000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 26780000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 27', '2022/06/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (27, 16, 13390000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 30990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 28', '2022/06/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (28, 7, 30990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 115980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 29', '2022/06/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (29, 9, 57990000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 9990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 30', '2022/06/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (30, 24, 9990000, 0, 1, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 17490000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 31', '2022/07/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (31, 23, 17490000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 28999000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 32', '2022/07/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (32, 23, 28999000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 3990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 33', '2022/07/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (33, 20, 3990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 10990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 34', '2022/07/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (34, 27, 10990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 23980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 35', '2022/07/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (35, 19, 11990000, 0, 2, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 23980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 36', '2022/08/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (36, 19, 11990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 26990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 37', '2022/08/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (37, 6, 26990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 101970000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 38', '2022/08/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (38, 3, 33990000, 0, 3, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 38490000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 39', '2022/08/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (39, 4, 38490000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 20990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 40', '2022/08/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (40, 21, 20990000, 0, 1, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 20990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 41', '2022/09/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (41, 21, 20990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 20990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 42', '2022/09/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (42, 21, 20990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 69980000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 43', '2022/09/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (43, 8, 34990000, 0, 2, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 34990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 44', '2022/09/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (44, 8, 34990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 13390000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 45', '2022/09/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (45, 16, 13390000, 0, 1, 'Xám')
GO
/**/
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 13390000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 46', '2022/10/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (46, 16, 13390000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 13390000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 47', '2022/10/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (47, 28, 13390000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 17990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 48', '2022/10/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (48, 25, 17990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 1, 30990000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 49', '2022/10/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (49, 22, 30990000, 0, 1, 'Xám')
GO
INSERT INTO [dbo].[Orders]
           ([accountID], [paymentMethodID], [companyShipID], [status], [totalMoney], [orderDiscount], [firstName], [lastName]
           ,[country], [address], [phone], [orderNote], [orderCreatedAt], [orderUpdateAt])
     VALUES
           (2, 1, 1, 0, 24490000, 0, N'Phan', N'Hiếu', N'Việt Nam', N'Hà Nội', '0838456798', N'Order 50', '2022/10/13', null)
GO
INSERT INTO [dbo].[OrderLines]
           ([orderID], [productID], [unitPrice], [discount], [quantity], [color])
     VALUES
           (50, 5, 24490000, 0, 1, 'Xám')
GO

/* ===================================== END ===================================== */



