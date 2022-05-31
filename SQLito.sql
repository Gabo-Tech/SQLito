--Crea un diagrama utilizando MySQL Workbench de una base de datos de un e-commerce (tienda online) con las siguientes tablas:
--Tabla Users
--Tabla Products
--Tabla Orders
--Tabla Categories
--Debe mostrar los tipos de relaciones entre cada tabla. *Recuerda que en el caso de una relación muchos a muchos necesitarás una tabla intermedia.
--Hecho con Workbench so...
use myFirstDB;

CREATE TABLE Customers(
Address VARCHAR(50), 
City VARCHAR(50), 
Customer_Email VARCHAR(50), 
Customer_Id INT AUTO_INCREMENT, 
First_Name VARCHAR(50), 
Last_Name VARCHAR(50), 
Password VARCHAR(50), 
Phone INT, 
PostCode INT,
PRIMARY KEY(Customer_Id)
);

CREATE TABLE Orders(
Order_Id INT AUTO_INCREMENT, 
Product_Id, 
Product_Qty,
fecha date,
Customer_Id INT,
PRIMARY KEY(Order_Id),
FOREIGN KEY(Customer_Id) REFERENCES Customers(id)
);

CREATE TABLE Products(
Product_Id INT AUTO_INCREMENT, 
Product_Name VARCHAR(50), 
Product_Description VARCHAR(500), 
Price, 
Stock, 
Category_Id,
PRIMARY KEY(Product_Id)
);

CREATE TABLE Categories(
Category_Id INT AUTO_INCREMENT,
CategoryName VARCHAR(50),
Category_Description VARCHAR(50),
PRIMARY KEY(Category_Id)
);

CREATE TABLE Productoscategorias(
id INT AUTO_INCREMENT,
Product_Id INT,
Category_Id INT,
PRIMARY KEY(id),
FOREIGN KEY(Product_Id) REFERENCES Products(Product_Id) ON DELETE CASCADE,
FOREIGN KEY(Category_Id) REFERENCES Categories(Category_Id)
);


--Inserte al menos 5 nuevos usuarios.
insert into Users (Address, City, Customer_Email, Customer_Id, First_Name, Last_Name, Password, Phone, PostCode) values ("Dirección1","Ciudad1","email1","1","Pepito","Sqlito","contraseña1","646858274","46470");
insert into Users (Address, City, Customer_Email, First_Name, Last_Name, Password, Phone, PostCode) values ("Dirección2","Ciudad2","email2","Pepito2","Sqlito2","contraseña2","646858272","46472");
insert into Users (Address, City, Customer_Email, First_Name, Last_Name, Password, Phone, PostCode) values ("Dirección3","Ciudad3","email3","Pepito3","Sqlito3","contraseña3","646858273","46473");
insert into Users (Address, City, Customer_Email, First_Name, Last_Name, Password, Phone, PostCode) values ("Dirección4","Ciudad4","email4","Pepito4","Sqlito4","contraseña4","646858274","46474");
insert into Users (Address, City, Customer_Email, First_Name, Last_Name, Password, Phone, PostCode) values ("Dirección5","Ciudad5","email5","Pepito5","Sqlito5","contraseña5","646858275","46475");
--Inserte al menos 2 tipos de categorías.
insert into Categories (Category_Id, CategoryName, Category_Description) values ("1", "Category1", "This is the first category");
insert into Categories (Category_Id, CategoryName, Category_Description) values ("2", "Category2", "This is the second category");
--Inserte al menos 5 nuevos productos.
insert into Products (Product_Id, Product_Name, Product_Description, Price, Stock, Category_Id) values ("1","Gafas","son unas simples gafas, no hay descripción.","5","10000","1");
insert into Products (Product_Name, Product_Description, Price, Stock, Category_Id) values ("Gafas1","1son unas simples gafas, no hay descripción.","15","10000","1");
insert into Products (Product_Name, Product_Description, Price, Stock, Category_Id) values ("Gafas2","2son unas simples gafas, no hay descripción.","150","10000","1");
insert into Products (Product_Name, Product_Description, Price, Stock, Category_Id) values ("Teclados","teclado pc","15","10000","2");
insert into Products (Product_Name, Product_Description, Price, Stock, Category_Id) values ("Teclados1","Piano","1500","10000","2");
--Inserte al menos 5 nuevos pedidos(orders).
insert into Orders (Order_Id, Product_Id, Product_Qty) values ("1","1","2");
insert into Orders (Product_Id, Product_Qty) values ("3","2");
insert into Orders (Product_Id, Product_Qty) values ("4","1");
insert into Orders (Product_Id, Product_Qty) values ("2","3");
insert into Orders (Product_Id, Product_Qty) values ("5","5");
--Cambiar el nombre de un producto. Para ello, genera una consulta que afecte solo a un determinado producto en función de su id.
update Products set Product_Name="Monopatín" where Product_Id="1";
--Cambiar el precio de un producto a 50€. Para ello, genera una consulta que afecte solo a un determinado producto en función de su  id.
update Products set Price="50" where Product_Id="1";
--Seleccione todos los productos con un precio superior a 20€.
select * from Products where Price>"20";
--Muestre de forma descendente los productos.
select* from Products where id desc;
--Seleccione todos los productos y que muestre la categoría a la que pertenecen.
SELECT Product_Name, CategoryName FROM Productoscategorias 
INNER JOIN Categories ON Category_Id = Productoscategorias.Category_Id
INNER JOIN Products ON Product_Id = Productoscategorias.Product_Id;

--Seleccione todos los usuarios y muestre sus pedidos.
SELECT * FROM Users INNER JOIN Orders ON users.id = Orders.user_id;

--Selecciona un producto por su id y que muestre la categoría a la que pertenece.
SELECT Product_Name, CategoryName FROM Productoscategorias 
INNER JOIN Categories ON categories.id = Productoscategorias.Category_Id
INNER JOIN Products ON Product_Id = Productoscategorias.Product_Id
WHERE Product_Id = 1;

--Seleccione a un usuario por su id y muestre los pedidos que tiene.
SELECT * FROM Users INNER JOIN Orders ON Customer_Id = Orders.user_id WHERE Customer_Id = 1;
