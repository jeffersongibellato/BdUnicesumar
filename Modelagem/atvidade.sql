CREATE DATABASE bookstore;

USE bookstore;

CREATE TABLE Suppliers(
 idSup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
 name VARCHAR(255) NOT NULL,  
 contact VARCHAR(14) NOT NULL,  
 cnpj VARCHAR(18) NOT NULL  
) engine = myisam; 

CREATE TABLE Books (
 idBook INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idSup INT NOT NULL,
 title VARCHAR(255) NOT NULL,  
 author VARCHAR(255) NOT NULL,  
 price DECIMAL(15,2) NOT NULL,  
 qtdEst INT NOT NULL, 
 FOREIGN KEY(idSup) REFERENCES Suppliers(idSup)
) engine = myisam;

CREATE TABLE Sales(
 idSale INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 idBooks INT NOT NULL,
 customer VARCHAR(255) NOT NULL,  
 dateSale DATE NOT NULL,  
 books INT NOT NULL,  
 totalSale DECIMAL(15,2) NOT NULL,
 FOREIGN KEY(idBooks) REFERENCES Books(idBook)
) engine = myisam; 

CREATE TABLE Customers(
 idCustomers INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 idSales INT NOT NULL,
 name VARCHAR(255) NOT NULL,  
 mail VARCHAR(150) NOT NULL,  
 phone VARCHAR(20) NOT NULL,
 FOREIGN KEY(idSale) REFERENCES Sales(idSale)
) engine = myisam; 

INSERT INTO Suppliers(name, cnpj, contact) VALUES ('Jefferson','123400012102','449917809');

INSERT INTO Books(idSup, title, author, price, qtdEst) VALUES (1,'As Flores do Mal','Charles Baudelaire', 1400.10, 1);

INSERT INTO Sales(idBook, customer, dateSale, books, total) VALUES (1,'Leonardo','2050/09/30', 1, 1400.10);

INSERT INTO Customers(idSale, name, phone, mail) VALUES (1,'Leonardo','43991892112', 'leonardoprofessor@gmail.com');