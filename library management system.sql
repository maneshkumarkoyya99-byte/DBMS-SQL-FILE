DROP DATABASE IF EXISTS library_management_system;
CREATE DATABASE library_management_system;
USE library_management_system;


CREATE TABLE Author(
    Author_Id VARCHAR(12) PRIMARY KEY,
    Author_Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Country VARCHAR(30)
);

CREATE TABLE Publisher(
    Publisher_Id VARCHAR(12) PRIMARY KEY,
    Publisher_Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(150),
    City VARCHAR(50),
    Country VARCHAR(50),
    Website VARCHAR(100)
);

CREATE TABLE Category(
    Category_Id VARCHAR(12) PRIMARY KEY,
    Category_Name VARCHAR(50) UNIQUE,
    Description VARCHAR(200),
    Age_Group VARCHAR(30),
    Status VARCHAR(20) DEFAULT 'Active'
);


CREATE TABLE Student(
    Roll_No VARCHAR(20) PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Course VARCHAR(30),
    Department VARCHAR(50),
    `Year` TINYINT UNSIGNED,
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Member_Type ENUM('Silver') NOT NULL DEFAULT 'Silver',
    Join_Date DATE
);

CREATE TABLE Faculty(
    Faculty_Id VARCHAR(12) PRIMARY KEY,
    Employee_No VARCHAR(20) UNIQUE,
    Full_Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Join_Date DATE,
    Member_Type ENUM('Gold') NOT NULL DEFAULT 'Gold'
);

CREATE TABLE Librarian(
    Librarian_Id VARCHAR(12) PRIMARY KEY,
    Lib_Name VARCHAR(100),
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Shift VARCHAR(30),
    Salary BIGINT
);

CREATE TABLE Books(
    Book_Id VARCHAR(12) PRIMARY KEY,
    ISBN BIGINT UNIQUE,
    Book_Title VARCHAR(100),
    Course VARCHAR(30) DEFAULT 'General',
    Author_Id VARCHAR(12),
    Category_Id VARCHAR(12),
    Publisher_Id VARCHAR(12),
    Price DECIMAL(8,2),
    Language VARCHAR(30),
    Publication_Year YEAR,
    Description VARCHAR(300),
    FOREIGN KEY (Author_Id) REFERENCES Author(Author_Id),
    FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id),
    FOREIGN KEY (Publisher_Id) REFERENCES Publisher(Publisher_Id)
);

CREATE TABLE Availability(
    Availability_Id VARCHAR(12) PRIMARY KEY,
    Book_Id VARCHAR(12) UNIQUE,
    Total_Copies INT,
    Available_Copies INT,
    Issued_Copies INT,
    Lost_Copies INT,
    Damaged_Copies INT,
    Status VARCHAR(20),
    FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id)
);

CREATE TABLE issue(
    Issue_Id VARCHAR(12) PRIMARY KEY,
    Book_Id VARCHAR(12),
    Roll_No VARCHAR(20) NULL,
    Faculty_Id VARCHAR(12) NULL,
    Librarian_Id VARCHAR(12),
    Issue_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    Fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (Roll_No) REFERENCES Student(Roll_No),
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Faculty_Id),
    FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id),
    FOREIGN KEY (Librarian_Id) REFERENCES Librarian(Librarian_Id),
    CHECK ((Roll_No IS NOT NULL AND Faculty_Id IS NULL) OR (Roll_No IS NULL AND Faculty_Id IS NOT NULL))
);

CREATE TABLE Reservation(
    Reservation_Id VARCHAR(12) PRIMARY KEY,
    Book_Id VARCHAR(12),
    Roll_No VARCHAR(20) NULL,
    Faculty_Id VARCHAR(12) NULL,
    Reservation_Date DATE,
    Expiry_Date DATE,
    Status VARCHAR(20),
    Priority INT,
    Remarks VARCHAR(200),
    FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id),
    FOREIGN KEY (Roll_No) REFERENCES Student(Roll_No),
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Faculty_Id),
    CHECK ((Roll_No IS NOT NULL AND Faculty_Id IS NULL) OR (Roll_No IS NULL AND Faculty_Id IS NOT NULL))
);


INSERT INTO Author (Author_Id, Author_Name, Email, Phone, Country) VALUES
('A201803S01', 'Aarav Sharma', 'aaravsharma@gmail.com', '+919000000001', 'India'),
('A202107R01', 'Ananya Reddy', 'ananyareddy@gmail.com', '+919000000002', 'India'),
('A201711R01', 'Arjun Rao', 'arjunrao@gmail.com', '+919000000003', 'India'),
('A202302P01', 'Meera Patel', 'meerapatel@gmail.com', '+919000000004', 'India'),
('A201909K01', 'Rohan Kumar', 'rohankumar@gmail.com', '+919000000005', 'India'),
('A201604S01', 'Priya Singh', 'priyasingh@gmail.com', '+919000000006', 'India'),
('A202401V01', 'Vikram Verma', 'vikramverma@gmail.com', '+919000000007', 'India'),
('A202006I01', 'Neha Iyer', 'nehaiyer@gmail.com', '+919000000008', 'India'),
('A201510N01', 'Rahul Nair', 'rahulnair@gmail.com', '+919000000009', 'India'),
('A202212G01', 'Kavya Gupta', 'kavyagupta@gmail.com', '+919000000010', 'India'),
('A201808M01', 'Aditya Mehta', 'adityamehta@gmail.com', '+919000000011', 'India'),
('A202101J01', 'Sneha Joshi', 'snehajoshi@gmail.com', '+919000000012', 'India'),
('A201405M01', 'Kiran Mishra', 'kiranmishra@gmail.com', '+919000000013', 'India'),
('A202310K01', 'Ishita Kapoor', 'ishitakapoor@gmail.com', '+919000000014', 'India'),
('A201903B01', 'Varun Bose', 'varunbose@gmail.com', '+919000000015', 'India'),
('A201712M01', 'Pooja Menon', 'poojamenon@gmail.com', '+919000000016', 'India'),
('A202502N01', 'Nikhil Naidu', 'nikhilnaidu@gmail.com', '+919000000017', 'India'),
('A202011S01', 'Divya Shah', 'divyashah@gmail.com', '+919000000018', 'India'),
('A201607P01', 'Sanjay Pillai', 'sanjaypillai@gmail.com', '+919000000019', 'India'),
('A202205K01', 'Aisha Khan', 'aishakhan@gmail.com', '+919000000020', 'India'),
('A201810M01', 'Vivek Malhotra', 'vivekmalhotra@gmail.com', '+919000000021', 'India'),
('A202109D01', 'Shreya Das', 'shreyadas@gmail.com', '+919000000022', 'India'),
('A201502C01', 'Rakesh Chandra', 'rakeshchandra@gmail.com', '+919000000023', 'India'),
('A202406R01', 'Nandini Rao', 'nandinirao@gmail.com', '+919000000024', 'India'),
('A201911B01', 'Suresh Babu', 'sureshbabu@gmail.com', '+919000000025', 'India'),
('A201704K01', 'Anjali Krishnan', 'anjalikrishnan@gmail.com', '+919000000026', 'India'),
('A202308P01', 'Manoj Prasad', 'manojprasad@gmail.com', '+919000000027', 'India'),
('A202003D01', 'Lakshmi Devi', 'lakshmidevi@gmail.com', '+919000000028', 'India'),
('A201612R01', 'Harish Reddy', 'harishreddy@gmail.com', '+919000000029', 'India'),
('A202208A01', 'Swati Agarwal', 'swatiagarwal@gmail.com', '+919000000030', 'India'),
('A201805C01', 'Daniel Carter', 'danielcarter@gmail.com', '+12025550131', 'USA'),
('A202111J01', 'Emily Johnson', 'emilyjohnson@gmail.com', '+12025550132', 'USA'),
('A201506B01', 'Michael Brown', 'michaelbrown@gmail.com', '+12025550133', 'USA'),
('A202409W01', 'Sophia Wilson', 'sophiawilson@gmail.com', '+12025550134', 'USA'),
('A201901M01', 'James Miller', 'jamesmiller@gmail.com', '+12025550135', 'USA'),
('A201708D01', 'Olivia Davis', 'oliviadavis@gmail.com', '+12025550136', 'USA'),
('A202304T01', 'William Taylor', 'williamtaylor@gmail.com', '+12025550137', 'USA'),
('A202009A01', 'Grace Anderson', 'graceanderson@gmail.com', '+12025550138', 'USA'),
('A201603T01', 'Henry Thomas', 'henrythomas@gmail.com', '+12025550139', 'USA'),
('A202505M01', 'Emma Martin', 'emmamartin@gmail.com', '+12025550140', 'USA');
INSERT INTO Publisher (Publisher_Id, Publisher_Name, Email, Phone, Address, City, Country, Website) VALUES
('P201202P01', 'Penguin Books', 'penguinbooks@gmail.com', '+919100000001', '1 Library Road', 'Delhi', 'India', 'www.penguinbookspublisher.com'),
('P201806H01', 'HarperCollins', 'harpercollins@gmail.com', '+919100000002', '2 Library Road', 'Mumbai', 'India', 'www.harpercollinspublisher.com'),
('P201511O01', 'Oxford University Press', 'oxforduniversitypress@gmail.com', '+919100000003', '3 Library Road', 'Bengaluru', 'India', 'www.oxforduniversitypresspublisher.com'),
('P202001P01', 'Pearson Education', 'pearsoneducation@gmail.com', '+919100000004', '4 Library Road', 'Hyderabad', 'India', 'www.pearsoneducationpublisher.com'),
('P201707M01', 'McGraw Hill', 'mcgrawhill@gmail.com', '+919100000005', '5 Library Road', 'Chennai', 'India', 'www.mcgrawhillpublisher.com'),
('P202303S01', 'Springer Nature', 'springernature@gmail.com', '+919100000006', '6 Library Road', 'Pune', 'India', 'www.springernaturepublisher.com'),
('P201910W01', 'Wiley', 'wiley@gmail.com', '+919100000007', '7 Library Road', 'Kolkata', 'India', 'www.wileypublisher.com'),
('P201404R01', 'Routledge', 'routledge@gmail.com', '+919100000008', '8 Library Road', 'Jaipur', 'India', 'www.routledgepublisher.com'),
('P202112C01', 'Cambridge University Press', 'cambridgeuniversitypress@gmail.com', '+919100000009', '9 Library Road', 'Kochi', 'India', 'www.cambridgeuniversitypresspublisher.com'),
('P201608B01', 'Bloomsbury Publishing', 'bloomsburypublishing@gmail.com', '+919100000010', '10 Library Road', 'Ahmedabad', 'India', 'www.bloomsburypublishingpublisher.com'),
('P202402S01', 'Sage Publications', 'sagepublications@gmail.com', '+919100000011', '11 Library Road', 'Delhi', 'India', 'www.sagepublicationspublisher.com'),
('P201309E01', 'Elsevier', 'elsevier@gmail.com', '+919100000012', '12 Library Road', 'Mumbai', 'India', 'www.elsevierpublisher.com'),
('P201801O01', 'O''Reilly Media', 'oreillymedia@gmail.com', '+919100000013', '13 Library Road', 'Bengaluru', 'India', 'www.oreillymediapublisher.com'),
('P202205C01', 'Cengage', 'cengage@gmail.com', '+919100000014', '14 Library Road', 'Hyderabad', 'India', 'www.cengagepublisher.com'),
('P201506R01', 'Random House', 'randomhouse@gmail.com', '+919100000015', '15 Library Road', 'Chennai', 'India', 'www.randomhousepublisher.com'),
('P202011M01', 'Macmillan Publishers', 'macmillanpublishers@gmail.com', '+919100000016', '16 Library Road', 'Pune', 'India', 'www.macmillanpublisherspublisher.com'),
('P201703S01', 'Simon & Schuster', 'simonschuster@gmail.com', '+919100000017', '17 Library Road', 'Kolkata', 'India', 'www.simonschusterpublisher.com'),
('P202308H01', 'Hachette Book Group', 'hachettebookgroup@gmail.com', '+919100000018', '18 Library Road', 'Jaipur', 'India', 'www.hachettebookgrouppublisher.com'),
('P201912S01', 'Scholastic', 'scholastic@gmail.com', '+919100000019', '19 Library Road', 'Kochi', 'India', 'www.scholasticpublisher.com'),
('P202407V01', 'Vintage Books', 'vintagebooks@gmail.com', '+919100000020', '20 Library Road', 'Ahmedabad', 'India', 'www.vintagebookspublisher.com');
INSERT INTO Category (Category_Id, Category_Name, Description, Age_Group, Status) VALUES
('CT001', 'Thriller', 'Suspense and thriller books', '18+', 'Active'),
('CL001', 'Love', 'Romance and love stories', '13+', 'Active'),
('CC001', 'Computer Science', 'Books related to computing', '18+', 'Active'),
('CD001', 'Database', 'Database and data management books', '18+', 'Active'),
('CA001', 'Artificial Intelligence', 'AI and intelligent systems', '18+', 'Active'),
('CM001', 'Mathematics', 'Mathematics and problem solving', '13+', 'Active'),
('CP001', 'Physics', 'Physics and physical sciences', '13+', 'Active'),
('CL002', 'Literature', 'Classic and modern literature', '13+', 'Active'),
('CH001', 'History', 'History and historical studies', '13+', 'Active'),
('CB001', 'Business', 'Business and management books', '18+', 'Active');
INSERT INTO Student (Roll_No, Full_Name, Course, Department, `Year`, Phone, Email, Member_Type, Join_Date) VALUES
('26BTCSE001','Eswar Yenduri','B.Tech','CSE',1,'+918000000001','eswaryenduri@gmail.com','Silver','2026-06-01'),
('25BTCSE002','Jaya Sasi Kiran','B.Tech','CSE',2,'+918000000002','jayasasikiran@gmail.com','Silver','2025-06-03'),
('24BTAIML003','Kusa Raju','B.Tech','AIML',3,'+918000000003','kusaraju@gmail.com','Silver','2024-06-05'),
('23BTAIML004','Manesh Kumar','B.Tech','AIML',4,'+918000000004','maneshkumar@gmail.com','Silver','2023-07-07'),
('25BTECE005','Rahul Varma','B.Tech','ECE',2,'+918000000005','rahulvarma@gmail.com','Silver','2025-07-09'),
('24BTECE006','Ananya Rao','B.Tech','ECE',3,'+918000000006','ananyarao@gmail.com','Silver','2024-07-11'),
('26BTEEE007','Arjun Reddy','B.Tech','EEE',1,'+918000000007','arjunreddy@gmail.com','Silver','2026-08-13'),
('23BTEEE008','Priya Sharma','B.Tech','EEE',4,'+918000000008','priyasharma@gmail.com','Silver','2023-08-15'),
('26PHPHAR009','Sneha Patel','Pharmacy','Pharm.D',1,'+918000000009','snehapatel@gmail.com','Silver','2026-08-17'),
('25PHBPHA010','Vikram Singh','Pharmacy','B.Pharm',2,'+918000000010','vikramsingh@gmail.com','Silver','2025-08-19'),
('24PHBPHA011','Neha Gupta','Pharmacy','B.Pharm',3,'+918000000011','nehagupta@gmail.com','Silver','2024-06-01'),
('23PHPHAR012','Aditya Kumar','Pharmacy','Pharm.D',4,'+918000000012','adityakumar@gmail.com','Silver','2023-06-03'),
('25PHBPHA013','Kavya Nair','Pharmacy','B.Pharm',2,'+918000000013','kavyanair@gmail.com','Silver','2025-06-05'),
('24PHBPHA014','Rohan Mehta','Pharmacy','B.Pharm',3,'+918000000014','rohanmehta@gmail.com','Silver','2024-07-07'),
('26PHPHAR015','Divya Iyer','Pharmacy','Pharm.D',1,'+918000000015','divyaiyer@gmail.com','Silver','2026-07-09'),
('23PHBPHA016','Nikhil Joshi','Pharmacy','B.Pharm',4,'+918000000016','nikhiljoshi@gmail.com','Silver','2023-07-11'),
('26BABUSI017','Pooja Verma','BBA','Business Administration',1,'+918000000017','poojaverma@gmail.com','Silver','2026-08-13'),
('25BAFINA018','Kiran Reddy','BBA','Finance',2,'+918000000018','kiranreddy@gmail.com','Silver','2025-08-15'),
('24BAMARK019','Ishita Rao','BBA','Marketing',3,'+918000000019','ishitarao@gmail.com','Silver','2024-08-17'),
('23BABUSI020','Varun Shah','BBA','Business Administration',4,'+918000000020','varunshah@gmail.com','Silver','2023-08-19'),
('25BAHUMA021','Anjali Menon','BBA','Human Resources',2,'+918000000021','anjalimenon@gmail.com','Silver','2025-06-01'),
('24BAFINA022','Sanjay Naidu','BBA','Finance',3,'+918000000022','sanjaynaidu@gmail.com','Silver','2024-06-03'),
('26BAMARK023','Meera Krishnan','BBA','Marketing',1,'+918000000023','meerakrishnan@gmail.com','Silver','2026-06-05'),
('23BABUSI024','Vivek Malhotra','BBA','Business Administration',4,'+918000000024','vivekmalhotra@gmail.com','Silver','2023-07-07'),
('26MCCOMP025','Shreya Das','MCA','Computer Applications',1,'+918000000025','shreyadas@gmail.com','Silver','2026-07-09'),
('25MCCOMP026','Rakesh Chandra','MCA','Computer Applications',2,'+918000000026','rakeshchandra@gmail.com','Silver','2025-07-11'),
('24MCDATA027','Nandini Babu','MCA','Data Science',3,'+918000000027','nandinibabu@gmail.com','Silver','2024-08-13'),
('23MCCOMP028','Suresh Prasad','MCA','Computer Applications',4,'+918000000028','sureshprasad@gmail.com','Silver','2023-08-15'),
('25MCDATA029','Lakshmi Devi','MCA','Data Science',2,'+918000000029','lakshmidevi@gmail.com','Silver','2025-08-17'),
('24MCCOMP030','Harish Agarwal','MCA','Computer Applications',3,'+918000000030','harishagarwal@gmail.com','Silver','2024-08-19'),
('26MCCYBE031','Aarav Kapoor','MCA','Cyber Security',1,'+918000000031','aaravkapoor@gmail.com','Silver','2026-06-01'),
('23MCCYBE032','Aisha Khan','MCA','Cyber Security',4,'+918000000032','aishakhan@gmail.com','Silver','2023-06-03'),
('25BTIT033','Daniel Carter','B.Tech','IT',2,'+918000000033','danielcarter@gmail.com','Silver','2025-06-05'),
('24BTIT034','Emily Johnson','B.Tech','IT',3,'+918000000034','emilyjohnson@gmail.com','Silver','2024-07-07'),
('26BTIT035','Michael Brown','B.Tech','IT',1,'+918000000035','michaelbrown@gmail.com','Silver','2026-07-09'),
('23BTAIML036','Sophia Wilson','B.Tech','AIML',4,'+918000000036','sophiawilson@gmail.com','Silver','2023-07-11'),
('25PHBPHA037','James Miller','Pharmacy','B.Pharm',2,'+918000000037','jamesmiller@gmail.com','Silver','2025-08-13'),
('24BAMARK038','Olivia Davis','BBA','Marketing',3,'+918000000038','oliviadavis@gmail.com','Silver','2024-08-15'),
('26MCCOMP039','William Taylor','MCA','Computer Applications',1,'+918000000039','williamtaylor@gmail.com','Silver','2026-08-17'),
('23BTCSE040','Grace Anderson','B.Tech','CSE',4,'+918000000040','graceanderson@gmail.com','Silver','2023-08-19'),
('26BTCSE002','Aadhya Rao','B.Tech','CSE',1,'+918100000041','aadhyarao@gmail.com','Silver','2026-08-18'),
('25BTAIML001','Aarohi Iyer','B.Tech','AIML',2,'+918100000042','aarohiiyer@gmail.com','Silver','2025-06-19'),
('24BTECE007','Abhinav Bose','B.Tech','ECE',3,'+918100000043','abhinavbose@gmail.com','Silver','2024-07-20'),
('23BTEEE009','Adarsh Babu','B.Tech','EEE',4,'+918100000044','adarshbabu@gmail.com','Silver','2023-08-21'),
('26BTIT036','Akash Mohan','B.Tech','IT',1,'+918100000045','akashmohan@gmail.com','Silver','2026-06-22'),
('25BTME001','Akanksha Singh','B.Tech','ME',2,'+918100000046','akankshasingh@gmail.com','Silver','2025-07-23'),
('24BTCE001','Amulya Menon','B.Tech','CE',3,'+918100000047','amulyamenon@gmail.com','Silver','2024-08-24'),
('23PHBPHA017','Anirudh Chowdhury','Pharmacy','B.Pharm',4,'+918100000048','anirudhchowdhury@gmail.com','Silver','2023-06-01'),
('26PHPHAR016','Anusha Deshmukh','Pharmacy','Pharm.D',1,'+918100000049','anushadeshmukh@gmail.com','Silver','2026-07-02'),
('25BABUSI001','Arnav Patel','BBA','Business Administration',2,'+918100000050','arnavpatel@gmail.com','Silver','2025-08-03'),
('24BAFINA023','Aseem Naidu','BBA','Finance',3,'+918100000051','aseemnaidu@gmail.com','Silver','2024-06-04'),
('23BAMARK001','Avinash Agarwal','BBA','Marketing',4,'+918100000052','avinashagarwal@gmail.com','Silver','2023-07-05'),
('26BAHUMA001','Bhavana Gowda','BBA','Human Resources',1,'+918100000053','bhavanagowda@gmail.com','Silver','2026-08-06'),
('25MCCOMP027','Bharath Reddy','MCA','Computer Applications',2,'+918100000054','bharathreddy@gmail.com','Silver','2025-06-07'),
('24MCDATA028','Charan Nair','MCA','Data Science',3,'+918100000055','charannair@gmail.com','Silver','2024-07-08'),
('23MCCYBE033','Chaitanya Mishra','MCA','Cyber Security',4,'+918100000056','chaitanyamishra@gmail.com','Silver','2023-08-09'),
('26BTCSE003','Deepak Chandra','B.Tech','CSE',1,'+918100000057','deepakchandra@gmail.com','Silver','2026-06-10'),
('25BTAIML002','Devika Verma','B.Tech','AIML',2,'+918100000058','devikaverma@gmail.com','Silver','2025-07-11'),
('24BTECE008','Dhanush Gupta','B.Tech','ECE',3,'+918100000059','dhanushgupta@gmail.com','Silver','2024-08-12'),
('23BTEEE010','Divya Das','B.Tech','EEE',4,'+918100000060','divyadas@gmail.com','Silver','2023-06-13'),
('26BTIT037','Eesha Prasad','B.Tech','IT',1,'+918100000061','eeshaprasad@gmail.com','Silver','2026-07-14'),
('25BTME002','Farhan Sahu','B.Tech','ME',2,'+918100000062','farhansahu@gmail.com','Silver','2025-08-15'),
('24BTCE002','Gautham Kumar','B.Tech','CE',3,'+918100000063','gauthamkumar@gmail.com','Silver','2024-06-16'),
('23PHBPHA018','Gayatri Krishna','Pharmacy','B.Pharm',4,'+918100000064','gayatrikrishna@gmail.com','Silver','2023-07-17'),
('26PHPHAR017','Hemanth Joshi','Pharmacy','Pharm.D',1,'+918100000065','hemanthjoshi@gmail.com','Silver','2026-08-18'),
('25BABUSI002','Ishaan Kulkarni','BBA','Business Administration',2,'+918100000066','ishaankulkarni@gmail.com','Silver','2025-06-19'),
('24BAFINA024','Janani Sharma','BBA','Finance',3,'+918100000067','jananisharma@gmail.com','Silver','2024-07-20'),
('23BAMARK002','Karthik Varma','BBA','Marketing',4,'+918100000068','karthikvarma@gmail.com','Silver','2023-08-21'),
('26BAHUMA002','Keerthi Kapoor','BBA','Human Resources',1,'+918100000069','keerthikapoor@gmail.com','Silver','2026-06-22'),
('25MCCOMP028','Krishna Pillai','MCA','Computer Applications',2,'+918100000070','krishnapillai@gmail.com','Silver','2025-07-23'),
('24MCDATA029','Lavanya Rao','MCA','Data Science',3,'+918100000071','lavanyarao@gmail.com','Silver','2024-08-24'),
('23MCCYBE034','Madhav Iyer','MCA','Cyber Security',4,'+918100000072','madhaviyer@gmail.com','Silver','2023-06-01'),
('26BTCSE004','Manasa Bose','B.Tech','CSE',1,'+918100000073','manasabose@gmail.com','Silver','2026-07-02'),
('25BTAIML003','Mansi Babu','B.Tech','AIML',2,'+918100000074','mansibabu@gmail.com','Silver','2025-08-03'),
('24BTECE009','Mokshith Mohan','B.Tech','ECE',3,'+918100000075','mokshithmohan@gmail.com','Silver','2024-06-04'),
('23BTEEE011','Monika Singh','B.Tech','EEE',4,'+918100000076','monikasingh@gmail.com','Silver','2023-07-05'),
('26BTIT038','Naveen Menon','B.Tech','IT',1,'+918100000077','naveenmenon@gmail.com','Silver','2026-08-06'),
('25BTME003','Navya Chowdhury','B.Tech','ME',2,'+918100000078','navyachowdhury@gmail.com','Silver','2025-06-07'),
('24BTCE003','Nikhil Deshmukh','B.Tech','CE',3,'+918100000079','nikhildeshmukh@gmail.com','Silver','2024-07-08'),
('23PHBPHA019','Nitya Patel','Pharmacy','B.Pharm',4,'+918100000080','nityapatel@gmail.com','Silver','2023-08-09'),
('26PHPHAR018','Pallavi Naidu','Pharmacy','Pharm.D',1,'+918100000081','pallavinaidu@gmail.com','Silver','2026-06-10'),
('25BABUSI003','Pranav Agarwal','BBA','Business Administration',2,'+918100000082','pranavagarwal@gmail.com','Silver','2025-07-11'),
('24BAFINA025','Pranitha Gowda','BBA','Finance',3,'+918100000083','pranithagowda@gmail.com','Silver','2024-08-12'),
('23BAMARK003','Raghu Reddy','BBA','Marketing',4,'+918100000084','raghureddy@gmail.com','Silver','2023-06-13'),
('26BAHUMA003','Rashi Nair','BBA','Human Resources',1,'+918100000085','rashinair@gmail.com','Silver','2026-07-14'),
('25MCCOMP029','Rithvik Mishra','MCA','Computer Applications',2,'+918100000086','rithvikmishra@gmail.com','Silver','2025-08-15'),
('24MCDATA030','Riya Chandra','MCA','Data Science',3,'+918100000087','riyachandra@gmail.com','Silver','2024-06-16'),
('23MCCYBE035','Rohit Verma','MCA','Cyber Security',4,'+918100000088','rohitverma@gmail.com','Silver','2023-07-17'),
('26BTCSE005','Sahana Gupta','B.Tech','CSE',1,'+918100000089','sahanagupta@gmail.com','Silver','2026-08-18'),
('25BTAIML004','Sanjana Das','B.Tech','AIML',2,'+918100000090','sanjanadas@gmail.com','Silver','2025-06-19'),
('24BTECE010','Shivani Prasad','B.Tech','ECE',3,'+918100000091','shivaniprasad@gmail.com','Silver','2024-07-20'),
('23BTEEE012','Shreyas Sahu','B.Tech','EEE',4,'+918100000092','shreyassahu@gmail.com','Silver','2023-08-21'),
('26BTIT039','Siddharth Kumar','B.Tech','IT',1,'+918100000093','siddharthkumar@gmail.com','Silver','2026-06-22'),
('25BTME004','Sindhu Krishna','B.Tech','ME',2,'+918100000094','sindhukrishna@gmail.com','Silver','2025-07-23'),
('24BTCE004','Soumya Joshi','B.Tech','CE',3,'+918100000095','soumyajoshi@gmail.com','Silver','2024-08-24'),
('23PHBPHA020','Srinath Kulkarni','Pharmacy','B.Pharm',4,'+918100000096','srinathkulkarni@gmail.com','Silver','2023-06-01'),
('26PHPHAR019','Tanmay Sharma','Pharmacy','Pharm.D',1,'+918100000097','tanmaysharma@gmail.com','Silver','2026-07-02'),
('25BABUSI004','Tejas Varma','BBA','Business Administration',2,'+918100000098','tejasvarma@gmail.com','Silver','2025-08-03'),
('24BAFINA026','Trisha Kapoor','BBA','Finance',3,'+918100000099','trishakapoor@gmail.com','Silver','2024-06-04'),
('23BAMARK004','Uday Pillai','BBA','Marketing',4,'+918100000100','udaypillai@gmail.com','Silver','2023-07-05'),
('26BAHUMA004','Vaishnavi Rao','BBA','Human Resources',1,'+918100000101','vaishnavirao@gmail.com','Silver','2026-08-06'),
('25MCCOMP030','Varsha Iyer','MCA','Computer Applications',2,'+918100000102','varshaiyer@gmail.com','Silver','2025-06-07'),
('24MCDATA031','Vedant Bose','MCA','Data Science',3,'+918100000103','vedantbose@gmail.com','Silver','2024-07-08'),
('23MCCYBE036','Venkatesh Babu','MCA','Cyber Security',4,'+918100000104','venkateshbabu@gmail.com','Silver','2023-08-09'),
('26BTCSE006','Yash Mohan','B.Tech','CSE',1,'+918100000105','yashmohan@gmail.com','Silver','2026-06-10'),
('25BTAIML005','Yamini Singh','B.Tech','AIML',2,'+918100000106','yaminisingh@gmail.com','Silver','2025-07-11'),
('24BTECE011','Zaid Menon','B.Tech','ECE',3,'+918100000107','zaidmenon@gmail.com','Silver','2024-08-12'),
('23BTEEE013','Kiran Chowdhury','B.Tech','EEE',4,'+918100000108','kiranchowdhury@gmail.com','Silver','2023-06-13'),
('26BTIT040','Harsha Deshmukh','B.Tech','IT',1,'+918100000109','harshadeshmukh@gmail.com','Silver','2026-07-14'),
('25BTME005','Pavani Patel','B.Tech','ME',2,'+918100000110','pavanipatel@gmail.com','Silver','2025-08-15'),
('24BTCE005','Manoj Naidu','B.Tech','CE',3,'+918100000111','manojnaidu@gmail.com','Silver','2024-06-16'),
('23PHBPHA021','Meghana Agarwal','Pharmacy','B.Pharm',4,'+918100000112','meghanaagarwal@gmail.com','Silver','2023-07-17'),
('26PHPHAR020','Lokesh Gowda','Pharmacy','Pharm.D',1,'+918100000113','lokeshgowda@gmail.com','Silver','2026-08-18'),
('25BABUSI005','Kalyan Reddy','BBA','Business Administration',2,'+918100000114','kalyanreddy@gmail.com','Silver','2025-06-19'),
('24BAFINA027','Sai Nair','BBA','Finance',3,'+918100000115','sainair@gmail.com','Silver','2024-07-20'),
('23BAMARK005','Harin Mishra','BBA','Marketing',4,'+918100000116','harinmishra@gmail.com','Silver','2023-08-21'),
('26BAHUMA005','Niharika Chandra','BBA','Human Resources',1,'+918100000117','niharikachandra@gmail.com','Silver','2026-06-22'),
('25MCCOMP031','Raviteja Verma','MCA','Computer Applications',2,'+918100000118','ravitejaverma@gmail.com','Silver','2025-07-23'),
('24MCDATA032','Sowmya Gupta','MCA','Data Science',3,'+918100000119','sowmyagupta@gmail.com','Silver','2024-08-24'),
('23MCCYBE037','Prakash Das','MCA','Cyber Security',4,'+918100000120','prakashdas@gmail.com','Silver','2023-06-01'),
('26BTCSE007','Keerthi Prasad','B.Tech','CSE',1,'+918100000121','keerthiprasad@gmail.com','Silver','2026-07-02'),
('25BTAIML006','Rakesh Sahu','B.Tech','AIML',2,'+918100000122','rakeshsahu@gmail.com','Silver','2025-08-03'),
('24BTECE012','Sanjay Kumar','B.Tech','ECE',3,'+918100000123','sanjaykumar@gmail.com','Silver','2024-06-04'),
('23BTEEE014','Shalini Krishna','B.Tech','EEE',4,'+918100000124','shalinikrishna@gmail.com','Silver','2023-07-05'),
('26BTIT041','Varun Joshi','B.Tech','IT',1,'+918100000125','varunjoshi@gmail.com','Silver','2026-08-06'),
('25BTME006','Vasavi Kulkarni','B.Tech','ME',2,'+918100000126','vasavikulkarni@gmail.com','Silver','2025-06-07'),
('24BTCE006','Tejaswi Sharma','B.Tech','CE',3,'+918100000127','tejaswisharma@gmail.com','Silver','2024-07-08'),
('23PHBPHA022','Abhishek Varma','Pharmacy','B.Pharm',4,'+918100000128','abhishekvarma@gmail.com','Silver','2023-08-09'),
('26PHPHAR021','Sushma Kapoor','Pharmacy','Pharm.D',1,'+918100000129','sushmakapoor@gmail.com','Silver','2026-06-10'),
('25BABUSI006','Rohan Pillai','BBA','Business Administration',2,'+918100000130','rohanpillai@gmail.com','Silver','2025-07-11'),
('24BAFINA028','Aadhya Reddy','BBA','Finance',3,'+918100000131','aadhyareddy@gmail.com','Silver','2024-08-12'),
('23BAMARK006','Aarohi Nair','BBA','Marketing',4,'+918100000132','aarohinair@gmail.com','Silver','2023-06-13'),
('26BAHUMA006','Abhinav Mishra','BBA','Human Resources',1,'+918100000133','abhinavmishra@gmail.com','Silver','2026-07-14'),
('25MCCOMP032','Adarsh Chandra','MCA','Computer Applications',2,'+918100000134','adarshchandra@gmail.com','Silver','2025-08-15'),
('24MCDATA033','Akash Verma','MCA','Data Science',3,'+918100000135','akashverma@gmail.com','Silver','2024-06-16'),
('23MCCYBE038','Akanksha Gupta','MCA','Cyber Security',4,'+918100000136','akankshagupta@gmail.com','Silver','2023-07-17'),
('26BTCSE008','Amulya Das','B.Tech','CSE',1,'+918100000137','amulyadas@gmail.com','Silver','2026-08-18'),
('25BTAIML007','Anirudh Prasad','B.Tech','AIML',2,'+918100000138','anirudhprasad@gmail.com','Silver','2025-06-19'),
('24BTECE013','Anusha Sahu','B.Tech','ECE',3,'+918100000139','anushasahu@gmail.com','Silver','2024-07-20'),
('23BTEEE015','Arnav Kumar','B.Tech','EEE',4,'+918100000140','arnavkumar@gmail.com','Silver','2023-08-21'),
('26BTIT042','Aseem Krishna','B.Tech','IT',1,'+918100000141','aseemkrishna@gmail.com','Silver','2026-06-22'),
('25BTME007','Avinash Joshi','B.Tech','ME',2,'+918100000142','avinashjoshi@gmail.com','Silver','2025-07-23'),
('24BTCE007','Bhavana Kulkarni','B.Tech','CE',3,'+918100000143','bhavanakulkarni@gmail.com','Silver','2024-08-24'),
('23PHBPHA023','Bharath Sharma','Pharmacy','B.Pharm',4,'+918100000144','bharathsharma@gmail.com','Silver','2023-06-01'),
('26PHPHAR022','Charan Varma','Pharmacy','Pharm.D',1,'+918100000145','charanvarma@gmail.com','Silver','2026-07-02'),
('25BABUSI007','Chaitanya Kapoor','BBA','Business Administration',2,'+918100000146','chaitanyakapoor@gmail.com','Silver','2025-08-03'),
('24BAFINA029','Deepak Pillai','BBA','Finance',3,'+918100000147','deepakpillai@gmail.com','Silver','2024-06-04'),
('23BAMARK007','Devika Rao','BBA','Marketing',4,'+918100000148','devikarao@gmail.com','Silver','2023-07-05'),
('26BAHUMA007','Dhanush Iyer','BBA','Human Resources',1,'+918100000149','dhanushiyer@gmail.com','Silver','2026-08-06'),
('25MCCOMP033','Divya Bose','MCA','Computer Applications',2,'+918100000150','divyabose@gmail.com','Silver','2025-06-07'),
('24MCDATA034','Eesha Babu','MCA','Data Science',3,'+918100000151','eeshababu@gmail.com','Silver','2024-07-08'),
('23MCCYBE039','Farhan Mohan','MCA','Cyber Security',4,'+918100000152','farhanmohan@gmail.com','Silver','2023-08-09'),
('26BTCSE009','Gautham Singh','B.Tech','CSE',1,'+918100000153','gauthamsingh@gmail.com','Silver','2026-06-10'),
('25BTAIML008','Gayatri Menon','B.Tech','AIML',2,'+918100000154','gayatrimenon@gmail.com','Silver','2025-07-11'),
('24BTECE014','Hemanth Chowdhury','B.Tech','ECE',3,'+918100000155','hemanthchowdhury@gmail.com','Silver','2024-08-12'),
('23BTEEE016','Ishaan Deshmukh','B.Tech','EEE',4,'+918100000156','ishaandeshmukh@gmail.com','Silver','2023-06-13'),
('26BTIT043','Janani Patel','B.Tech','IT',1,'+918100000157','jananipatel@gmail.com','Silver','2026-07-14'),
('25BTME008','Karthik Naidu','B.Tech','ME',2,'+918100000158','karthiknaidu@gmail.com','Silver','2025-08-15'),
('24BTCE008','Keerthi Agarwal','B.Tech','CE',3,'+918100000159','keerthiagarwal@gmail.com','Silver','2024-06-16'),
('23PHBPHA024','Krishna Gowda','Pharmacy','B.Pharm',4,'+918100000160','krishnagowda@gmail.com','Silver','2023-07-17'),
('26PHPHAR023','Lavanya Reddy','Pharmacy','Pharm.D',1,'+918100000161','lavanyareddy@gmail.com','Silver','2026-08-18'),
('25BABUSI008','Madhav Nair','BBA','Business Administration',2,'+918100000162','madhavnair@gmail.com','Silver','2025-06-19'),
('24BAFINA030','Manasa Mishra','BBA','Finance',3,'+918100000163','manasamishra@gmail.com','Silver','2024-07-20'),
('23BAMARK008','Mansi Chandra','BBA','Marketing',4,'+918100000164','mansichandra@gmail.com','Silver','2023-08-21'),
('26BAHUMA008','Mokshith Verma','BBA','Human Resources',1,'+918100000165','mokshithverma@gmail.com','Silver','2026-06-22'),
('25MCCOMP034','Monika Gupta','MCA','Computer Applications',2,'+918100000166','monikagupta@gmail.com','Silver','2025-07-23'),
('24MCDATA035','Naveen Das','MCA','Data Science',3,'+918100000167','naveendas@gmail.com','Silver','2024-08-24'),
('23MCCYBE040','Navya Prasad','MCA','Cyber Security',4,'+918100000168','navyaprasad@gmail.com','Silver','2023-06-01'),
('26BTCSE010','Nikhil Sahu','B.Tech','CSE',1,'+918100000169','nikhilsahu@gmail.com','Silver','2026-07-02'),
('25BTAIML009','Nitya Kumar','B.Tech','AIML',2,'+918100000170','nityakumar@gmail.com','Silver','2025-08-03'),
('24BTECE015','Pallavi Krishna','B.Tech','ECE',3,'+918100000171','pallavikrishna@gmail.com','Silver','2024-06-04'),
('23BTEEE017','Pranav Joshi','B.Tech','EEE',4,'+918100000172','pranavjoshi@gmail.com','Silver','2023-07-05'),
('26BTIT044','Pranitha Kulkarni','B.Tech','IT',1,'+918100000173','pranithakulkarni@gmail.com','Silver','2026-08-06'),
('25BTME009','Raghu Sharma','B.Tech','ME',2,'+918100000174','raghusharma@gmail.com','Silver','2025-06-07'),
('24BTCE009','Rashi Varma','B.Tech','CE',3,'+918100000175','rashivarma@gmail.com','Silver','2024-07-08'),
('23PHBPHA025','Rithvik Kapoor','Pharmacy','B.Pharm',4,'+918100000176','rithvikkapoor@gmail.com','Silver','2023-08-09'),
('26PHPHAR024','Riya Pillai','Pharmacy','Pharm.D',1,'+918100000177','riyapillai@gmail.com','Silver','2026-06-10'),
('25BABUSI009','Rohit Rao','BBA','Business Administration',2,'+918100000178','rohitrao@gmail.com','Silver','2025-07-11'),
('24BAFINA031','Sahana Iyer','BBA','Finance',3,'+918100000179','sahanaiyer@gmail.com','Silver','2024-08-12'),
('23BAMARK009','Sanjana Bose','BBA','Marketing',4,'+918100000180','sanjanabose@gmail.com','Silver','2023-06-13'),
('26BAHUMA009','Shivani Babu','BBA','Human Resources',1,'+918100000181','shivanibabu@gmail.com','Silver','2026-07-14'),
('25MCCOMP035','Shreyas Mohan','MCA','Computer Applications',2,'+918100000182','shreyasmohan@gmail.com','Silver','2025-08-15'),
('24MCDATA036','Siddharth Singh','MCA','Data Science',3,'+918100000183','siddharthsingh@gmail.com','Silver','2024-06-16'),
('23MCCYBE041','Sindhu Menon','MCA','Cyber Security',4,'+918100000184','sindhumenon@gmail.com','Silver','2023-07-17'),
('26BTCSE011','Soumya Chowdhury','B.Tech','CSE',1,'+918100000185','soumyachowdhury@gmail.com','Silver','2026-08-18'),
('25BTAIML010','Srinath Deshmukh','B.Tech','AIML',2,'+918100000186','srinathdeshmukh@gmail.com','Silver','2025-06-19'),
('24BTECE016','Tanmay Patel','B.Tech','ECE',3,'+918100000187','tanmaypatel@gmail.com','Silver','2024-07-20'),
('23BTEEE018','Tejas Naidu','B.Tech','EEE',4,'+918100000188','tejasnaidu@gmail.com','Silver','2023-08-21'),
('26BTIT045','Trisha Agarwal','B.Tech','IT',1,'+918100000189','trishaagarwal@gmail.com','Silver','2026-06-22'),
('25BTME010','Uday Gowda','B.Tech','ME',2,'+918100000190','udaygowda@gmail.com','Silver','2025-07-23'),
('24BTCE010','Vaishnavi Reddy','B.Tech','CE',3,'+918100000191','vaishnavireddy@gmail.com','Silver','2024-08-24'),
('23PHBPHA026','Varsha Nair','Pharmacy','B.Pharm',4,'+918100000192','varshanair@gmail.com','Silver','2023-06-01'),
('26PHPHAR025','Vedant Mishra','Pharmacy','Pharm.D',1,'+918100000193','vedantmishra@gmail.com','Silver','2026-07-02'),
('25BABUSI010','Venkatesh Chandra','BBA','Business Administration',2,'+918100000194','venkateshchandra@gmail.com','Silver','2025-08-03'),
('24BAFINA032','Yash Verma','BBA','Finance',3,'+918100000195','yashverma@gmail.com','Silver','2024-06-04'),
('23BAMARK010','Yamini Gupta','BBA','Marketing',4,'+918100000196','yaminigupta@gmail.com','Silver','2023-07-05'),
('26BAHUMA010','Zaid Das','BBA','Human Resources',1,'+918100000197','zaiddas@gmail.com','Silver','2026-08-06'),
('25MCCOMP036','Kiran Prasad','MCA','Computer Applications',2,'+918100000198','kiranprasad@gmail.com','Silver','2025-06-07'),
('24MCDATA037','Harsha Sahu','MCA','Data Science',3,'+918100000199','harshasahu@gmail.com','Silver','2024-07-08'),
('23MCCYBE042','Pavani Kumar','MCA','Cyber Security',4,'+918100000200','pavanikumar@gmail.com','Silver','2023-08-09');
INSERT INTO Faculty
(Faculty_Id, Employee_No, Full_Name, Department, Phone, Email, Join_Date, Member_Type)
VALUES
('18CS001','EMP2018001','Henry Thomas','CSE','+918000000041','henrythomas@gmail.com','2018-07-02','Gold'),
('19AI001','EMP2019002','Emma Martin','AIML','+918000000042','emmamartin@gmail.com','2019-08-12','Gold'),
('20EC001','EMP2020003','Noah Jackson','ECE','+918000000043','noahjackson@gmail.com','2020-06-18','Gold'),
('21EE001','EMP2021004','Mia White','EEE','+918000000044','miawhite@gmail.com','2021-07-07','Gold'),
('22PD001','EMP2022005','Lucas Harris','Pharm.D','+918000000045','lucasharris@gmail.com','2022-06-21','Gold'),
('23BP001','EMP2023006','Amelia Clark','B.Pharm','+918000000046','ameliaclark@gmail.com','2023-08-03','Gold'),
('24MB001','EMP2024007','Benjamin Lewis','MBA','+918000000047','benjaminlewis@gmail.com','2024-07-15','Gold'),
('25MC001','EMP2025008','Charlotte Walker','MCA','+918000000048','charlottewalker@gmail.com','2025-06-10','Gold'),
('26CS001','EMP2026009','Alexander Hall','CSE','+918000000049','alexanderhall@gmail.com','2026-07-01','Gold'),
('18AI001','EMP2018010','Evelyn Allen','AIML','+918000000050','evelynallen@gmail.com','2018-07-02','Gold'),
('19EC001','EMP2019011','Daniel Young','ECE','+918000000051','danielyoung@gmail.com','2019-08-12','Gold'),
('20EE001','EMP2020012','Abigail King','EEE','+918000000052','abigailking@gmail.com','2020-06-18','Gold'),
('21PD001','EMP2021013','Matthew Wright','Pharm.D','+918000000053','matthewwright@gmail.com','2021-07-07','Gold'),
('22BP001','EMP2022014','Ella Scott','B.Pharm','+918000000054','ellascott@gmail.com','2022-06-21','Gold'),
('23MB001','EMP2023015','Joseph Green','MBA','+918000000055','josephgreen@gmail.com','2023-08-03','Gold'),
('24MC001','EMP2024016','Scarlett Baker','MCA','+918000000056','scarlettbaker@gmail.com','2024-07-15','Gold'),
('25CS001','EMP2025017','David Adams','CSE','+918000000057','davidadams@gmail.com','2025-06-10','Gold'),
('26AI001','EMP2026018','Victoria Nelson','AIML','+918000000058','victorianelson@gmail.com','2026-07-01','Gold'),
('18EC001','EMP2018019','Samuel Hill','ECE','+918000000059','samuelhill@gmail.com','2018-07-02','Gold'),
('19EE001','EMP2019020','Lily Campbell','EEE','+918000000060','lilycampbell@gmail.com','2019-08-12','Gold'),
('20PD001','EMP2020021','Christopher Mitchell','Pharm.D','+918000000061','christophermitchell@gmail.com','2020-06-18','Gold'),
('21BP001','EMP2021022','Hannah Roberts','B.Pharm','+918000000062','hannahroberts@gmail.com','2021-07-07','Gold'),
('22MB001','EMP2022023','Andrew Carter','MBA','+918000000063','andrewcarter@gmail.com','2022-06-21','Gold'),
('23MC001','EMP2023024','Sofia Phillips','MCA','+918000000064','sofiaphillips@gmail.com','2023-08-03','Gold'),
('24CS001','EMP2024025','Joshua Evans','CSE','+918000000065','joshuaevans@gmail.com','2024-07-15','Gold'),
('25AI001','EMP2025026','Chloe Turner','AIML','+918000000066','chloeturner@gmail.com','2025-06-10','Gold'),
('26EC001','EMP2026027','Ryan Torres','ECE','+918000000067','ryantorres@gmail.com','2026-07-01','Gold'),
('18EE001','EMP2018028','Zoe Parker','EEE','+918000000068','zoeparker@gmail.com','2018-07-02','Gold'),
('19PD001','EMP2019029','Nathan Collins','Pharm.D','+918000000069','nathancollins@gmail.com','2019-08-12','Gold'),
('20BP001','EMP2020030','Maya Edwards','B.Pharm','+918000000070','mayaedwards@gmail.com','2020-06-18','Gold'),
('19CS001','EMP2019001','Ravi Mohan','CSE','+918200100030','ravimohan@college.edu','2019-06-12','Gold'),
('20AI001','EMP2020001','Preethi Rao','AIML','+918200100031','preethirao@college.edu','2020-07-13','Gold'),
('21EC001','EMP2021001','Sandeep Reddy','ECE','+918200100032','sandeepreddy@college.edu','2021-08-14','Gold'),
('22EE001','EMP2022001','Kavya Nair','EEE','+918200100033','kavyanair@college.edu','2022-06-15','Gold'),
('23PD001','EMP2023001','Anil Kumar','Pharm.D','+918200100034','anilkumar@college.edu','2023-07-16','Gold'),
('24BP001','EMP2024001','Meghana Iyer','B.Pharm','+918200100035','meghanaiyer@college.edu','2024-08-17','Gold'),
('25MB001','EMP2025001','Vishal Gupta','MBA','+918200100036','vishalgupta@college.edu','2025-06-18','Gold'),
('26MC001','EMP2026001','Swathi Menon','MCA','+918200100037','swathimenon@college.edu','2026-07-19','Gold'),
('20CS002','EMP2020002','Ramesh Babu','CSE','+918200100038','rameshbabu@college.edu','2020-08-20','Gold'),
('22EC002','EMP2022002','Nandita Sharma','ECE','+918200100039','nanditasharma@college.edu','2022-06-21','Gold'),
('23AI002','EMP2023003','Pradeep Singh','AIML','+918200100040','pradeepsingh@college.edu','2023-07-02','Gold'),
('24EE002','EMP2024002','Harini Das','EEE','+918200100041','harinidas@college.edu','2024-08-03','Gold'),
('25MC002','EMP2025002','Sumanth Rao','MCA','+918200100042','sumanthrao@college.edu','2025-06-04','Gold'),
('21BP002','EMP2021002','Bhargavi Patel','B.Pharm','+918200100043','bhargavipatel@college.edu','2021-07-05','Gold'),
('19PD002','EMP2019003','Ashok Verma','Pharm.D','+918200100044','ashokverma@college.edu','2019-08-06','Gold'),
('20MB002','EMP2020004','Deepa Joshi','MBA','+918200100045','deepajoshi@college.edu','2020-06-07','Gold'),
('24CS002','EMP2024003','Kiran Chandra','CSE','+918200100046','kiranchandra@college.edu','2024-07-08','Gold'),
('25EC002','EMP2025003','Manisha Reddy','ECE','+918200100047','manishareddy@college.edu','2025-08-09','Gold'),
('26AI002','EMP2026002','Ajay Naidu','AIML','+918200100048','ajaynaidu@college.edu','2026-06-10','Gold'),
('23MC002','EMP2023002','Pooja Kapoor','MCA','+918200100049','poojakapoor@college.edu','2023-07-11','Gold');
INSERT INTO Librarian (Librarian_Id, Lib_Name, Phone, Email, Shift, Salary) VALUES
('L001', 'Eswar', '+917000000001', 'eswar@gmail.com', 'Morning', 30500),
('L002', 'Pravallika', '+917000000002', 'pravallika@gmail.com', 'Afternoon', 33000),
('L003', 'Srinivas', '+917000000003', 'srinivas@gmail.com', 'Evening', 35500),
('L004', 'Kavitha', '+917000000004', 'kavitha@gmail.com', 'Morning', 38000),
('L005', 'Rajesh', '+917000000005', 'rajesh@gmail.com', 'Afternoon', 40500),
('L006', 'Swathi', '+917000000006', 'swathi@gmail.com', 'Evening', 43000),
('L007', 'Manoj', '+917000000007', 'manoj@gmail.com', 'Morning', 45500);
INSERT INTO Books (Book_Id, ISBN, Book_Title, Course, Author_Id, Category_Id, Publisher_Id, Price, Language, Publication_Year, Description) VALUES
('B101',9780000000101,'Database System Concepts','B.Tech','A201803S01','CT001','P201202P01',250.00,'English',2015,'B.Tech reference book on database system concepts'),
('B102',9780000000102,'Learning SQL','B.Tech','A202107R01','CL001','P201806H01',282.50,'Telugu',2016,'B.Tech reference book on learning sql'),
('B103',9780000000103,'Python Programming','B.Tech','A201711R01','CC001','P201511O01',315.00,'Hindi',2017,'B.Tech reference book on python programming'),
('B104',9780000000104,'Clean Code','B.Tech','A202302P01','CD001','P202001P01',347.50,'English',2018,'B.Tech reference book on clean code'),
('B105',9780000000105,'Data Structures and Algorithms','B.Tech','A201909K01','CA001','P201707M01',380.00,'Telugu',2019,'B.Tech reference book on data structures and algorithms'),
('B106',9780000000106,'Artificial Intelligence','B.Tech','A201604S01','CM001','P202303S01',412.50,'Hindi',2020,'B.Tech reference book on artificial intelligence'),
('B107',9780000000107,'Machine Learning','B.Tech','A202401V01','CP001','P201910W01',445.00,'English',2021,'B.Tech reference book on machine learning'),
('B108',9780000000108,'Computer Networks','B.Tech','A202006I01','CL002','P201404R01',477.50,'Telugu',2022,'B.Tech reference book on computer networks'),
('B109',9780000000109,'Operating System Concepts','B.Tech','A201510N01','CH001','P202112C01',510.00,'Hindi',2023,'B.Tech reference book on operating system concepts'),
('B110',9780000000110,'Web Development','B.Tech','A202212G01','CB001','P201608B01',542.50,'English',2024,'B.Tech reference book on web development'),
('B111',9780000000111,'Java Programming','B.Tech','A201808M01','CT001','P202402S01',575.00,'Telugu',2025,'B.Tech reference book on java programming'),
('B112',9780000000112,'C Programming','B.Tech','A202101J01','CL001','P201309E01',607.50,'Hindi',2015,'B.Tech reference book on c programming'),
('B113',9780000000113,'Cloud Computing','B.Tech','A201405M01','CC001','P201801O01',640.00,'English',2016,'B.Tech reference book on cloud computing'),
('B114',9780000000114,'Cybersecurity','B.Tech','A202310K01','CD001','P202205C01',672.50,'Telugu',2017,'B.Tech reference book on cybersecurity'),
('B115',9780000000115,'Deep Learning','B.Tech','A201903B01','CA001','P201506R01',705.00,'Hindi',2018,'B.Tech reference book on deep learning'),
('B116',9780000000116,'Data Science','B.Tech','A201712M01','CM001','P202011M01',737.50,'English',2019,'B.Tech reference book on data science'),
('B117',9780000000117,'Discrete Mathematics','B.Tech','A202502N01','CP001','P201703S01',250.00,'Telugu',2020,'B.Tech reference book on discrete mathematics'),
('B118',9780000000118,'Linear Algebra','B.Tech','A202011S01','CL002','P202308H01',282.50,'Hindi',2021,'B.Tech reference book on linear algebra'),
('B119',9780000000119,'Calculus','B.Tech','A201607P01','CH001','P201912S01',315.00,'English',2022,'B.Tech reference book on calculus'),
('B120',9780000000120,'Physics','B.Tech','A202205K01','CB001','P202407V01',347.50,'Telugu',2023,'B.Tech reference book on physics'),
('B121',9780000000121,'Modern Physics','B.Tech','A201810M01','CT001','P201202P01',380.00,'Hindi',2024,'B.Tech reference book on modern physics'),
('B122',9780000000122,'World History','B.Tech','A202109D01','CL001','P201806H01',412.50,'English',2025,'B.Tech reference book on world history'),
('B123',9780000000123,'Indian History','B.Tech','A201502C01','CC001','P201511O01',445.00,'Telugu',2015,'B.Tech reference book on indian history'),
('B124',9780000000124,'Business Management','B.Tech','A202406R01','CD001','P202001P01',477.50,'Hindi',2016,'B.Tech reference book on business management'),
('B125',9780000000125,'Financial Accounting','B.Tech','A201911B01','CA001','P201707M01',510.00,'English',2017,'B.Tech reference book on financial accounting'),
('B126',9780000000126,'Marketing Management','Pharmacy','A201704K01','CM001','P202303S01',542.50,'Telugu',2018,'Pharmacy reference book on marketing management'),
('B127',9780000000127,'The Great Gatsby','Pharmacy','A202308P01','CP001','P201910W01',575.00,'Hindi',2019,'Pharmacy reference book on the great gatsby'),
('B128',9780000000128,'Pride and Prejudice','Pharmacy','A202003D01','CL002','P201404R01',607.50,'English',2020,'Pharmacy reference book on pride and prejudice'),
('B129',9780000000129,'Wings of Fire','Pharmacy','A201612R01','CH001','P202112C01',640.00,'Telugu',2021,'Pharmacy reference book on wings of fire'),
('B130',9780000000130,'Steve Jobs','Pharmacy','A202208A01','CB001','P201608B01',672.50,'Hindi',2022,'Pharmacy reference book on steve jobs'),
('B131',9780000000131,'The Alchemist','Pharmacy','A201805C01','CT001','P202402S01',705.00,'English',2023,'Pharmacy reference book on the alchemist'),
('B132',9780000000132,'Atomic Habits','Pharmacy','A202111J01','CL001','P201309E01',737.50,'Telugu',2024,'Pharmacy reference book on atomic habits'),
('B133',9780000000133,'The Power of Habit','Pharmacy','A201506B01','CC001','P201801O01',250.00,'Hindi',2025,'Pharmacy reference book on the power of habit'),
('B134',9780000000134,'Think and Grow Rich','Pharmacy','A202409W01','CD001','P202205C01',282.50,'English',2015,'Pharmacy reference book on think and grow rich'),
('B135',9780000000135,'Sapiens','Pharmacy','A201901M01','CA001','P201506R01',315.00,'Telugu',2016,'Pharmacy reference book on sapiens'),
('B136',9780000000136,'A Brief History of Time','Pharmacy','A201708D01','CM001','P202011M01',347.50,'Hindi',2017,'Pharmacy reference book on a brief history of time'),
('B137',9780000000137,'Cosmos','Pharmacy','A202304T01','CP001','P201703S01',380.00,'English',2018,'Pharmacy reference book on cosmos'),
('B138',9780000000138,'Introduction to Algorithms','Pharmacy','A202009A01','CL002','P202308H01',412.50,'Telugu',2019,'Pharmacy reference book on introduction to algorithms'),
('B139',9780000000139,'Computer Organization','Pharmacy','A201603T01','CH001','P201912S01',445.00,'Hindi',2020,'Pharmacy reference book on computer organization'),
('B140',9780000000140,'Software Engineering','Pharmacy','A202505M01','CB001','P202407V01',477.50,'English',2021,'Pharmacy reference book on software engineering'),
('B141',9780000000141,'Object-Oriented Programming','Pharmacy','A201803S01','CT001','P201202P01',510.00,'Telugu',2022,'Pharmacy reference book on object-oriented programming'),
('B142',9780000000142,'Data Mining','Pharmacy','A202107R01','CL001','P201806H01',542.50,'Hindi',2023,'Pharmacy reference book on data mining'),
('B143',9780000000143,'Big Data Analytics','Pharmacy','A201711R01','CC001','P201511O01',575.00,'English',2024,'Pharmacy reference book on big data analytics'),
('B144',9780000000144,'Natural Language Processing','Pharmacy','A202302P01','CD001','P202001P01',607.50,'Telugu',2025,'Pharmacy reference book on natural language processing'),
('B145',9780000000145,'Computer Vision','Pharmacy','A201909K01','CA001','P201707M01',640.00,'Hindi',2015,'Pharmacy reference book on computer vision'),
('B146',9780000000146,'DevOps Handbook','BBA','A201604S01','CM001','P202303S01',672.50,'English',2016,'BBA reference book on devops handbook'),
('B147',9780000000147,'Kubernetes in Action','BBA','A202401V01','CP001','P201910W01',705.00,'Telugu',2017,'BBA reference book on kubernetes in action'),
('B148',9780000000148,'Git and GitHub','BBA','A202006I01','CL002','P201404R01',737.50,'Hindi',2018,'BBA reference book on git and github'),
('B149',9780000000149,'JavaScript Essentials','BBA','A201510N01','CH001','P202112C01',250.00,'English',2019,'BBA reference book on javascript essentials'),
('B150',9780000000150,'React in Action','BBA','A202212G01','CB001','P201608B01',282.50,'Telugu',2020,'BBA reference book on react in action'),
('B151',9780000000151,'Node.js in Action','BBA','A201808M01','CT001','P202402S01',315.00,'Hindi',2021,'BBA reference book on node.js in action'),
('B152',9780000000152,'Django for Beginners','BBA','A202101J01','CL001','P201309E01',347.50,'English',2022,'BBA reference book on django for beginners'),
('B153',9780000000153,'Flask Web Development','BBA','A201405M01','CC001','P201801O01',380.00,'Telugu',2023,'BBA reference book on flask web development'),
('B154',9780000000154,'Android Programming','BBA','A202310K01','CD001','P202205C01',412.50,'Hindi',2024,'BBA reference book on android programming'),
('B155',9780000000155,'iOS App Development','BBA','A201903B01','CA001','P201506R01',445.00,'English',2025,'BBA reference book on ios app development'),
('B156',9780000000156,'Project Management','BBA','A201712M01','CM001','P202011M01',477.50,'Telugu',2015,'BBA reference book on project management'),
('B157',9780000000157,'Entrepreneurship','BBA','A202502N01','CP001','P201703S01',510.00,'Hindi',2016,'BBA reference book on entrepreneurship'),
('B158',9780000000158,'Human Resource Management','BBA','A202011S01','CL002','P202308H01',542.50,'English',2017,'BBA reference book on human resource management'),
('B159',9780000000159,'Operations Management','BBA','A201607P01','CH001','P201912S01',575.00,'Telugu',2018,'BBA reference book on operations management'),
('B160',9780000000160,'Economics','BBA','A202205K01','CB001','P202407V01',607.50,'Hindi',2019,'BBA reference book on economics'),
('B161',9780000000161,'Microeconomics','BBA','A201810M01','CT001','P201202P01',640.00,'English',2020,'BBA reference book on microeconomics'),
('B162',9780000000162,'Macroeconomics','BBA','A202109D01','CL001','P201806H01',672.50,'Telugu',2021,'BBA reference book on macroeconomics'),
('B163',9780000000163,'Environmental Science','BBA','A201502C01','CC001','P201511O01',705.00,'Hindi',2022,'BBA reference book on environmental science'),
('B164',9780000000164,'Biology Essentials','BBA','A202406R01','CD001','P202001P01',737.50,'English',2023,'BBA reference book on biology essentials'),
('B165',9780000000165,'Chemistry Basics','BBA','A201911B01','CA001','P201707M01',250.00,'Telugu',2024,'BBA reference book on chemistry basics'),
('B166',9780000000166,'Organic Chemistry','BBA','A201704K01','CM001','P202303S01',282.50,'Hindi',2025,'BBA reference book on organic chemistry'),
('B167',9780000000167,'Astronomy','BBA','A202308P01','CP001','P201910W01',315.00,'English',2015,'BBA reference book on astronomy'),
('B168',9780000000168,'Psychology Basics','BBA','A202003D01','CL002','P201404R01',347.50,'Telugu',2016,'BBA reference book on psychology basics'),
('B169',9780000000169,'Sociology','BBA','A201612R01','CH001','P202112C01',380.00,'Hindi',2017,'BBA reference book on sociology'),
('B170',9780000000170,'Communication Skills','MCA','A202208A01','CB001','P201608B01',412.50,'English',2018,'MCA reference book on communication skills'),
('B171',9780000000171,'English Grammar','MCA','A201805C01','CT001','P202402S01',445.00,'Telugu',2019,'MCA reference book on english grammar'),
('B172',9780000000172,'Technical Writing','MCA','A202111J01','CL001','P201309E01',477.50,'Hindi',2020,'MCA reference book on technical writing'),
('B173',9780000000173,'Research Methodology','MCA','A201506B01','CC001','P201801O01',510.00,'English',2021,'MCA reference book on research methodology'),
('B174',9780000000174,'Ethics in Technology','MCA','A202409W01','CD001','P202205C01',542.50,'Telugu',2022,'MCA reference book on ethics in technology'),
('B175',9780000000175,'Digital Marketing','MCA','A201901M01','CA001','P201506R01',575.00,'Hindi',2023,'MCA reference book on digital marketing'),
('B176',9780000000176,'Business Analytics','MCA','A201708D01','CM001','P202011M01',607.50,'English',2024,'MCA reference book on business analytics'),
('B177',9780000000177,'Database Design','MCA','A202304T01','CP001','P201703S01',640.00,'Telugu',2025,'MCA reference book on database design'),
('B178',9780000000178,'Advanced SQL','MCA','A202009A01','CL002','P202308H01',672.50,'Hindi',2015,'MCA reference book on advanced sql'),
('B179',9780000000179,'MySQL Cookbook','MCA','A201603T01','CH001','P201912S01',705.00,'English',2016,'MCA reference book on mysql cookbook'),
('B180',9780000000180,'PostgreSQL Guide','MCA','A202505M01','CB001','P202407V01',737.50,'Telugu',2017,'MCA reference book on postgresql guide'),
('B181',9780000000181,'Oracle Database','MCA','A201803S01','CT001','P201202P01',250.00,'Hindi',2018,'MCA reference book on oracle database'),
('B182',9780000000182,'Algorithms Unlocked','MCA','A202107R01','CL001','P201806H01',282.50,'English',2019,'MCA reference book on algorithms unlocked'),
('B183',9780000000183,'Programming Pearls','MCA','A201711R01','CC001','P201511O01',315.00,'Telugu',2020,'MCA reference book on programming pearls'),
('B184',9780000000184,'Effective Java','MCA','A202302P01','CD001','P202001P01',347.50,'Hindi',2021,'MCA reference book on effective java'),
('B185',9780000000185,'Head First Java','MCA','A201909K01','CA001','P201707M01',380.00,'English',2022,'MCA reference book on head first java'),
('B186',9780000000186,'Head First Python','MCA','A201604S01','CM001','P202303S01',412.50,'Telugu',2023,'MCA reference book on head first python'),
('B187',9780000000187,'Fluent Python','MCA','A202401V01','CP001','P201910W01',445.00,'Hindi',2024,'MCA reference book on fluent python'),
('B188',9780000000188,'SQL Antipatterns','MCA','A202006I01','CL002','P201404R01',477.50,'English',2025,'MCA reference book on sql antipatterns'),
('B189',9780000000189,'Design Patterns','MCA','A201510N01','CH001','P202112C01',510.00,'Telugu',2015,'MCA reference book on design patterns'),
('B190',9780000000190,'Refactoring','MCA','A202212G01','CB001','P201608B01',542.50,'Hindi',2016,'MCA reference book on refactoring'),
('B191',9780000000191,'Code Complete','MCA','A201808M01','CT001','P202402S01',575.00,'English',2017,'MCA reference book on code complete'),
('B192',9780000000192,'The Pragmatic Programmer','MCA','A202101J01','CL001','P201309E01',607.50,'Telugu',2018,'MCA reference book on the pragmatic programmer'),
('B193',9780000000193,'AI Applications','MCA','A201405M01','CC001','P201801O01',640.00,'Hindi',2019,'MCA reference book on ai applications'),
('B194',9780000000194,'Digital Logic Design','B.Tech','A202310K01','CC001','P202205C01',260.00,'Hindi',2020,'B.Tech reference book on digital logic design'),
('B195',9780000000195,'Computer Architecture','B.Tech','A201903B01','CC001','P201506R01',287.50,'English',2021,'B.Tech reference book on computer architecture'),
('B196',9780000000196,'Engineering Mechanics','B.Tech','A201712M01','CP001','P202011M01',315.00,'Telugu',2022,'B.Tech reference book on engineering mechanics'),
('B197',9780000000197,'Engineering Drawing','B.Tech','A202502N01','CM001','P201703S01',342.50,'Hindi',2023,'B.Tech reference book on engineering drawing'),
('B198',9780000000198,'Object Oriented Programming with Java','B.Tech','A202011S01','CC001','P202308H01',370.00,'English',2024,'B.Tech reference book on object oriented programming with java'),
('B199',9780000000199,'Operating Systems and Systems Programming','B.Tech','A201607P01','CC001','P201912S01',397.50,'Telugu',2025,'B.Tech reference book on operating systems and systems programming'),
('B200',9780000000200,'Computer Graphics','B.Tech','A202205K01','CC001','P202407V01',425.00,'Hindi',2018,'B.Tech reference book on computer graphics'),
('B201',9780000000201,'Compiler Design','B.Tech','A201810M01','CC001','P201202P01',452.50,'English',2019,'B.Tech reference book on compiler design'),
('B202',9780000000202,'Distributed Systems','B.Tech','A202109D01','CC001','P201806H01',480.00,'Telugu',2020,'B.Tech reference book on distributed systems'),
('B203',9780000000203,'Internet of Things','B.Tech','A201502C01','CA001','P201511O01',507.50,'Hindi',2021,'B.Tech reference book on internet of things'),
('B204',9780000000204,'Embedded Systems','B.Tech','A202406R01','CC001','P202001P01',535.00,'English',2022,'B.Tech reference book on embedded systems'),
('B205',9780000000205,'Software Testing','B.Tech','A201911B01','CC001','P201707M01',562.50,'Telugu',2023,'B.Tech reference book on software testing'),
('B206',9780000000206,'Advanced Data Structures','B.Tech','A201704K01','CC001','P202303S01',590.00,'Hindi',2024,'B.Tech reference book on advanced data structures'),
('B207',9780000000207,'Wireless Communication','B.Tech','A202308P01','CC001','P201910W01',617.50,'English',2025,'B.Tech reference book on wireless communication'),
('B208',9780000000208,'Pharmaceutical Analysis','Pharmacy','A202003D01','CM001','P201404R01',645.00,'Telugu',2018,'Pharmacy reference book on pharmaceutical analysis'),
('B209',9780000000209,'Pharmacognosy','Pharmacy','A201612R01','CP001','P202112C01',672.50,'Hindi',2019,'Pharmacy reference book on pharmacognosy'),
('B210',9780000000210,'Biochemistry for Pharmacy','Pharmacy','A202208A01','CP001','P201608B01',260.00,'English',2020,'Pharmacy reference book on biochemistry for pharmacy'),
('B211',9780000000211,'Medicinal Chemistry','Pharmacy','A201805C01','CM001','P202402S01',287.50,'Telugu',2021,'Pharmacy reference book on medicinal chemistry'),
('B212',9780000000212,'Hospital Pharmacy','Pharmacy','A202111J01','CB001','P201309E01',315.00,'Hindi',2022,'Pharmacy reference book on hospital pharmacy'),
('B213',9780000000213,'Pharmaceutical Microbiology','Pharmacy','A201506B01','CP001','P201801O01',342.50,'English',2023,'Pharmacy reference book on pharmaceutical microbiology'),
('B214',9780000000214,'Pathophysiology','Pharmacy','A202409W01','CP001','P202205C01',370.00,'Telugu',2024,'Pharmacy reference book on pathophysiology'),
('B215',9780000000215,'Pharmacotherapeutics','Pharmacy','A201901M01','CB001','P201506R01',397.50,'Hindi',2025,'Pharmacy reference book on pharmacotherapeutics'),
('B216',9780000000216,'Drug Regulatory Affairs','Pharmacy','A201708D01','CB001','P202011M01',425.00,'English',2018,'Pharmacy reference book on drug regulatory affairs'),
('B217',9780000000217,'Clinical Pharmacology','Pharmacy','A202304T01','CP001','P201703S01',452.50,'Telugu',2019,'Pharmacy reference book on clinical pharmacology'),
('B218',9780000000218,'Pharmaceutical Biotechnology','Pharmacy','A202009A01','CA001','P202308H01',480.00,'Hindi',2020,'Pharmacy reference book on pharmaceutical biotechnology'),
('B219',9780000000219,'Toxicology','Pharmacy','A201603T01','CP001','P201912S01',507.50,'English',2021,'Pharmacy reference book on toxicology'),
('B220',9780000000220,'Pharmacy Practice','Pharmacy','A202505M01','CB001','P202407V01',535.00,'Telugu',2022,'Pharmacy reference book on pharmacy practice'),
('B221',9780000000221,'Industrial Pharmacy','Pharmacy','A201803S01','CB001','P201202P01',562.50,'Hindi',2023,'Pharmacy reference book on industrial pharmacy'),
('B222',9780000000222,'Principles of Management','BBA','A202107R01','CB001','P201806H01',590.00,'English',2024,'BBA reference book on principles of management'),
('B223',9780000000223,'Business Communication','BBA','A201711R01','CB001','P201511O01',617.50,'Telugu',2025,'BBA reference book on business communication'),
('B224',9780000000224,'Organizational Behaviour','BBA','A202302P01','CB001','P202001P01',645.00,'Hindi',2018,'BBA reference book on organizational behaviour'),
('B225',9780000000225,'Managerial Economics','BBA','A201909K01','CB001','P201707M01',672.50,'English',2019,'BBA reference book on managerial economics'),
('B226',9780000000226,'Cost Accounting','BBA','A201604S01','CB001','P202303S01',260.00,'Telugu',2020,'BBA reference book on cost accounting'),
('B227',9780000000227,'Human Resource Development','BBA','A202401V01','CB001','P201910W01',287.50,'Hindi',2021,'BBA reference book on human resource development'),
('B228',9780000000228,'Consumer Behaviour','BBA','A202006I01','CB001','P201404R01',315.00,'English',2022,'BBA reference book on consumer behaviour'),
('B229',9780000000229,'Sales Management','BBA','A201510N01','CB001','P202112C01',342.50,'Telugu',2023,'BBA reference book on sales management'),
('B230',9780000000230,'Investment Management','BBA','A202212G01','CB001','P201608B01',370.00,'Hindi',2024,'BBA reference book on investment management'),
('B231',9780000000231,'Business Law','BBA','A201808M01','CB001','P202402S01',397.50,'English',2025,'BBA reference book on business law'),
('B232',9780000000232,'Strategic Management','BBA','A202101J01','CB001','P201309E01',425.00,'Telugu',2018,'BBA reference book on strategic management'),
('B233',9780000000233,'Supply Chain Management','BBA','A201405M01','CB001','P201801O01',452.50,'Hindi',2019,'BBA reference book on supply chain management'),
('B234',9780000000234,'Corporate Finance','BBA','A202310K01','CB001','P202205C01',480.00,'English',2020,'BBA reference book on corporate finance'),
('B235',9780000000235,'Entrepreneurship Development','BBA','A201903B01','CB001','P201506R01',507.50,'Telugu',2021,'BBA reference book on entrepreneurship development'),
('B236',9780000000236,'Advanced Java Programming','MCA','A201712M01','CC001','P202011M01',535.00,'Hindi',2022,'MCA reference book on advanced java programming'),
('B237',9780000000237,'Data Warehousing','MCA','A202502N01','CD001','P201703S01',562.50,'English',2023,'MCA reference book on data warehousing'),
('B238',9780000000238,'Big Data Technologies','MCA','A202011S01','CC001','P202308H01',590.00,'Telugu',2024,'MCA reference book on big data technologies'),
('B239',9780000000239,'Advanced Database Management','MCA','A201607P01','CD001','P201912S01',617.50,'Hindi',2025,'MCA reference book on advanced database management'),
('B240',9780000000240,'Mobile Computing','MCA','A202205K01','CC001','P202407V01',645.00,'English',2018,'MCA reference book on mobile computing'),
('B241',9780000000241,'Web Technologies','MCA','A201810M01','CC001','P201202P01',672.50,'Telugu',2019,'MCA reference book on web technologies'),
('B242',9780000000242,'Network Programming','MCA','A202109D01','CC001','P201806H01',260.00,'Hindi',2020,'MCA reference book on network programming'),
('B243',9780000000243,'Software Project Management','MCA','A201502C01','CB001','P201511O01',287.50,'English',2021,'MCA reference book on software project management'),
('B244',9780000000244,'Artificial Neural Networks','MCA','A202406R01','CA001','P202001P01',315.00,'Telugu',2022,'MCA reference book on artificial neural networks'),
('B245',9780000000245,'Natural Language Processing Applications','MCA','A201911B01','CA001','P201707M01',342.50,'Hindi',2023,'MCA reference book on natural language processing applications'),
('B246',9780000000246,'Data Visualization','MCA','A201704K01','CC001','P202303S01',370.00,'English',2024,'MCA reference book on data visualization'),
('B247',9780000000247,'Cloud Infrastructure','MCA','A202308P01','CC001','P201910W01',397.50,'Telugu',2025,'MCA reference book on cloud infrastructure'),
('B248',9780000000248,'Cyber Security and Ethical Hacking','MCA','A202003D01','CC001','P201404R01',425.00,'Hindi',2018,'MCA reference book on cyber security and ethical hacking'),
('B249',9780000000249,'DevOps and Automation','MCA','A201612R01','CC001','P202112C01',452.50,'English',2019,'MCA reference book on devops and automation'),
('B250',9780000000250,'Machine Learning with Python','MCA','A202208A01','CA001','P201608B01',480.00,'Telugu',2020,'MCA reference book on machine learning with python');
INSERT INTO Availability (Availability_Id, Book_Id, Total_Copies, Available_Copies, Issued_Copies, Lost_Copies, Damaged_Copies, Status) VALUES
('AV001','B101',3,0,3,0,0,'Out of Stock'),
('AV002','B102',4,1,3,0,0,'Low Stock'),
('AV003','B103',5,4,1,0,0,'Available'),
('AV004','B104',6,6,0,0,0,'Available'),
('AV005','B105',7,4,3,0,0,'Available'),
('AV006','B106',8,6,2,0,0,'Available'),
('AV007','B107',2,1,1,0,0,'Low Stock'),
('AV008','B108',3,3,0,0,0,'Available'),
('AV009','B109',4,1,3,0,0,'Low Stock'),
('AV010','B110',5,0,5,0,0,'Out of Stock'),
('AV011','B111',6,5,1,0,0,'Available'),
('AV012','B112',7,7,0,0,0,'Available'),
('AV013','B113',8,5,3,0,0,'Available'),
('AV014','B114',2,1,1,0,0,'Low Stock'),
('AV015','B115',3,2,1,0,0,'Available'),
('AV016','B116',4,4,0,0,0,'Available'),
('AV017','B117',5,2,3,0,0,'Available'),
('AV018','B118',6,1,5,0,0,'Low Stock'),
('AV019','B119',7,6,1,0,0,'Available'),
('AV020','B120',8,8,0,0,0,'Available'),
('AV021','B121',2,1,1,0,0,'Low Stock'),
('AV022','B122',3,1,2,0,0,'Low Stock'),
('AV023','B123',4,3,1,0,0,'Available'),
('AV024','B124',5,5,0,0,0,'Available'),
('AV025','B125',6,0,6,0,0,'Out of Stock'),
('AV026','B126',7,5,2,0,0,'Available'),
('AV027','B127',8,7,1,0,0,'Available'),
('AV028','B128',2,2,0,0,0,'Available'),
('AV029','B129',4,1,2,1,0,'Low Stock'),
('AV030','B130',4,2,2,0,0,'Available'),
('AV031','B131',5,4,1,0,0,'Available'),
('AV032','B132',6,6,0,0,0,'Available'),
('AV033','B133',7,4,3,0,0,'Available'),
('AV034','B134',8,6,2,0,0,'Available'),
('AV035','B135',2,1,1,0,0,'Low Stock'),
('AV036','B136',4,1,3,0,0,'Low Stock'),
('AV037','B137',5,0,4,0,1,'Out of Stock'),
('AV038','B138',5,3,2,0,0,'Available'),
('AV039','B139',6,5,1,0,0,'Available'),
('AV040','B140',7,7,0,0,0,'Available'),
('AV041','B141',8,5,3,0,0,'Available'),
('AV042','B142',2,1,1,0,0,'Low Stock'),
('AV043','B143',3,2,1,0,0,'Available'),
('AV044','B144',4,4,0,0,0,'Available'),
('AV045','B145',5,2,3,0,0,'Available'),
('AV046','B146',6,4,2,0,0,'Available'),
('AV047','B147',7,6,1,0,0,'Available'),
('AV048','B148',8,8,0,0,0,'Available'),
('AV049','B149',2,0,2,0,0,'Out of Stock'),
('AV050','B150',3,1,2,0,0,'Low Stock'),
('AV051','B151',4,3,1,0,0,'Available'),
('AV052','B152',5,5,0,0,0,'Available'),
('AV053','B153',6,3,3,0,0,'Available'),
('AV054','B154',7,5,2,0,0,'Available'),
('AV055','B155',8,1,7,0,0,'Low Stock'),
('AV056','B156',2,2,0,0,0,'Available'),
('AV057','B157',3,1,2,0,0,'Low Stock'),
('AV058','B158',5,2,2,1,0,'Available'),
('AV059','B159',5,4,1,0,0,'Available'),
('AV060','B160',6,0,6,0,0,'Out of Stock'),
('AV061','B161',7,4,3,0,0,'Available'),
('AV062','B162',8,6,2,0,0,'Available'),
('AV063','B163',2,1,1,0,0,'Low Stock'),
('AV064','B164',3,3,0,0,0,'Available'),
('AV065','B165',4,1,3,0,0,'Low Stock'),
('AV066','B166',5,3,2,0,0,'Available'),
('AV067','B167',6,5,1,0,0,'Available'),
('AV068','B168',7,7,0,0,0,'Available'),
('AV069','B169',8,5,3,0,0,'Available'),
('AV070','B170',2,1,1,0,0,'Low Stock'),
('AV071','B171',3,0,3,0,0,'Out of Stock'),
('AV072','B172',4,4,0,0,0,'Available'),
('AV073','B173',5,2,3,0,0,'Available'),
('AV074','B174',7,4,2,0,1,'Available'),
('AV075','B175',7,6,1,0,0,'Available'),
('AV076','B176',8,8,0,0,0,'Available'),
('AV077','B177',2,1,1,0,0,'Low Stock'),
('AV078','B178',4,1,3,0,0,'Low Stock'),
('AV079','B179',4,3,1,0,0,'Available'),
('AV080','B180',5,5,0,0,0,'Available'),
('AV081','B181',6,3,3,0,0,'Available'),
('AV082','B182',7,0,7,0,0,'Out of Stock'),
('AV083','B183',8,7,1,0,0,'Available'),
('AV084','B184',2,2,0,0,0,'Available'),
('AV085','B185',3,1,2,0,0,'Low Stock'),
('AV086','B186',4,2,2,0,0,'Available'),
('AV087','B187',6,4,1,1,0,'Available'),
('AV088','B188',6,6,0,0,0,'Available'),
('AV089','B189',7,4,3,0,0,'Available'),
('AV090','B190',8,6,2,0,0,'Available'),
('AV091','B191',2,1,1,0,0,'Low Stock'),
('AV092','B192',3,3,0,0,0,'Available'),
('AV093','B193',4,0,4,0,0,'Out of Stock'),
('AV094','B194',5,3,2,0,0,'Available'),
('AV095','B195',6,5,1,0,0,'Available'),
('AV096','B196',7,7,0,0,0,'Available'),
('AV097','B197',8,5,3,0,0,'Available'),
('AV098','B198',2,1,1,0,0,'Low Stock'),
('AV099','B199',3,2,1,0,0,'Available'),
('AV100','B200',4,4,0,0,0,'Available'),
('AV101','B201',5,2,3,0,0,'Available'),
('AV102','B202',6,4,2,0,0,'Available'),
('AV103','B203',7,1,6,0,0,'Low Stock'),
('AV104','B204',8,0,8,0,0,'Out of Stock'),
('AV105','B205',2,1,1,0,0,'Low Stock'),
('AV106','B206',3,1,2,0,0,'Low Stock'),
('AV107','B207',4,3,1,0,0,'Available'),
('AV108','B208',5,5,0,0,0,'Available'),
('AV109','B209',6,3,3,0,0,'Available'),
('AV110','B210',7,5,2,0,0,'Available'),
('AV111','B211',9,7,1,0,1,'Available'),
('AV112','B212',2,2,0,0,0,'Available'),
('AV113','B213',3,1,2,0,0,'Low Stock'),
('AV114','B214',4,1,3,0,0,'Low Stock'),
('AV115','B215',5,0,5,0,0,'Out of Stock'),
('AV116','B216',7,6,0,1,0,'Available'),
('AV117','B217',7,4,3,0,0,'Available'),
('AV118','B218',8,6,2,0,0,'Available'),
('AV119','B219',2,1,1,0,0,'Low Stock'),
('AV120','B220',3,3,0,0,0,'Available'),
('AV121','B221',4,1,3,0,0,'Low Stock'),
('AV122','B222',5,3,2,0,0,'Available'),
('AV123','B223',6,5,1,0,0,'Available'),
('AV124','B224',7,7,0,0,0,'Available'),
('AV125','B225',8,5,3,0,0,'Available'),
('AV126','B226',2,0,2,0,0,'Out of Stock'),
('AV127','B227',3,2,1,0,0,'Available'),
('AV128','B228',4,4,0,0,0,'Available'),
('AV129','B229',5,1,4,0,0,'Low Stock'),
('AV130','B230',6,4,2,0,0,'Available'),
('AV131','B231',7,6,1,0,0,'Available'),
('AV132','B232',8,8,0,0,0,'Available'),
('AV133','B233',2,1,1,0,0,'Low Stock'),
('AV134','B234',3,1,2,0,0,'Low Stock'),
('AV135','B235',4,3,1,0,0,'Available'),
('AV136','B236',5,5,0,0,0,'Available'),
('AV137','B237',6,0,6,0,0,'Out of Stock'),
('AV138','B238',7,1,6,0,0,'Low Stock'),
('AV139','B239',8,7,1,0,0,'Available'),
('AV140','B240',2,2,0,0,0,'Available'),
('AV141','B241',3,1,2,0,0,'Low Stock'),
('AV142','B242',4,0,4,0,0,'Out of Stock'),
('AV143','B243',5,4,1,0,0,'Available'),
('AV144','B244',6,6,0,0,0,'Available'),
('AV145','B245',8,4,3,1,0,'Available'),
('AV146','B246',8,6,2,0,0,'Available'),
('AV147','B247',2,0,2,0,0,'Out of Stock'),
('AV148','B248',4,3,0,0,1,'Available'),
('AV149','B249',4,1,3,0,0,'Low Stock'),
('AV150','B250',5,3,2,0,0,'Available');
INSERT INTO issue (Issue_Id, Book_Id, Roll_No, Faculty_Id, Librarian_Id, Issue_Date, Due_Date, Return_Date, Fine) VALUES
('I001','B111','26BTEEE007',NULL,'L001','2026-04-01','2026-04-15','2026-04-14',0),
('I002','B122','24PHBPHA014',NULL,'L002','2026-04-01','2026-04-15','2026-04-15',0),
('I003','B133','25BAHUMA021',NULL,'L003','2026-04-02','2026-04-16','2026-04-16',0),
('I004','B144','23MCCOMP028',NULL,'L004','2026-04-02','2026-04-16','2026-04-18',20),
('I005','B155','26BTIT035',NULL,'L005','2026-04-03','2026-04-17','2026-04-21',40),
('I006','B166',NULL,'19AI001','L006','2026-04-03','2026-05-03','2026-05-03',0),
('I007','B177',NULL,'26CS001','L007','2026-04-04','2026-05-04','2026-05-02',0),
('I008','B188',NULL,'24MC001','L001','2026-04-04','2026-05-04','2026-05-05',5),
('I009','B199',NULL,'22MB001','L002','2026-04-05','2026-05-05','2026-05-05',0),
('I010','B210',NULL,'20BP001','L003','2026-04-05','2026-05-05','2026-05-11',30),
('I011','B221','26BTEEE007',NULL,'L004','2026-04-06','2026-04-20','2026-04-20',0),
('I012','B232','24PHBPHA014',NULL,'L005','2026-04-06','2026-04-20',NULL,0),
('I013','B243','25BAHUMA021',NULL,'L006','2026-04-07','2026-04-21',NULL,0),
('I014','B104','23MCCOMP028',NULL,'L007','2026-04-07','2026-04-21',NULL,0),
('I015','B115','26BTIT035',NULL,'L001','2026-04-08','2026-04-22',NULL,0),
('I016','B126',NULL,'19AI001','L002','2026-04-08','2026-05-08',NULL,0),
('I017','B137',NULL,'26CS001','L003','2026-04-09','2026-05-09',NULL,0),
('I018','B148',NULL,'24MC001','L004','2026-04-09','2026-05-09',NULL,0),
('I019','B159',NULL,'22MB001','L005','2026-04-10','2026-05-10',NULL,0),
('I020','B170',NULL,'20BP001','L006','2026-04-10','2026-05-10','2026-05-07',0),
('I021','B181','26BTEEE007',NULL,'L007','2026-04-11','2026-04-25','2026-04-24',0),
('I022','B192','24PHBPHA014',NULL,'L001','2026-04-11','2026-04-25','2026-04-25',0),
('I023','B203','25BAHUMA021',NULL,'L002','2026-04-12','2026-04-26','2026-04-26',0),
('I024','B214','23MCCOMP028',NULL,'L003','2026-04-12','2026-04-26','2026-04-28',20),
('I025','B225','26BTIT035',NULL,'L004','2026-04-13','2026-04-27','2026-05-01',40),
('I026','B236',NULL,'19AI001','L005','2026-04-13','2026-05-13','2026-05-13',0),
('I027','B247',NULL,'26CS001','L006','2026-04-14','2026-05-14','2026-05-12',0),
('I028','B108',NULL,'24MC001','L007','2026-04-14','2026-05-14','2026-05-15',5),
('I029','B119',NULL,'22MB001','L001','2026-04-15','2026-05-15','2026-05-15',0),
('I030','B130',NULL,'20BP001','L002','2026-04-15','2026-05-15','2026-05-21',30),
('I031','B141','26BTEEE007',NULL,'L003','2026-04-16','2026-04-30','2026-04-30',0),
('I032','B152','24PHBPHA014',NULL,'L004','2026-04-16','2026-04-30',NULL,0),
('I033','B163','25BAHUMA021',NULL,'L005','2026-04-17','2026-05-01',NULL,0),
('I034','B174','23MCCOMP028',NULL,'L006','2026-04-17','2026-05-01',NULL,0),
('I035','B185','26BTIT035',NULL,'L007','2026-04-18','2026-05-02',NULL,0),
('I036','B196',NULL,'19AI001','L001','2026-04-18','2026-05-18',NULL,0),
('I037','B207',NULL,'26CS001','L002','2026-04-19','2026-05-19',NULL,0),
('I038','B218',NULL,'24MC001','L003','2026-04-19','2026-05-19',NULL,0),
('I039','B229',NULL,'22MB001','L004','2026-04-20','2026-05-20',NULL,0),
('I040','B240',NULL,'20BP001','L005','2026-04-20','2026-05-20','2026-05-17',0),
('I041','B101','26BTEEE007',NULL,'L006','2026-04-21','2026-05-05','2026-05-04',0),
('I042','B112','24PHBPHA014',NULL,'L007','2026-04-21','2026-05-05','2026-05-05',0),
('I043','B123','25BAHUMA021',NULL,'L001','2026-04-22','2026-05-06','2026-05-06',0),
('I044','B134','23MCCOMP028',NULL,'L002','2026-04-22','2026-05-06','2026-05-08',20),
('I045','B145','26BTIT035',NULL,'L003','2026-04-23','2026-05-07','2026-05-11',40),
('I046','B156',NULL,'19AI001','L004','2026-04-23','2026-05-23','2026-05-23',0),
('I047','B167',NULL,'26CS001','L005','2026-04-24','2026-05-24','2026-05-22',0),
('I048','B178',NULL,'24MC001','L006','2026-04-24','2026-05-24','2026-05-25',5),
('I049','B189',NULL,'22MB001','L007','2026-04-25','2026-05-25','2026-05-25',0),
('I050','B200',NULL,'20BP001','L001','2026-04-25','2026-05-25','2026-05-31',30),
('I051','B211','26BTEEE007',NULL,'L002','2026-04-26','2026-05-10','2026-05-10',0),
('I052','B222','24PHBPHA014',NULL,'L003','2026-04-26','2026-05-10',NULL,0),
('I053','B233','25BAHUMA021',NULL,'L004','2026-04-27','2026-05-11',NULL,0),
('I054','B244','23MCCOMP028',NULL,'L005','2026-04-27','2026-05-11',NULL,0),
('I055','B105','26BTIT035',NULL,'L006','2026-04-28','2026-05-12',NULL,0),
('I056','B116',NULL,'19AI001','L007','2026-04-28','2026-05-28',NULL,0),
('I057','B127',NULL,'26CS001','L001','2026-04-29','2026-05-29',NULL,0),
('I058','B138',NULL,'24MC001','L002','2026-04-29','2026-05-29',NULL,0),
('I059','B149',NULL,'22MB001','L003','2026-04-30','2026-05-30',NULL,0),
('I060','B160',NULL,'20BP001','L004','2026-04-30','2026-05-30','2026-05-27',0),
('I061','B171','26BTEEE007',NULL,'L005','2026-05-01','2026-05-15','2026-05-14',0),
('I062','B182','24PHBPHA014',NULL,'L006','2026-05-01','2026-05-15','2026-05-15',0),
('I063','B193','25BAHUMA021',NULL,'L007','2026-05-02','2026-05-16','2026-05-16',0),
('I064','B204','23MCCOMP028',NULL,'L001','2026-05-02','2026-05-16','2026-05-18',20),
('I065','B215','26BTIT035',NULL,'L002','2026-05-03','2026-05-17','2026-05-21',40),
('I066','B226',NULL,'19AI001','L003','2026-05-03','2026-06-02','2026-06-02',0),
('I067','B237',NULL,'26CS001','L004','2026-05-04','2026-06-03','2026-06-01',0),
('I068','B248',NULL,'24MC001','L005','2026-05-04','2026-06-03','2026-06-04',5),
('I069','B109',NULL,'22MB001','L006','2026-05-05','2026-06-04','2026-06-04',0),
('I070','B120',NULL,'20BP001','L007','2026-05-05','2026-06-04','2026-06-10',30),
('I071','B131','26BTEEE007',NULL,'L001','2026-05-06','2026-05-20','2026-05-20',0),
('I072','B142','24PHBPHA014',NULL,'L002','2026-05-06','2026-05-20',NULL,0),
('I073','B153','25BAHUMA021',NULL,'L003','2026-05-07','2026-05-21',NULL,0),
('I074','B164','23MCCOMP028',NULL,'L004','2026-05-07','2026-05-21',NULL,0),
('I075','B175','26BTIT035',NULL,'L005','2026-05-08','2026-05-22',NULL,0),
('I076','B186',NULL,'19AI001','L006','2026-05-08','2026-06-07',NULL,0),
('I077','B197',NULL,'26CS001','L007','2026-05-09','2026-06-08',NULL,0),
('I078','B208',NULL,'24MC001','L001','2026-05-09','2026-06-08',NULL,0),
('I079','B219',NULL,'22MB001','L002','2026-05-10','2026-06-09',NULL,0),
('I080','B230',NULL,'20BP001','L003','2026-05-10','2026-06-09','2026-06-06',0),
('I081','B241','26BTEEE007',NULL,'L004','2026-05-11','2026-05-25','2026-05-24',0),
('I082','B102','24PHBPHA014',NULL,'L005','2026-05-11','2026-05-25','2026-05-25',0),
('I083','B113','25BAHUMA021',NULL,'L006','2026-05-12','2026-05-26','2026-05-26',0),
('I084','B124','23MCCOMP028',NULL,'L007','2026-05-12','2026-05-26','2026-05-28',20),
('I085','B135','26BTIT035',NULL,'L001','2026-05-13','2026-05-27','2026-05-31',40),
('I086','B146',NULL,'19AI001','L002','2026-05-13','2026-06-12','2026-06-12',0),
('I087','B157',NULL,'26CS001','L003','2026-05-14','2026-06-13','2026-06-11',0),
('I088','B168',NULL,'24MC001','L004','2026-05-14','2026-06-13','2026-06-14',5),
('I089','B179',NULL,'22MB001','L005','2026-05-15','2026-06-14','2026-06-14',0),
('I090','B190',NULL,'20BP001','L006','2026-05-15','2026-06-14','2026-06-20',30),
('I091','B201','26BTEEE007',NULL,'L007','2026-05-16','2026-05-30','2026-05-30',0),
('I092','B212','24PHBPHA014',NULL,'L001','2026-05-16','2026-05-30',NULL,0),
('I093','B223','25BAHUMA021',NULL,'L002','2026-05-17','2026-05-31',NULL,0),
('I094','B234','23MCCOMP028',NULL,'L003','2026-05-17','2026-05-31',NULL,0),
('I095','B245','26BTIT035',NULL,'L004','2026-05-18','2026-06-01',NULL,0),
('I096','B106',NULL,'19AI001','L005','2026-05-18','2026-06-17',NULL,0),
('I097','B117',NULL,'26CS001','L006','2026-05-19','2026-06-18',NULL,0),
('I098','B128',NULL,'24MC001','L007','2026-05-19','2026-06-18',NULL,0),
('I099','B139',NULL,'22MB001','L001','2026-05-20','2026-06-19',NULL,0),
('I100','B150',NULL,'20BP001','L002','2026-05-20','2026-06-19','2026-06-16',0),
('I101','B161','26BTEEE007',NULL,'L003','2026-05-21','2026-06-04','2026-06-03',0),
('I102','B172','24PHBPHA014',NULL,'L004','2026-05-21','2026-06-04','2026-06-04',0),
('I103','B183','25BAHUMA021',NULL,'L005','2026-05-22','2026-06-05','2026-06-05',0),
('I104','B194','23MCCOMP028',NULL,'L006','2026-05-22','2026-06-05','2026-06-07',20),
('I105','B205','26BTIT035',NULL,'L007','2026-05-23','2026-06-06','2026-06-10',40),
('I106','B216',NULL,'19AI001','L001','2026-05-23','2026-06-22','2026-06-22',0),
('I107','B227',NULL,'26CS001','L002','2026-05-24','2026-06-23','2026-06-21',0),
('I108','B238',NULL,'24MC001','L003','2026-05-24','2026-06-23','2026-06-24',5),
('I109','B249',NULL,'22MB001','L004','2026-05-25','2026-06-24','2026-06-24',0),
('I110','B110',NULL,'20BP001','L005','2026-05-25','2026-06-24','2026-06-30',30),
('I111','B121','26BTEEE007',NULL,'L006','2026-05-26','2026-06-09','2026-06-09',0),
('I112','B132','24PHBPHA014',NULL,'L007','2026-05-26','2026-06-09',NULL,0),
('I113','B143','25BAHUMA021',NULL,'L001','2026-05-27','2026-06-10',NULL,0),
('I114','B154','23MCCOMP028',NULL,'L002','2026-05-27','2026-06-10',NULL,0),
('I115','B165','26BTIT035',NULL,'L003','2026-05-28','2026-06-11',NULL,0),
('I116','B176',NULL,'19AI001','L004','2026-05-28','2026-06-27',NULL,0),
('I117','B187',NULL,'26CS001','L005','2026-05-29','2026-06-28',NULL,0),
('I118','B198',NULL,'24MC001','L006','2026-05-29','2026-06-28',NULL,0),
('I119','B209',NULL,'22MB001','L007','2026-05-30','2026-06-29',NULL,0),
('I120','B220',NULL,'20BP001','L001','2026-05-30','2026-06-29','2026-06-26',0),
('I121','B231','26BTEEE007',NULL,'L002','2026-05-31','2026-06-14','2026-06-13',0),
('I122','B242','24PHBPHA014',NULL,'L003','2026-05-31','2026-06-14','2026-06-14',0),
('I123','B103','25BAHUMA021',NULL,'L004','2026-06-01','2026-06-15','2026-06-15',0),
('I124','B114','23MCCOMP028',NULL,'L005','2026-06-01','2026-06-15','2026-06-17',20),
('I125','B125','26BTIT035',NULL,'L006','2026-06-02','2026-06-16','2026-06-20',40),
('I126','B136',NULL,'19AI001','L007','2026-06-02','2026-07-02','2026-07-02',0),
('I127','B147',NULL,'26CS001','L001','2026-06-03','2026-07-03','2026-07-01',0),
('I128','B158',NULL,'24MC001','L002','2026-06-03','2026-07-03','2026-07-04',5),
('I129','B169',NULL,'22MB001','L003','2026-06-04','2026-07-04','2026-07-04',0),
('I130','B180',NULL,'20BP001','L004','2026-06-04','2026-07-04','2026-07-10',30),
('I131','B191','26BTEEE007',NULL,'L005','2026-06-05','2026-06-19','2026-06-19',0),
('I132','B202','24PHBPHA014',NULL,'L006','2026-06-05','2026-06-19',NULL,0),
('I133','B213','25BAHUMA021',NULL,'L007','2026-06-06','2026-06-20',NULL,0),
('I134','B224','23MCCOMP028',NULL,'L001','2026-06-06','2026-06-20',NULL,0),
('I135','B235','26BTIT035',NULL,'L002','2026-06-07','2026-06-21',NULL,0),
('I136','B246',NULL,'19AI001','L003','2026-06-07','2026-07-07',NULL,0),
('I137','B107',NULL,'26CS001','L004','2026-06-08','2026-07-08',NULL,0),
('I138','B118',NULL,'24MC001','L005','2026-06-08','2026-07-08',NULL,0),
('I139','B129',NULL,'22MB001','L006','2026-06-09','2026-07-09',NULL,0),
('I140','B140',NULL,'20BP001','L007','2026-06-09','2026-07-09','2026-07-06',0),
('I141','B151','26BTEEE007',NULL,'L001','2026-06-10','2026-06-24','2026-06-23',0),
('I142','B162','24PHBPHA014',NULL,'L002','2026-06-10','2026-06-24','2026-06-24',0),
('I143','B173','25BAHUMA021',NULL,'L003','2026-06-11','2026-06-25','2026-06-25',0),
('I144','B184','23MCCOMP028',NULL,'L004','2026-06-11','2026-06-25','2026-06-27',20),
('I145','B195','26BTIT035',NULL,'L005','2026-06-12','2026-06-26','2026-06-30',40),
('I146','B206',NULL,'19AI001','L006','2026-06-12','2026-07-12','2026-07-12',0),
('I147','B217',NULL,'26CS001','L007','2026-06-13','2026-07-13','2026-07-11',0),
('I148','B228',NULL,'24MC001','L001','2026-06-13','2026-07-13','2026-07-14',5),
('I149','B239',NULL,'22MB001','L002','2026-06-14','2026-07-14','2026-07-14',0),
('I150','B250',NULL,'20BP001','L003','2026-06-14','2026-07-14','2026-07-20',30),
('I151','B111','26BTEEE007',NULL,'L004','2026-06-15','2026-06-29','2026-06-29',0),
('I152','B122','24PHBPHA014',NULL,'L005','2026-06-15','2026-06-29',NULL,0),
('I153','B133','25BAHUMA021',NULL,'L006','2026-06-16','2026-06-30',NULL,0),
('I154','B144','23MCCOMP028',NULL,'L007','2026-06-16','2026-06-30',NULL,0),
('I155','B155','26BTIT035',NULL,'L001','2026-06-17','2026-07-01',NULL,0),
('I156','B166',NULL,'19AI001','L002','2026-06-17','2026-07-17',NULL,0),
('I157','B177',NULL,'26CS001','L003','2026-06-18','2026-07-18',NULL,0),
('I158','B188',NULL,'24MC001','L004','2026-06-18','2026-07-18',NULL,0),
('I159','B199',NULL,'22MB001','L005','2026-06-19','2026-07-19',NULL,0),
('I160','B210',NULL,'20BP001','L006','2026-06-19','2026-07-19','2026-07-16',0),
('I161','B221','26BTEEE007',NULL,'L007','2026-06-20','2026-07-04','2026-07-03',0),
('I162','B232','24PHBPHA014',NULL,'L001','2026-06-20','2026-07-04','2026-07-04',0),
('I163','B243','25BAHUMA021',NULL,'L002','2026-06-21','2026-07-05','2026-07-05',0),
('I164','B104','23MCCOMP028',NULL,'L003','2026-06-21','2026-07-05','2026-07-07',20),
('I165','B115','26BTIT035',NULL,'L004','2026-06-22','2026-07-06','2026-07-10',40),
('I166','B126',NULL,'19AI001','L005','2026-06-22','2026-07-22','2026-07-22',0),
('I167','B137',NULL,'26CS001','L006','2026-06-23','2026-07-23','2026-07-21',0),
('I168','B148',NULL,'24MC001','L007','2026-06-23','2026-07-23','2026-07-24',5),
('I169','B159',NULL,'22MB001','L001','2026-06-24','2026-07-24','2026-07-24',0),
('I170','B170',NULL,'20BP001','L002','2026-06-24','2026-07-24','2026-07-30',30),
('I171','B181','26BTEEE007',NULL,'L003','2026-06-25','2026-07-09','2026-07-09',0),
('I172','B192','24PHBPHA014',NULL,'L004','2026-06-25','2026-07-09',NULL,0),
('I173','B203','25BAHUMA021',NULL,'L005','2026-06-26','2026-07-10',NULL,0),
('I174','B214','23MCCOMP028',NULL,'L006','2026-06-26','2026-07-10',NULL,0),
('I175','B225','26BTIT035',NULL,'L007','2026-06-27','2026-07-11',NULL,0),
('I176','B236',NULL,'19AI001','L001','2026-06-27','2026-07-27',NULL,0),
('I177','B247',NULL,'26CS001','L002','2026-06-28','2026-07-28',NULL,0),
('I178','B108',NULL,'24MC001','L003','2026-06-28','2026-07-28',NULL,0),
('I179','B119',NULL,'22MB001','L004','2026-06-29','2026-07-29',NULL,0),
('I180','B130',NULL,'20BP001','L005','2026-06-29','2026-07-29','2026-07-26',0),
('I181','B141','26BTEEE007',NULL,'L006','2026-06-30','2026-07-14','2026-07-13',0),
('I182','B152','24PHBPHA014',NULL,'L007','2026-06-30','2026-07-14','2026-07-14',0),
('I183','B163','25BAHUMA021',NULL,'L001','2026-07-01','2026-07-15','2026-07-15',0),
('I184','B174','23MCCOMP028',NULL,'L002','2026-07-01','2026-07-15','2026-07-17',20),
('I185','B185','26BTIT035',NULL,'L003','2026-07-02','2026-07-16','2026-07-20',40),
('I186','B196',NULL,'19AI001','L004','2026-07-02','2026-08-01','2026-08-01',0),
('I187','B207',NULL,'26CS001','L005','2026-07-03','2026-08-02','2026-07-31',0),
('I188','B218',NULL,'24MC001','L006','2026-07-03','2026-08-02','2026-08-03',5),
('I189','B229',NULL,'22MB001','L007','2026-07-04','2026-08-03','2026-08-03',0),
('I190','B240',NULL,'20BP001','L001','2026-07-04','2026-08-03','2026-08-09',30),
('I191','B101','26BTEEE007',NULL,'L002','2026-07-05','2026-07-19','2026-07-19',0),
('I192','B112','24PHBPHA014',NULL,'L003','2026-07-05','2026-07-19',NULL,0),
('I193','B123','25BAHUMA021',NULL,'L004','2026-07-06','2026-07-20',NULL,0),
('I194','B134','23MCCOMP028',NULL,'L005','2026-07-06','2026-07-20',NULL,0),
('I195','B145','26BTIT035',NULL,'L006','2026-07-07','2026-07-21',NULL,0),
('I196','B156',NULL,'19AI001','L007','2026-07-07','2026-08-06',NULL,0),
('I197','B167',NULL,'26CS001','L001','2026-07-08','2026-08-07',NULL,0),
('I198','B178',NULL,'24MC001','L002','2026-07-08','2026-08-07',NULL,0),
('I199','B189',NULL,'22MB001','L003','2026-07-09','2026-08-08',NULL,0),
('I200','B200',NULL,'20BP001','L004','2026-07-09','2026-08-08','2026-08-05',0),
('I201','B211','26BTEEE007',NULL,'L005','2026-07-10','2026-07-24','2026-07-23',0),
('I202','B222','24PHBPHA014',NULL,'L006','2026-07-10','2026-07-24','2026-07-24',0),
('I203','B233','25BAHUMA021',NULL,'L007','2026-07-11','2026-07-25','2026-07-25',0),
('I204','B244','23MCCOMP028',NULL,'L001','2026-07-11','2026-07-25','2026-07-27',20),
('I205','B105','26BTIT035',NULL,'L002','2026-07-12','2026-07-26','2026-07-30',40),
('I206','B116',NULL,'19AI001','L003','2026-07-12','2026-08-11','2026-08-11',0),
('I207','B127',NULL,'26CS001','L004','2026-07-13','2026-08-12','2026-08-10',0),
('I208','B138',NULL,'24MC001','L005','2026-07-13','2026-08-12','2026-08-13',5),
('I209','B149',NULL,'22MB001','L006','2026-07-14','2026-08-13','2026-08-13',0),
('I210','B160',NULL,'20BP001','L007','2026-07-14','2026-08-13','2026-08-19',30),
('I211','B171','26BTEEE007',NULL,'L001','2026-07-15','2026-07-29','2026-07-29',0),
('I212','B182','24PHBPHA014',NULL,'L002','2026-07-15','2026-07-29',NULL,0),
('I213','B193','25BAHUMA021',NULL,'L003','2026-07-16','2026-07-30',NULL,0),
('I214','B204','23MCCOMP028',NULL,'L004','2026-07-16','2026-07-30',NULL,0),
('I215','B215','26BTIT035',NULL,'L005','2026-07-17','2026-07-31',NULL,0),
('I216','B226',NULL,'19AI001','L006','2026-07-17','2026-08-16',NULL,0),
('I217','B237',NULL,'26CS001','L007','2026-07-18','2026-08-17',NULL,0),
('I218','B248',NULL,'24MC001','L001','2026-07-18','2026-08-17',NULL,0),
('I219','B109',NULL,'22MB001','L002','2026-07-19','2026-08-18',NULL,0),
('I220','B120',NULL,'20BP001','L003','2026-07-19','2026-08-18','2026-08-15',0),
('I221','B131','26BTEEE007',NULL,'L004','2026-07-20','2026-08-03','2026-08-02',0),
('I222','B142','24PHBPHA014',NULL,'L005','2026-07-20','2026-08-03','2026-08-03',0),
('I223','B153','25BAHUMA021',NULL,'L006','2026-07-21','2026-08-04','2026-08-04',0),
('I224','B164','23MCCOMP028',NULL,'L007','2026-07-21','2026-08-04','2026-08-06',20),
('I225','B175','26BTIT035',NULL,'L001','2026-07-22','2026-08-05','2026-08-09',40),
('I226','B186',NULL,'19AI001','L002','2026-07-22','2026-08-21','2026-08-21',0),
('I227','B197',NULL,'26CS001','L003','2026-07-23','2026-08-22','2026-08-20',0),
('I228','B208',NULL,'24MC001','L004','2026-07-23','2026-08-22','2026-08-23',5),
('I229','B219',NULL,'22MB001','L005','2026-07-24','2026-08-23','2026-08-23',0),
('I230','B230',NULL,'20BP001','L006','2026-07-24','2026-08-23','2026-08-29',30),
('I231','B241','26BTEEE007',NULL,'L007','2026-07-25','2026-08-08','2026-08-08',0),
('I232','B102','24PHBPHA014',NULL,'L001','2026-07-25','2026-08-08',NULL,0),
('I233','B113','25BAHUMA021',NULL,'L002','2026-07-26','2026-08-09',NULL,0),
('I234','B124','23MCCOMP028',NULL,'L003','2026-07-26','2026-08-09',NULL,0),
('I235','B135','26BTIT035',NULL,'L004','2026-07-27','2026-08-10',NULL,0),
('I236','B146',NULL,'19AI001','L005','2026-07-27','2026-08-26',NULL,0),
('I237','B157',NULL,'26CS001','L006','2026-07-28','2026-08-27',NULL,0),
('I238','B168',NULL,'24MC001','L007','2026-07-28','2026-08-27',NULL,0),
('I239','B179',NULL,'22MB001','L001','2026-07-29','2026-08-28',NULL,0),
('I240','B190',NULL,'20BP001','L002','2026-07-29','2026-08-28','2026-08-25',0),
('I241','B201','26BTEEE007',NULL,'L003','2026-07-30','2026-08-13','2026-08-12',0),
('I242','B212','24PHBPHA014',NULL,'L004','2026-07-30','2026-08-13','2026-08-13',0),
('I243','B223','25BAHUMA021',NULL,'L005','2026-07-31','2026-08-14','2026-08-14',0),
('I244','B234','23MCCOMP028',NULL,'L006','2026-07-31','2026-08-14','2026-08-16',20),
('I245','B245','26BTIT035',NULL,'L007','2026-08-01','2026-08-15','2026-08-19',40),
('I246','B106',NULL,'19AI001','L001','2026-08-01','2026-08-31','2026-08-31',0),
('I247','B117',NULL,'26CS001','L002','2026-08-02','2026-09-01','2026-08-30',0),
('I248','B128',NULL,'24MC001','L003','2026-08-02','2026-09-01','2026-09-02',5),
('I249','B139',NULL,'22MB001','L004','2026-08-03','2026-09-02','2026-09-02',0),
('I250','B150',NULL,'20BP001','L005','2026-08-03','2026-09-02','2026-09-08',30),
('I251','B161','26BTEEE007',NULL,'L006','2026-08-04','2026-08-18','2026-08-18',0),
('I252','B172','24PHBPHA014',NULL,'L007','2026-08-04','2026-08-18',NULL,0),
('I253','B183','25BAHUMA021',NULL,'L001','2026-08-05','2026-08-19',NULL,0),
('I254','B194','23MCCOMP028',NULL,'L002','2026-08-05','2026-08-19',NULL,0),
('I255','B205','26BTIT035',NULL,'L003','2026-08-06','2026-08-20',NULL,0),
('I256','B216',NULL,'19AI001','L004','2026-08-06','2026-09-05',NULL,0),
('I257','B227',NULL,'26CS001','L005','2026-08-07','2026-09-06',NULL,0),
('I258','B238',NULL,'24MC001','L006','2026-08-07','2026-09-06',NULL,0),
('I259','B249',NULL,'22MB001','L007','2026-08-08','2026-09-07',NULL,0),
('I260','B110',NULL,'20BP001','L001','2026-08-08','2026-09-07','2026-09-04',0),
('I261','B121','26BTEEE007',NULL,'L002','2026-08-09','2026-08-23','2026-08-22',0),
('I262','B132','24PHBPHA014',NULL,'L003','2026-08-09','2026-08-23','2026-08-23',0),
('I263','B143','25BAHUMA021',NULL,'L004','2026-08-10','2026-08-24','2026-08-24',0),
('I264','B154','23MCCOMP028',NULL,'L005','2026-08-10','2026-08-24','2026-08-26',20),
('I265','B165','26BTIT035',NULL,'L006','2026-08-11','2026-08-25','2026-08-29',40),
('I266','B176',NULL,'19AI001','L007','2026-08-11','2026-09-10','2026-09-10',0),
('I267','B187',NULL,'26CS001','L001','2026-08-12','2026-09-11','2026-09-09',0),
('I268','B198',NULL,'24MC001','L002','2026-08-12','2026-09-11','2026-09-12',5),
('I269','B209',NULL,'22MB001','L003','2026-08-13','2026-09-12','2026-09-12',0),
('I270','B220',NULL,'20BP001','L004','2026-08-13','2026-09-12','2026-09-18',30),
('I271','B231','26BTEEE007',NULL,'L005','2026-08-14','2026-08-28','2026-08-28',0),
('I272','B242','24PHBPHA014',NULL,'L006','2026-08-14','2026-08-28',NULL,0),
('I273','B103','25BAHUMA021',NULL,'L007','2026-08-15','2026-08-29',NULL,0),
('I274','B114','23MCCOMP028',NULL,'L001','2026-08-15','2026-08-29',NULL,0),
('I275','B125','26BTIT035',NULL,'L002','2026-08-16','2026-08-30',NULL,0),
('I276','B136',NULL,'19AI001','L003','2026-08-16','2026-09-15',NULL,0),
('I277','B147',NULL,'26CS001','L004','2026-08-17','2026-09-16',NULL,0),
('I278','B158',NULL,'24MC001','L005','2026-08-17','2026-09-16',NULL,0),
('I279','B169',NULL,'22MB001','L006','2026-08-18','2026-09-17',NULL,0),
('I280','B180',NULL,'20BP001','L007','2026-08-18','2026-09-17','2026-09-14',0),
('I281','B191','26BTEEE007',NULL,'L001','2026-08-19','2026-09-02','2026-09-01',0),
('I282','B202','24PHBPHA014',NULL,'L002','2026-08-19','2026-09-02','2026-09-02',0),
('I283','B213','25BAHUMA021',NULL,'L003','2026-08-20','2026-09-03','2026-09-03',0),
('I284','B224','23MCCOMP028',NULL,'L004','2026-08-20','2026-09-03','2026-09-05',20),
('I285','B235','26BTIT035',NULL,'L005','2026-08-21','2026-09-04','2026-09-08',40),
('I286','B246',NULL,'19AI001','L006','2026-08-21','2026-09-20','2026-09-20',0),
('I287','B107',NULL,'26CS001','L007','2026-08-22','2026-09-21','2026-09-19',0),
('I288','B118',NULL,'24MC001','L001','2026-08-22','2026-09-21','2026-09-20',0),
('I289','B129',NULL,'22MB001','L002','2026-08-23','2026-09-22','2026-09-20',0),
('I290','B140',NULL,'20BP001','L003','2026-08-23','2026-09-22','2026-09-20',0),
('I291','B151','26BTEEE007',NULL,'L004','2026-08-24','2026-09-07','2026-09-07',0),
('I292','B162','24PHBPHA014',NULL,'L005','2026-08-24','2026-09-07',NULL,0),
('I293','B173','25BAHUMA021',NULL,'L006','2026-08-25','2026-09-08',NULL,0),
('I294','B184','23MCCOMP028',NULL,'L007','2026-08-25','2026-09-08',NULL,0),
('I295','B195','26BTIT035',NULL,'L001','2026-08-26','2026-09-09',NULL,0),
('I296','B206',NULL,'19AI001','L002','2026-08-26','2026-09-25',NULL,0),
('I297','B217',NULL,'26CS001','L003','2026-08-27','2026-09-26',NULL,0),
('I298','B228',NULL,'24MC001','L004','2026-08-27','2026-09-26',NULL,0),
('I299','B239',NULL,'22MB001','L005','2026-08-28','2026-09-27',NULL,0),
('I300','B250',NULL,'20BP001','L006','2026-08-28','2026-09-27','2026-09-20',0);
INSERT INTO Reservation (Reservation_Id, Book_Id, Roll_No, Faculty_Id, Reservation_Date, Expiry_Date, Status, Priority, Remarks) VALUES
('R001','B101','26PHPHAR009',NULL,'2026-07-30','2026-08-30','Active',2,'Student reservation'),
('R002','B110','25BAFINA018',NULL,'2026-07-30','2026-08-30','Active',2,'Student reservation'),
('R003','B125','24MCDATA027',NULL,'2026-07-31','2026-08-31','Active',2,'Student reservation'),
('R004','B137','23BTAIML036',NULL,'2026-07-31','2026-08-31','Active',2,'Student reservation'),
('R005','B149',NULL,'22PD001','2026-08-01','2026-09-01','Active',1,'Faculty priority reservation - waiting for available copy'),
('R006','B160',NULL,'22BP001','2026-08-01','2026-09-01','Active',1,'Faculty priority reservation - waiting for available copy'),
('R007','B171',NULL,'22MB001','2026-08-02','2026-09-02','Active',1,'Faculty priority reservation - waiting for available copy'),
('R008','B182','25BTCSE002',NULL,'2026-08-02','2026-09-02','Active',2,'Student reservation'),
('R009','B193','24PHBPHA011',NULL,'2026-08-03','2026-09-03','Active',2,'Student reservation'),
('R010','B204','23BABUSI020',NULL,'2026-08-03','2026-09-03','Active',2,'Student reservation'),
('R011','B215','25MCDATA029',NULL,'2026-08-04','2026-09-04','Active',2,'Student reservation'),
('R012','B226','24BAMARK038',NULL,'2026-08-04','2026-09-04','Active',2,'Student reservation'),
('R013','B237',NULL,'24MB001','2026-08-05','2026-09-05','Active',1,'Faculty priority reservation - waiting for available copy'),
('R014','B242',NULL,'24MC001','2026-08-05','2026-09-05','Active',1,'Faculty priority reservation - waiting for available copy'),
('R015','B247',NULL,'24CS001','2026-08-06','2026-09-06','Active',1,'Faculty priority reservation - waiting for available copy'),
('R016','B101','23BTAIML004',NULL,'2026-08-06','2026-09-06','Active',2,'Student reservation'),
('R017','B110','25PHBPHA013',NULL,'2026-08-07','2026-09-07','Active',2,'Student reservation'),
('R018','B125','24BAFINA022',NULL,'2026-08-07','2026-09-07','Active',2,'Student reservation'),
('R019','B137','26MCCYBE031',NULL,'2026-08-08','2026-09-08','Active',2,'Student reservation'),
('R020','B149','23BTCSE040',NULL,'2026-08-08','2026-09-08','Active',2,'Student reservation'),
('R021','B160',NULL,'26CS001','2026-08-09','2026-09-09','Active',1,'Faculty priority reservation - waiting for available copy'),
('R022','B171',NULL,'26AI001','2026-08-09','2026-09-09','Active',1,'Faculty priority reservation - waiting for available copy'),
('R023','B182',NULL,'26EC001','2026-08-10','2026-09-10','Active',1,'Faculty priority reservation - waiting for available copy'),
('R024','B193','24BTECE006',NULL,'2026-08-10','2026-09-10','Active',2,'Student reservation'),
('R025','B204','26PHPHAR015',NULL,'2026-08-11','2026-09-11','Active',2,'Student reservation'),
('R026','B215','23BABUSI024',NULL,'2026-08-11','2026-09-11','Active',2,'Student reservation'),
('R027','B226','25BTIT033',NULL,'2026-08-12','2026-09-12','Active',2,'Student reservation'),
('R028','B237',NULL,'19AI001','2026-08-12','2026-09-12','Active',1,'Faculty priority reservation - waiting for available copy'),
('R029','B242',NULL,'19EC001','2026-08-13','2026-09-13','Active',1,'Faculty priority reservation - waiting for available copy'),
('R030','B247',NULL,'19EE001','2026-08-13','2026-09-13','Active',1,'Faculty priority reservation - waiting for available copy'),
('R031','B101',NULL,'19PD001','2026-08-14','2026-09-14','Active',1,'Faculty priority reservation - waiting for available copy'),
('R032','B110','23BTEEE008',NULL,'2026-08-14','2026-09-14','Active',2,'Student reservation'),
('R033','B125','26BABUSI017',NULL,'2026-08-15','2026-09-15','Active',2,'Student reservation'),
('R034','B137','25MCCOMP026',NULL,'2026-08-15','2026-09-15','Active',2,'Student reservation'),
('R035','B149','26BTIT035',NULL,'2026-08-16','2026-09-16','Active',2,'Student reservation'),
('R036','B160',NULL,'21EE001','2026-08-16','2026-09-16','Active',1,'Faculty priority reservation - waiting for available copy'),
('R037','B171',NULL,'21PD001','2026-08-17','2026-09-17','Active',1,'Faculty priority reservation - waiting for available copy'),
('R038','B182',NULL,'21BP001','2026-08-17','2026-09-17','Active',1,'Faculty priority reservation - waiting for available copy'),
('R039','B193','26BTCSE001',NULL,'2026-08-18','2026-09-18','Active',2,'Student reservation'),
('R040','B204','25PHBPHA010',NULL,'2026-08-18','2026-09-18','Active',2,'Student reservation'),
('R041','B215','24BAMARK019',NULL,'2026-08-19','2026-09-19','Active',2,'Student reservation'),
('R042','B226','23MCCOMP028',NULL,'2026-08-19','2026-09-19','Active',2,'Student reservation'),
('R043','B237','25PHBPHA037',NULL,'2026-08-20','2026-09-20','Active',2,'Student reservation'),
('R044','B242',NULL,'23BP001','2026-08-20','2026-09-20','Active',1,'Faculty priority reservation - waiting for available copy'),
('R045','B247',NULL,'23MB001','2026-08-21','2026-09-21','Active',1,'Faculty priority reservation - waiting for available copy'),
('R046','B248',NULL,'23MC001','2026-08-21','2026-09-21','Active',1,'Faculty priority reservation - waiting for available copy'),
('R047','B111','24BTAIML003',NULL,'2026-08-22','2026-09-22','Active',2,'Student reservation'),
('R048','B124','23PHPHAR012',NULL,'2026-08-22','2026-09-22','Active',2,'Student reservation'),
('R049','B137','25BAHUMA021',NULL,'2026-08-23','2026-09-23','Active',2,'Student reservation'),
('R050','B150','24MCCOMP030',NULL,'2026-08-23','2026-09-23','Active',2,'Student reservation'),
('R051','B163','26MCCOMP039',NULL,'2026-08-24','2026-09-24','Active',2,'Student reservation'),
('R052','B176',NULL,'25MC001','2026-08-24','2026-09-24','Active',1,'Faculty priority reservation - waiting for available copy'),
('R053','B189',NULL,'25CS001','2026-08-25','2026-09-25','Active',1,'Faculty priority reservation - waiting for available copy'),
('R054','B202',NULL,'25AI001','2026-08-25','2026-09-25','Active',1,'Faculty priority reservation - waiting for available copy'),
('R055','B215','25BTECE005',NULL,'2026-08-26','2026-09-26','Active',2,'Student reservation'),
('R056','B228','24PHBPHA014',NULL,'2026-08-26','2026-09-26','Active',2,'Student reservation'),
('R057','B241','26BAMARK023',NULL,'2026-08-27','2026-09-27','Active',2,'Student reservation'),
('R058','B104','23MCCYBE032',NULL,'2026-08-27','2026-09-27','Active',2,'Student reservation'),
('R059','B117',NULL,'18CS001','2026-08-28','2026-09-28','Active',1,'Faculty priority reservation - waiting for available copy'),
('R060','B130',NULL,'18AI001','2026-08-28','2026-09-28','Active',1,'Faculty priority reservation - waiting for available copy'),
('R061','B143',NULL,'18EC001','2026-08-29','2026-09-29','Completed',1,'Faculty priority reservation'),
('R062','B156',NULL,'18EE001','2026-08-29','2026-09-29','Completed',1,'Faculty priority reservation'),
('R063','B169','26BTEEE007',NULL,'2026-08-30','2026-09-30','Completed',2,'Student reservation'),
('R064','B182','23PHBPHA016',NULL,'2026-08-30','2026-09-30','Completed',2,'Student reservation'),
('R065','B195','26MCCOMP025',NULL,'2026-08-31','2026-09-30','Completed',2,'Student reservation'),
('R066','B208','24BTIT034',NULL,'2026-08-31','2026-09-30','Completed',2,'Student reservation'),
('R067','B221',NULL,'20EC001','2026-09-01','2026-10-01','Completed',1,'Faculty priority reservation'),
('R068','B234',NULL,'20EE001','2026-09-01','2026-10-01','Completed',1,'Faculty priority reservation'),
('R069','B247',NULL,'20PD001','2026-09-02','2026-10-02','Completed',1,'Faculty priority reservation'),
('R070','B110',NULL,'20BP001','2026-09-02','2026-10-02','Completed',1,'Faculty priority reservation'),
('R071','B123','26PHPHAR009',NULL,'2026-09-03','2026-10-03','Completed',2,'Student reservation'),
('R072','B136','25BAFINA018',NULL,'2026-09-03','2026-10-03','Completed',2,'Student reservation'),
('R073','B149','24MCDATA027',NULL,'2026-09-04','2026-10-04','Completed',2,'Student reservation'),
('R074','B162','23BTAIML036',NULL,'2026-09-04','2026-10-04','Completed',2,'Student reservation'),
('R075','B175',NULL,'22PD001','2026-09-05','2026-10-05','Completed',1,'Faculty priority reservation'),
('R076','B188',NULL,'22BP001','2026-09-05','2026-10-05','Completed',1,'Faculty priority reservation'),
('R077','B201',NULL,'22MB001','2026-09-06','2026-10-06','Completed',1,'Faculty priority reservation'),
('R078','B214','25BTCSE002',NULL,'2026-09-06','2026-10-06','Completed',2,'Student reservation'),
('R079','B227','24PHBPHA011',NULL,'2026-09-07','2026-10-07','Completed',2,'Student reservation'),
('R080','B240','23BABUSI020',NULL,'2026-09-07','2026-10-07','Completed',2,'Student reservation'),
('R081','B103','25MCDATA029',NULL,'2026-09-08','2026-10-08','Expired',2,'Student reservation'),
('R082','B116','24BAMARK038',NULL,'2026-09-08','2026-10-08','Expired',2,'Student reservation'),
('R083','B129',NULL,'24MB001','2026-09-09','2026-10-09','Expired',1,'Faculty priority reservation'),
('R084','B142',NULL,'24MC001','2026-09-09','2026-10-09','Expired',1,'Faculty priority reservation'),
('R085','B155',NULL,'24CS001','2026-09-10','2026-10-10','Expired',1,'Faculty priority reservation'),
('R086','B168','23BTAIML004',NULL,'2026-09-10','2026-10-10','Expired',2,'Student reservation'),
('R087','B181','25PHBPHA013',NULL,'2026-09-11','2026-10-11','Expired',2,'Student reservation'),
('R088','B194','24BAFINA022',NULL,'2026-09-11','2026-10-11','Expired',2,'Student reservation'),
('R089','B207','26MCCYBE031',NULL,'2026-09-12','2026-10-12','Expired',2,'Student reservation'),
('R090','B220','23BTCSE040',NULL,'2026-09-12','2026-10-12','Expired',2,'Student reservation'),
('R091','B233',NULL,'26CS001','2026-09-13','2026-10-13','Cancelled',1,'Faculty priority reservation'),
('R092','B246',NULL,'26AI001','2026-09-13','2026-10-13','Cancelled',1,'Faculty priority reservation'),
('R093','B109',NULL,'26EC001','2026-09-14','2026-10-14','Cancelled',1,'Faculty priority reservation'),
('R094','B122','24BTECE006',NULL,'2026-09-14','2026-10-14','Cancelled',2,'Student reservation'),
('R095','B135','26PHPHAR015',NULL,'2026-09-15','2026-10-15','Cancelled',2,'Student reservation'),
('R096','B148','23BABUSI024',NULL,'2026-09-15','2026-10-15','Cancelled',2,'Student reservation'),
('R097','B161','25BTIT033',NULL,'2026-09-16','2026-10-16','Cancelled',2,'Student reservation'),
('R098','B174',NULL,'19AI001','2026-09-16','2026-10-16','Cancelled',1,'Faculty priority reservation'),
('R099','B187',NULL,'19EC001','2026-09-17','2026-10-17','Cancelled',1,'Faculty priority reservation'),
('R100','B200',NULL,'19EE001','2026-09-17','2026-10-17','Cancelled',1,'Faculty priority reservation');

-- TABLE STRUCTURE CHECKS

SHOW TABLES;
DESCRIBE Author;
DESCRIBE Publisher;
DESCRIBE Category;
DESCRIBE Student;
DESCRIBE Librarian;
DESCRIBE Books;
DESCRIBE Availability;
DESCRIBE issue;
DESCRIBE Reservation;

SELECT * FROM Reservation;
--  Display all student records
SELECT * FROM Student;
--  Display all faculty records
SELECT * FROM Faculty;
--  Display all book records
SELECT * FROM Books;
--  Display all author records
SELECT * FROM Author;
--  Display all category records
SELECT * FROM Category;
--  Display all publisher records
SELECT * FROM Publisher;
--  Display all librarian records
SELECT * FROM Librarian;
--  Display all issue records
SELECT * FROM issue;
--  Display all returned issue records
SELECT * FROM issue WHERE Return_Date IS NOT NULL;
--  Display all Computer Science books
SELECT * FROM Books WHERE Category_Id='CC001';
--  Display all Database books
SELECT * FROM Books WHERE Category_Id='CD001';
--  Display all Artificial Intelligence books
SELECT * FROM Books WHERE Category_Id='CA001';
--  Display all CSE students
SELECT * FROM Student WHERE Department='CSE';
--  Display all AIML students
SELECT * FROM Student WHERE Department='AIML';
--  Display all B.Tech students
SELECT * FROM Student WHERE Course='B.Tech';
--  Display all Pharmacy students
SELECT * FROM Student WHERE Course='Pharmacy';
--  Display all faculty in CSE
SELECT * FROM Faculty WHERE Department='CSE';
--  Display books published after 2020
SELECT * FROM Books WHERE Publication_Year>2020;
--  Display available books
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Available_Copies>0;
--  Display books with more than 10 total copies
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies>10;
--  Display overdue issues
SELECT * FROM issue WHERE Return_Date IS NULL AND Due_Date<CURDATE();
-- Display books alphabetically
SELECT * FROM Books ORDER BY Book_Title ASC;
--  Display students alphabetically
SELECT * FROM Student ORDER BY Full_Name ASC;
--  Display books with highest total quantity first
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id ORDER BY a.Total_Copies DESC;
--  Display first 10 books
SELECT * FROM Books LIMIT 10;

-- AGGREGATE FUNCTION QUERIES

SELECT COUNT(*) AS Total_Students FROM Student;
SELECT COUNT(*) AS Total_Faculty FROM Faculty;
SELECT COUNT(*) AS Total_Books FROM Books;
SELECT COUNT(*) AS Total_Authors FROM Author;
SELECT COUNT(*) AS Total_Publishers FROM Publisher;
SELECT COUNT(*) AS Total_Librarians FROM Librarian;
SELECT COUNT(*) AS Total_Issues FROM issue;
SELECT COUNT(*) AS Total_Returns FROM issue WHERE Return_Date IS NOT NULL;
SELECT SUM(Total_Copies) AS Total_Book_Quantity FROM Availability;
SELECT SUM(Available_Copies) AS Total_Available_Books FROM Availability;
SELECT AVG(Total_Copies) AS Average_Quantity FROM Availability;
SELECT AVG(Available_Copies) AS Average_Available FROM Availability;
SELECT MAX(Fine) AS Maximum_Fine FROM issue;
SELECT MIN(Fine) AS Minimum_Fine FROM issue;
SELECT AVG(Fine) AS Average_Fine FROM issue;
SELECT SUM(Fine) AS Total_Fine FROM issue;
SELECT Category_Id,COUNT(*) AS Total_Books FROM Books GROUP BY Category_Id;
SELECT Department,COUNT(*) AS Total_Students FROM Student GROUP BY Department;
SELECT Course,COUNT(*) AS Total_Students FROM Student GROUP BY Course;
SELECT Department,COUNT(*) AS Total_Faculty FROM Faculty GROUP BY Department;
SELECT Publication_Year,COUNT(*) AS Total_Books FROM Books GROUP BY Publication_Year ORDER BY Publication_Year;
SELECT CASE WHEN Return_Date IS NULL AND Due_Date<CURDATE() THEN 'Overdue' WHEN Return_Date IS NULL THEN 'Issued' ELSE 'Returned' END AS Status, COUNT(*) AS Total_Records FROM issue GROUP BY Status;

-- WHERE , LIKE , BETWEEN , IN , DISTINCT , LIMIT

SELECT * FROM Student WHERE Department='CSE';
SELECT * FROM Student WHERE Department='ECE';
SELECT * FROM Student WHERE `Year`=2;
SELECT * FROM Books WHERE Publication_Year BETWEEN 2020 AND 2024;
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies BETWEEN 5 AND 15;
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Available_Copies BETWEEN 1 AND 10;
SELECT * FROM Student WHERE Full_Name LIKE 'S%';
SELECT * FROM Student WHERE Full_Name LIKE '%Kumar';
SELECT * FROM Books WHERE Book_Title LIKE 'Data%';
SELECT * FROM Books WHERE Book_Title LIKE '%Java%';
SELECT * FROM Books WHERE Category_Id IN('CC001','CD001');
SELECT * FROM Student WHERE Department IN('CSE','AIML','IT');
SELECT * FROM Books WHERE Category_Id<>'CC001';
SELECT * FROM Student WHERE Phone LIKE '+918000%';
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies>a.Available_Copies;
SELECT DISTINCT Department FROM Student;
SELECT DISTINCT Course FROM Student;
SELECT * FROM Books ORDER BY Publication_Year DESC LIMIT 10;
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id ORDER BY a.Total_Copies DESC LIMIT 5;
SELECT * FROM Student WHERE Email LIKE '%gmail%';

-- JOIN QUERIES

--  Student details with issued books
SELECT s.Roll_No,s.Full_Name,s.Roll_No,b.Book_Title,i.Issue_Date,i.Due_Date
FROM Student s JOIN issue i ON s.Roll_No=i.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id;
--  Faculty details with issued books
SELECT f.Faculty_Id,f.Full_Name,b.Book_Title,i.Issue_Date,i.Due_Date
FROM Faculty f JOIN issue i ON f.Faculty_Id=i.Faculty_Id JOIN Books b ON i.Book_Id=b.Book_Id;
--  Issued books with librarian details
SELECT i.Issue_Id,b.Book_Title,l.Lib_Name,i.Issue_Date
FROM issue i JOIN Books b ON i.Book_Id=b.Book_Id JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id;
--  Returned student/faculty transactions
SELECT COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       b.Book_Title,i.Return_Date,i.Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NOT NULL;
--  Book title with author name
SELECT b.Book_Id,b.Book_Title,a.Author_Name FROM Books b JOIN Author a ON b.Author_Id=a.Author_Id;
--  Book title with publisher name
SELECT b.Book_Id,b.Book_Title,p.Publisher_Name FROM Books b JOIN Publisher p ON b.Publisher_Id=p.Publisher_Id;
--  Book title with category name
SELECT b.Book_Id,b.Book_Title,c.Category_Name FROM Books b JOIN Category c ON b.Category_Id=c.Category_Id;
--  Student, book and librarian details
SELECT s.Full_Name,b.Book_Title,l.Lib_Name
FROM issue i JOIN Student s ON i.Roll_No=s.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id;
--  Faculty, book and librarian details
SELECT f.Full_Name,b.Book_Title,l.Lib_Name
FROM issue i JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id JOIN Books b ON i.Book_Id=b.Book_Id JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id;
--  Overdue books with borrower details
SELECT COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       b.Book_Title,i.Due_Date
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NULL AND i.Due_Date<CURDATE();
--  Currently issued books
SELECT COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,b.Book_Title,i.Issue_Date
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NULL;
--  Complete transaction details
SELECT i.Issue_Id,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       b.Book_Title,l.Lib_Name,i.Issue_Date,i.Due_Date,
       CASE WHEN i.Return_Date IS NULL AND i.Due_Date<CURDATE() THEN 'Overdue'
            WHEN i.Return_Date IS NULL THEN 'Issued' ELSE 'Returned' END AS Status,
       i.Return_Date,i.Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id;
--  Books borrowed by B.Tech students
SELECT s.Full_Name,s.Course,b.Book_Title
FROM issue i JOIN Student s ON i.Roll_No=s.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id
WHERE s.Course='B.Tech';
--  Books borrowed by Pharmacy students
SELECT s.Full_Name,s.Course,b.Book_Title
FROM issue i JOIN Student s ON i.Roll_No=s.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id
WHERE s.Course='Pharmacy';
--  Students with returned books only
SELECT s.Full_Name,b.Book_Title,i.Return_Date
FROM Student s JOIN issue i ON s.Roll_No=i.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NOT NULL;
--  Faculty with returned books only
SELECT f.Full_Name,b.Book_Title,i.Return_Date
FROM Faculty f JOIN issue i ON f.Faculty_Id=i.Faculty_Id JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NOT NULL;
-- Books with category and author
SELECT b.Book_Title,c.Category_Name,a.Author_Name
FROM Books b JOIN Category c ON b.Category_Id=c.Category_Id JOIN Author a ON b.Author_Id=a.Author_Id;
--  Books with publisher and author
SELECT b.Book_ID,b.Book_Title,p.Publisher_Name,a.Author_Name
FROM Books b JOIN Publisher p ON b.Publisher_Id=p.Publisher_Id JOIN Author a ON b.Author_Id=a.Author_Id;
--  Librarian-wise issued books
SELECT l.Lib_Name,b.Book_Title,i.Issue_Date FROM issue i JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id JOIN Books b ON i.Book_Id=b.Book_Id;
--  Complete student borrowing history
SELECT s.Full_Name,b.Book_Title,i.Issue_Date,i.Due_Date,
       CASE WHEN i.Return_Date IS NULL AND i.Due_Date<CURDATE() THEN 'Overdue'
            WHEN i.Return_Date IS NULL THEN 'Issued' ELSE 'Returned' END AS Status,
       i.Return_Date
FROM Student s JOIN issue i ON s.Roll_No=i.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id
ORDER BY s.Full_Name;


--  RIGHT JOIN - display all authors, including authors with no books
SELECT a.Author_Id,a.Author_Name,b.Book_Id,b.Book_Title
FROM Books b
RIGHT JOIN Author a ON b.Author_Id=a.Author_Id
ORDER BY a.Author_Name;

--  SELF JOIN - find books from the same category
SELECT b1.Book_Title AS Book_1,
       b2.Book_Title AS Book_2,
       b1.Category_Id
FROM Books b1
JOIN Books b2
  ON b1.Category_Id=b2.Category_Id
 AND b1.Book_Id<b2.Book_Id
ORDER BY b1.Category_Id,b1.Book_Title,b2.Book_Title;

--  CROSS JOIN - demonstrate all possible Student-Category combinations
-- (limited for presentation/testing)
SELECT s.Roll_No,s.Full_Name,c.Category_Id,c.Category_Name
FROM Student s
CROSS JOIN Category c
LIMIT 20;

-- GROUP BY & HAVING QUERIES

SELECT Category_Id,COUNT(*) AS Total_Books FROM Books GROUP BY Category_Id;
SELECT Department,COUNT(*) AS Total_Students FROM Student GROUP BY Department;
SELECT Course,COUNT(*) AS Total_Students FROM Student GROUP BY Course;
SELECT Librarian_Id,COUNT(*) AS Total_Issued FROM issue GROUP BY Librarian_Id;
SELECT Roll_No,COUNT(*) AS Total_Borrowed FROM issue WHERE Roll_No IS NOT NULL GROUP BY Roll_No;
SELECT Faculty_Id,COUNT(*) AS Total_Borrowed FROM issue WHERE Faculty_Id IS NOT NULL GROUP BY Faculty_Id;
SELECT CASE WHEN Return_Date IS NULL AND Due_Date<CURDATE() THEN 'Overdue' WHEN Return_Date IS NULL THEN 'Issued' ELSE 'Returned' END AS Status,COUNT(*) AS Total_Records FROM issue GROUP BY Status;
SELECT Department,COUNT(*) AS Total_Students FROM Student GROUP BY Department HAVING COUNT(*)>10;
SELECT Category_Id,COUNT(*) AS Total_Books FROM Books GROUP BY Category_Id HAVING COUNT(*)>15;
SELECT Librarian_Id,COUNT(*) AS Total_Issued FROM issue GROUP BY Librarian_Id HAVING COUNT(*)>10;
SELECT Roll_No,COUNT(*) AS Total_Borrowed FROM issue WHERE Roll_No IS NOT NULL GROUP BY Roll_No HAVING COUNT(*)>1;
SELECT Publication_Year,COUNT(*) AS Total_Books FROM Books GROUP BY Publication_Year HAVING COUNT(*)>5;
SELECT b.Category_Id,AVG(a.Total_Copies) AS Average_Quantity FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id GROUP BY b.Category_Id HAVING AVG(a.Total_Copies)>8;
SELECT Department,AVG(`Year`) AS Average_Year FROM Student GROUP BY Department HAVING AVG(`Year`)>2;
SELECT Issue_Date,COUNT(*) AS Total_Issues FROM issue GROUP BY Issue_Date HAVING COUNT(*)>1;
SELECT Return_Date,COUNT(*) AS Total_Returns FROM issue WHERE Return_Date IS NOT NULL GROUP BY Return_Date HAVING COUNT(*)>1;

-- SUBQUERY QUERIES

SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies=(SELECT MAX(Total_Copies) FROM Availability);
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies=(SELECT MIN(Total_Copies) FROM Availability);
SELECT Roll_No,COUNT(*) AS Total_Borrowed FROM issue WHERE Roll_No IS NOT NULL GROUP BY Roll_No
HAVING COUNT(*)=(SELECT MAX(Total_Borrowed) FROM (SELECT COUNT(*) AS Total_Borrowed FROM issue WHERE Roll_No IS NOT NULL GROUP BY Roll_No) AS BorrowCount);
SELECT * FROM issue WHERE Fine=(SELECT MAX(Fine) FROM issue);
SELECT * FROM Books WHERE Publication_Year=(SELECT MAX(Publication_Year) FROM Books);
SELECT * FROM Student WHERE Roll_No IN(SELECT Roll_No FROM issue WHERE Roll_No IS NOT NULL);
SELECT * FROM Student WHERE Roll_No NOT IN(SELECT Roll_No FROM issue WHERE Roll_No IS NOT NULL);
SELECT * FROM Faculty WHERE Faculty_Id IN(SELECT Faculty_Id FROM issue WHERE Faculty_Id IS NOT NULL);
SELECT * FROM Books WHERE Book_Id NOT IN(SELECT Book_Id FROM issue);
SELECT * FROM Librarian WHERE Librarian_Id IN(SELECT Librarian_Id FROM issue);
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Total_Copies>(SELECT AVG(Total_Copies) FROM Availability);
SELECT b.* FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE a.Available_Copies<(SELECT AVG(Available_Copies) FROM Availability);
SELECT * FROM Student WHERE Department=(SELECT Department FROM Student GROUP BY Department ORDER BY COUNT(*) DESC LIMIT 1);
SELECT * FROM Books WHERE Publication_Year=(SELECT MIN(Publication_Year) FROM Books);
SELECT * FROM issue WHERE Issue_Date=(SELECT MAX(Issue_Date) FROM issue);
SELECT * FROM issue WHERE Return_Date=(SELECT MAX(Return_Date) FROM issue);

-- VIEWS

DROP VIEW IF EXISTS AvailableBooks;
CREATE VIEW AvailableBooks AS
SELECT b.Book_Id,b.Book_Title,b.Course,a.Total_Copies,a.Available_Copies,a.Status
FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id
WHERE a.Available_Copies>0;

SELECT * from AvailableBooks;

DROP VIEW IF EXISTS IssuedBooks;
CREATE VIEW IssuedBooks AS
SELECT i.Issue_Id,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Gold' ELSE 'Silver' END AS Member_Type,
       b.Book_Title,b.Course,i.Issue_Date,i.Due_Date,
       CASE WHEN i.Due_Date<CURDATE() THEN 'Overdue' ELSE 'Issued' END AS Status
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NULL;

SELECT * FROM IssuedBooks;

DROP VIEW IF EXISTS ReturnedBooks;
CREATE VIEW ReturnedBooks AS
SELECT i.Issue_Id,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Gold' ELSE 'Silver' END AS Member_Type,
       b.Book_Title,i.Issue_Date,i.Due_Date,i.Return_Date,i.Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NOT NULL;

SELECT * FROM ReturnedBooks;

DROP VIEW IF EXISTS OverdueBooks;
CREATE VIEW OverdueBooks AS
SELECT i.Issue_Id,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Gold' ELSE 'Silver' END AS Member_Type,
       b.Book_Title,i.Issue_Date,i.Due_Date,
       DATEDIFF(CURDATE(),i.Due_Date) AS Overdue_Days,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN GREATEST(DATEDIFF(CURDATE(),i.Due_Date),0)*5
            ELSE GREATEST(DATEDIFF(CURDATE(),i.Due_Date),0)*10 END AS Estimated_Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NULL AND i.Due_Date<CURDATE();

SELECT * FROM OverdueBooks;

DROP VIEW IF EXISTS LibraryTransactions;
CREATE VIEW LibraryTransactions AS
SELECT i.Issue_Id,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Gold' ELSE 'Silver' END AS Member_Type,
       COALESCE(s.Course,'Faculty') AS Course,
       COALESCE(s.Department,f.Department) AS Department,
       b.Book_Title,b.Course AS Book_Course,
       l.Lib_Name AS Librarian_Name,i.Issue_Date,i.Due_Date,
       CASE WHEN i.Return_Date IS NULL AND i.Due_Date<CURDATE() THEN 'Overdue'
            WHEN i.Return_Date IS NULL THEN 'Issued' ELSE 'Returned' END AS Status,
       i.Return_Date,i.Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
JOIN Librarian l ON i.Librarian_Id=l.Librarian_Id;

SELECT * FROM LibraryTransactions;

-- FUNCTIONS
-- ---------------------------------------------------------------
DROP FUNCTION IF EXISTS TotalFine;
DROP FUNCTION IF EXISTS TotalBooks;
DROP FUNCTION IF EXISTS TotalStudents;
DROP FUNCTION IF EXISTS TotalFaculty;
DROP FUNCTION IF EXISTS TotalIssues;
DROP FUNCTION IF EXISTS MaximumFine;
DROP FUNCTION IF EXISTS UserPriority;
DROP FUNCTION IF EXISTS UserLoanDays;
DROP FUNCTION IF EXISTS UserFineRate;
DROP FUNCTION IF EXISTS CalculateFine;

DELIMITER $$
CREATE FUNCTION TotalFine()
RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT COALESCE(SUM(Fine),0) INTO v_total FROM issue;
    RETURN v_total;
END$$

SELECT TotalFine() AS Total_Fine$$

CREATE FUNCTION TotalBooks()
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total FROM Books;
    RETURN v_total;
END$$

SELECT TotalBooks() AS Total_Books$$

CREATE FUNCTION TotalStudents()
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total FROM Student;
    RETURN v_total;
END$$

SELECT TotalStudents() AS Total_Students$$

CREATE FUNCTION TotalFaculty()
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total FROM Faculty;
    RETURN v_total;
END$$

SELECT TotalFaculty() AS Total_Faculty$$

CREATE FUNCTION TotalIssues()
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total FROM issue;
    RETURN v_total;
END$$

SELECT TotalIssues() AS Total_Issues$$

CREATE FUNCTION MaximumFine()
RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_fine DECIMAL(10,2);
    SELECT COALESCE(MAX(Fine),0) INTO v_fine FROM issue;
    RETURN v_fine;
END$$

SELECT MaximumFine() AS Maximum_Fine$$

-- Gold Faculty = priority 1, Silver Student = priority 2.
CREATE FUNCTION UserPriority(p_borrower_id VARCHAR(20))
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    IF EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id) THEN RETURN 1; END IF;
    RETURN 2;
END$$

SELECT UserPriority('20EC001') AS Faculty_Priority,UserPriority('26BTCSE001') AS Student_Priority;

-- Gold Faculty = 30 days, Silver Student = 14 days.
CREATE FUNCTION UserLoanDays(p_borrower_id VARCHAR(20))
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    IF EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id) THEN RETURN 30; END IF;
    RETURN 14;
END$$

SELECT UserLoanDays('20EC001') AS Faculty_Loan_Days,UserLoanDays('26BTCSE001') AS Student_Loan_Days;

-- Gold Faculty = Rs.5/day, Silver Student = Rs.10/day.
CREATE FUNCTION UserFineRate(p_borrower_id VARCHAR(20))
RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
    IF EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id) THEN RETURN 5.00; END IF;
    RETURN 10.00;
END$$

SELECT UserFineRate('20EC001') AS Faculty_Fine_Per_Day,UserFineRate('26BTCSE001') AS Student_Fine_Per_Day;

CREATE FUNCTION CalculateFine(
    p_borrower_id VARCHAR(20),
    p_due_date DATE,
    p_return_date DATE
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_days INT;
    SET v_days=GREATEST(DATEDIFF(p_return_date,p_due_date),0);
    RETURN v_days*UserFineRate(p_borrower_id);
END$$

SELECT CalculateFine('20EC001','2026-09-01','2026-10-06') AS Faculty_Fine,CalculateFine('26BTCSE001','2026-09-01','2026-09-21') AS Student_Fine;
DELIMITER ;

-- TRIGGERS


DROP TRIGGER IF EXISTS trg_AutoLoanPeriod;
DROP TRIGGER IF EXISTS trg_BookIssue;
DROP TRIGGER IF EXISTS trg_BookReturn;
DROP TRIGGER IF EXISTS trg_AutoFine;
DROP TRIGGER IF EXISTS trg_ReservationPriority;

DELIMITER $$


-- ===============================================================
-- TRIGGER 1: AUTO LOAN PERIOD
-- Faculty = 30 days
-- Student = 14 days
-- ===============================================================

CREATE TRIGGER trg_AutoLoanPeriod
BEFORE INSERT ON issue
FOR EACH ROW
BEGIN

    IF NEW.Faculty_Id IS NOT NULL THEN

        SET NEW.Due_Date =
            DATE_ADD(NEW.Issue_Date, INTERVAL 30 DAY);

    ELSE

        SET NEW.Due_Date =
            DATE_ADD(NEW.Issue_Date, INTERVAL 14 DAY);

    END IF;

END$$


-- ===============================================================
-- TEST TRIGGER 1
-- Student should get 14 days
-- ===============================================================

INSERT INTO issue
(
    Issue_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Librarian_Id,
    Issue_Date,
    Due_Date,
    Return_Date,
    Fine
)
VALUES
(
    'TRG001',
    'B103',
    '26BTCSE001',
    NULL,
    'L001',
    CURDATE(),
    NULL,
    NULL,
    0
)$$

SELECT
    Issue_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Issue_Date,
    Due_Date,
    Return_Date,
    Fine
FROM issue
WHERE Issue_Id = 'TRG001'$$


-- ===============================================================
-- TRIGGER 2: BOOK ISSUE / AVAILABILITY UPDATE
-- ===============================================================

CREATE TRIGGER trg_BookIssue
AFTER INSERT ON issue
FOR EACH ROW
BEGIN

    IF NEW.Return_Date IS NULL THEN

        UPDATE Availability
        SET
            Available_Copies =
                GREATEST(Available_Copies - 1, 0),

            Issued_Copies =
                Issued_Copies + 1

        WHERE Book_Id = NEW.Book_Id;

    END IF;

END$$


-- ===============================================================
-- TEST TRIGGER 2
-- Check availability after issuing a book
-- ===============================================================

SELECT
    Book_Id,
    Total_Copies,
    Available_Copies,
    Issued_Copies,
    Lost_Copies,
    Damaged_Copies,
    Status
FROM Availability
WHERE Book_Id = 'B103'$$


-- ===============================================================
-- TRIGGER 3: BOOK RETURN / AVAILABILITY UPDATE
-- ===============================================================

CREATE TRIGGER trg_BookReturn
AFTER UPDATE ON issue
FOR EACH ROW
BEGIN

    IF OLD.Return_Date IS NULL
       AND NEW.Return_Date IS NOT NULL THEN

        UPDATE Availability
        SET
            Available_Copies =
                Available_Copies + 1,

            Issued_Copies =
                GREATEST(Issued_Copies - 1, 0)

        WHERE Book_Id = NEW.Book_Id;

    END IF;

END$$


-- ===============================================================
-- TEST TRIGGER 3
-- Return the test book
-- ===============================================================

UPDATE issue
SET Return_Date = CURDATE()
WHERE Issue_Id = 'TRG001'$$

SELECT
    Issue_Id,
    Book_Id,
    Issue_Date,
    Due_Date,
    Return_Date,
    Fine
FROM issue
WHERE Issue_Id = 'TRG001'$$

SELECT
    Book_Id,
    Total_Copies,
    Available_Copies,
    Issued_Copies,
    Lost_Copies,
    Damaged_Copies,
    Status
FROM Availability
WHERE Book_Id = 'B103'$$


-- ===============================================================
-- TRIGGER 4: AUTO FINE
-- ===============================================================

CREATE TRIGGER trg_AutoFine
BEFORE UPDATE ON issue
FOR EACH ROW
BEGIN

    IF NEW.Return_Date IS NOT NULL THEN

        IF NEW.Return_Date > NEW.Due_Date THEN

            IF NEW.Faculty_Id IS NOT NULL THEN

                SET NEW.Fine =
                    DATEDIFF(
                        NEW.Return_Date,
                        NEW.Due_Date
                    ) * 5.00;

            ELSE

                SET NEW.Fine =
                    DATEDIFF(
                        NEW.Return_Date,
                        NEW.Due_Date
                    ) * 10.00;

            END IF;

        ELSE

            SET NEW.Fine = 0;

        END IF;

    END IF;

END$$


-- ===============================================================
-- TEST TRIGGER 4
-- Create an overdue student issue
-- ===============================================================

INSERT INTO issue
(
    Issue_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Librarian_Id,
    Issue_Date,
    Due_Date,
    Return_Date,
    Fine
)
VALUES
(
    'TRG002',
    'B104',
    '26BTCSE001',
    NULL,
    'L001',
    DATE_SUB(CURDATE(), INTERVAL 30 DAY),
    DATE_SUB(CURDATE(), INTERVAL 10 DAY),
    NULL,
    0
)$$

UPDATE issue
SET Return_Date = CURDATE()
WHERE Issue_Id = 'TRG002'$$

SELECT
    Issue_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Issue_Date,
    Due_Date,
    Return_Date,
    Fine
FROM issue
WHERE Issue_Id = 'TRG002'$$


-- ===============================================================
-- TRIGGER 5: RESERVATION PRIORITY
-- Faculty = Priority 1
-- Student = Priority 2
-- ===============================================================

CREATE TRIGGER trg_ReservationPriority
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN

    IF NEW.Faculty_Id IS NOT NULL THEN

        SET NEW.Priority = 1;

    ELSE

        SET NEW.Priority = 2;

    END IF;

END$$


-- ===============================================================
-- TEST TRIGGER 5
-- Student reservation should get Priority 2
-- ===============================================================

INSERT INTO Reservation
(
    Reservation_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Reservation_Date,
    Expiry_Date,
    Status,
    Priority,
    Remarks
)
VALUES
(
    'TRG_RES001',
    'B105',
    '26BTCSE001',
    NULL,
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 7 DAY),
    'Active',
    NULL,
    'Trigger test - Student reservation'
)$$

SELECT
    Reservation_Id,
    Book_Id,
    Roll_No,
    Faculty_Id,
    Reservation_Date,
    Expiry_Date,
    Status,
    Priority,
    Remarks
FROM Reservation
WHERE Reservation_Id = 'TRG_RES001'$$


-- ===============================================================
-- END OF TRIGGERS
-- ===============================================================

DELIMITER ;

-- STORED PROCEDURES

DROP PROCEDURE IF EXISTS GetAllStudents;
DROP PROCEDURE IF EXISTS GetAllFaculty;
DROP PROCEDURE IF EXISTS GetAllBooks;
DROP PROCEDURE IF EXISTS GetIssuedBooks;
DROP PROCEDURE IF EXISTS GetOverdueBooks;
DROP PROCEDURE IF EXISTS GetBooksByCategory;
DROP PROCEDURE IF EXISTS GetStudentsByDepartment;
DROP PROCEDURE IF EXISTS GetBooksByYear;
DROP PROCEDURE IF EXISTS GetReturnDetails;
DROP PROCEDURE IF EXISTS GetAvailableBooks;
DROP PROCEDURE IF EXISTS GetLibraryTransactions;
DROP PROCEDURE IF EXISTS sp_IssueBook;
DROP PROCEDURE IF EXISTS sp_ReturnBook;
DROP PROCEDURE IF EXISTS sp_ReserveBook;
DROP PROCEDURE IF EXISTS sp_RefreshReservationStatus;
DROP PROCEDURE IF EXISTS sp_RecommendBooks;
DELIMITER $$
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM Student;
END$$

CALL GetAllStudents()$$

CREATE PROCEDURE GetAllFaculty()
BEGIN
    SELECT * FROM Faculty;
END$$

CALL GetAllFaculty()$$

CREATE PROCEDURE GetAllBooks()
BEGIN
    SELECT * FROM Books;
END$$

CALL GetAllBooks()$$

CREATE PROCEDURE GetIssuedBooks()
BEGIN
    SELECT * FROM IssuedBooks;
END$$

CALL GetIssuedBooks()$$

CREATE PROCEDURE GetOverdueBooks()
BEGIN
    SELECT * FROM OverdueBooks;
END$$

CALL GetOverdueBooks()$$

CREATE PROCEDURE GetBooksByCategory(IN CatID VARCHAR(12))
BEGIN
    SELECT * FROM Books WHERE Category_Id=CatID;
END$$

CALL GetBooksByCategory("CA001")$$

CREATE PROCEDURE GetStudentsByDepartment(IN Dept VARCHAR(50))
BEGIN
    SELECT * FROM Student WHERE Department=Dept;
END$$

CALL GetStudentsByDepartment('CSE')$$

CREATE PROCEDURE GetBooksByYear(IN PubYear YEAR)
BEGIN
    SELECT * FROM Books WHERE Publication_Year=PubYear;
END$$

CALL GetBooksByYear(2024)$$

CREATE PROCEDURE GetReturnDetails()
BEGIN
    SELECT * FROM ReturnedBooks;
END$$

CALL GetReturnDetails()$$

CREATE PROCEDURE GetAvailableBooks()
BEGIN
    SELECT * FROM AvailableBooks;
END$$

CALL GetAvailableBooks()$$

CREATE PROCEDURE GetLibraryTransactions()
BEGIN
    SELECT * FROM LibraryTransactions;
END$$

CALL GetLibraryTransactions()$$

-- Smart issue procedure: Faculty gets 30 days, Student gets 14 days automatically.
CREATE PROCEDURE sp_IssueBook(
    IN p_issue_id VARCHAR(12),
    IN p_book_id VARCHAR(12),
    IN p_borrower_id VARCHAR(20),
    IN p_librarian_id VARCHAR(12),
    IN p_issue_date DATE
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM Availability WHERE Book_Id=p_book_id AND Available_Copies>0)=0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Book is not currently available.';
    ELSEIF EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id) THEN
        INSERT INTO issue(Issue_Id,Book_Id,Roll_No,Faculty_Id,Librarian_Id,Issue_Date,Due_Date,Return_Date,Fine)
        VALUES(p_issue_id,p_book_id,NULL,p_borrower_id,p_librarian_id,p_issue_date,NULL,NULL,0);
        COMMIT;
    ELSEIF EXISTS (SELECT 1 FROM Student WHERE Roll_No=p_borrower_id) THEN
        INSERT INTO issue(Issue_Id,Book_Id,Roll_No,Faculty_Id,Librarian_Id,Issue_Date,Due_Date,Return_Date,Fine)
        VALUES(p_issue_id,p_book_id,p_borrower_id,NULL,p_librarian_id,p_issue_date,NULL,NULL,0);
        COMMIT;
    ELSE
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Borrower does not exist. Use a valid Roll_No or Faculty_Id.';
    END IF;
END$$

CALL sp_IssueBook('I301','B102','26BTCSE001','L001',CURDATE())$$
CALL sp_IssueBook('I302','B103','18CS001','L001',CURDATE())$$
CALL sp_IssueBook('I303','B103','18CS001','L001',CURDATE())$$

CREATE PROCEDURE sp_ReturnBook(IN p_issue_id VARCHAR(12), IN p_return_date DATE)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM issue WHERE Issue_Id=p_issue_id)=0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Issue record not found.';
    ELSEIF (SELECT Return_Date FROM issue WHERE Issue_Id=p_issue_id) IS NOT NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='This issue is already returned.';
    ELSE
        UPDATE issue SET Return_Date=p_return_date WHERE Issue_Id=p_issue_id;
        COMMIT;
    END IF;
END$$

CALL sp_ReturnBook('I301',DATE_ADD(CURDATE(),INTERVAL 20 DAY))$$
CALL sp_ReturnBook('I302',DATE_ADD(CURDATE(),INTERVAL 35 DAY))$$
CALL sp_ReturnBook('I303',DATE_ADD(CURDATE(),INTERVAL 35 DAY))$$

CREATE PROCEDURE sp_ReserveBook(
    IN p_reservation_id VARCHAR(12),
    IN p_book_id VARCHAR(12),
    IN p_borrower_id VARCHAR(20),
    IN p_reservation_date DATE,
    IN p_remarks VARCHAR(200)
)
BEGIN
    DECLARE v_expiry DATE;
    IF (SELECT COUNT(*) FROM Books WHERE Book_Id=p_book_id)=0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Book does not exist.';
    ELSEIF NOT EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id)
       AND NOT EXISTS (SELECT 1 FROM Student WHERE Roll_No=p_borrower_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Borrower does not exist. Use a valid Roll_No or Faculty_Id.';
    ELSE
        SET v_expiry=DATE_ADD(p_reservation_date,INTERVAL 1 MONTH);
        INSERT INTO Reservation(Reservation_Id,Book_Id,Roll_No,Faculty_Id,Reservation_Date,Expiry_Date,Status,Priority,Remarks)
        VALUES(p_reservation_id,p_book_id,
               CASE WHEN EXISTS (SELECT 1 FROM Student WHERE Roll_No=p_borrower_id) THEN p_borrower_id ELSE NULL END,
               CASE WHEN EXISTS (SELECT 1 FROM Faculty WHERE Faculty_Id=p_borrower_id) THEN p_borrower_id ELSE NULL END,
               p_reservation_date,v_expiry,'Active',UserPriority(p_borrower_id),p_remarks);
    END IF;
END$$

CALL sp_ReserveBook('R101','B101','26BTCSE001',CURDATE(),'Student reservation')$$
CALL sp_ReserveBook('R102','B101','18CS001',CURDATE(),'Faculty priority reservation')$$

CREATE PROCEDURE sp_RefreshReservationStatus()
BEGIN
    UPDATE Reservation SET Status='Expired'
    WHERE Status='Active' AND Expiry_Date<CURDATE();
END$$

CALL sp_RefreshReservationStatus()$$

-- Recommendation: combines course relevance (for students) with borrowing-history category relevance and popularity.
CREATE PROCEDURE sp_RecommendBooks(IN p_borrower_id VARCHAR(20))
BEGIN
    DECLARE v_course VARCHAR(30) DEFAULT NULL;
    IF EXISTS (SELECT 1 FROM Student WHERE Roll_No=p_borrower_id) THEN
        SELECT Course INTO v_course FROM Student WHERE Roll_No=p_borrower_id;
    END IF;

    SELECT b.Book_Id,b.Book_Title,b.Course,c.Category_Name,a.Available_Copies,
           COUNT(i2.Issue_Id) AS Popularity_Score,
           CASE
             WHEN v_course IS NOT NULL AND b.Course=v_course THEN 0
             WHEN EXISTS (
                 SELECT 1
                 FROM issue hi JOIN Books hb ON hi.Book_Id=hb.Book_Id
                 WHERE (hi.Roll_No=p_borrower_id OR hi.Faculty_Id=p_borrower_id)
                   AND hb.Category_Id=b.Category_Id
             ) THEN 1
             ELSE 2
           END AS Recommendation_Match
    FROM Books b
    JOIN Availability a ON b.Book_Id=a.Book_Id
    JOIN Category c ON b.Category_Id=c.Category_Id
    LEFT JOIN issue i2 ON b.Book_Id=i2.Book_Id
    WHERE a.Available_Copies>0
      AND NOT EXISTS (
          SELECT 1 FROM issue i3
          WHERE (i3.Roll_No=p_borrower_id OR i3.Faculty_Id=p_borrower_id)
            AND i3.Book_Id=b.Book_Id
      )
    GROUP BY b.Book_Id,b.Book_Title,b.Course,c.Category_Name,a.Available_Copies
    ORDER BY Recommendation_Match ASC,Popularity_Score DESC,b.Book_Title ASC
    LIMIT 10;
END$$

CALL sp_RecommendBooks('26BTCSE001')$$
CALL sp_RecommendBooks('20EC001')$$
CALL sp_RecommendBooks('26BTCSE001')$$
DELIMITER ;

-- SMART LIBRARY FEATURES
-- ---------------------------------------------------------------
-- 1. Out-of-stock books with active reservations.
SELECT
    b.Book_Id,
    b.Book_Title,
    a.Available_Copies,
    COUNT(r.Reservation_Id) AS Active_Reservations
FROM Books b
JOIN Availability a
    ON b.Book_Id = a.Book_Id
LEFT JOIN Reservation r
    ON b.Book_Id = r.Book_Id
   AND r.Status = 'Active'
WHERE a.Available_Copies = 0
GROUP BY
    b.Book_Id,
    b.Book_Title,
    a.Available_Copies
HAVING COUNT(r.Reservation_Id) > 0
ORDER BY
    Active_Reservations DESC,
    b.Book_Title;

-- 2. Reservation queue: Faculty Gold first, then Student Silver.
SELECT r.Reservation_Id,r.Book_Id,b.Book_Title,
       COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Gold' ELSE 'Silver' END AS Member_Type,
       r.Reservation_Date,r.Expiry_Date,r.Priority,r.Status,r.Remarks
FROM Reservation r
JOIN Books b ON r.Book_Id=b.Book_Id
LEFT JOIN Student s ON r.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON r.Faculty_Id=f.Faculty_Id
WHERE r.Status='Active'
ORDER BY r.Book_Id,r.Priority,r.Reservation_Date,r.Reservation_Id;

-- 3. Most borrowed books.
SELECT b.Book_Id,b.Book_Title,b.Course,COUNT(i.Issue_Id) AS Borrow_Count
FROM Books b JOIN issue i ON b.Book_Id=i.Book_Id
GROUP BY b.Book_Id,b.Book_Title,b.Course
ORDER BY Borrow_Count DESC
LIMIT 10;

-- 4. Most active borrowers.
SELECT COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       COUNT(i.Issue_Id) AS Borrow_Count
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
GROUP BY COALESCE(s.Roll_No,f.Faculty_Id),COALESCE(s.Full_Name,f.Full_Name),Borrower_Type
ORDER BY Borrow_Count DESC
LIMIT 10;

-- 5. Popular categories.
SELECT c.Category_Id,c.Category_Name,COUNT(i.Issue_Id) AS Borrow_Count
FROM Category c JOIN Books b ON c.Category_Id=b.Category_Id JOIN issue i ON b.Book_Id=i.Book_Id
GROUP BY c.Category_Id,c.Category_Name
ORDER BY Borrow_Count DESC;

-- 6. Low stock alert.
SELECT b.Book_Id,b.Book_Title,b.Course,a.Total_Copies,a.Available_Copies,a.Status
FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id
WHERE a.Available_Copies<=1
ORDER BY a.Available_Copies,b.Book_Title;

-- 7. Overdue detection with user-specific fine.
SELECT i.Issue_Id,COALESCE(s.Roll_No,f.Faculty_Id) AS Borrower_Id,
       COALESCE(s.Full_Name,f.Full_Name) AS Borrower_Name,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN 'Faculty' ELSE 'Student' END AS Borrower_Type,
       b.Book_Title,i.Due_Date,
       DATEDIFF(CURDATE(),i.Due_Date) AS Overdue_Days,
       CASE WHEN f.Faculty_Id IS NOT NULL THEN GREATEST(DATEDIFF(CURDATE(),i.Due_Date),0)*5
            ELSE GREATEST(DATEDIFF(CURDATE(),i.Due_Date),0)*10 END AS Current_Fine
FROM issue i
LEFT JOIN Student s ON i.Roll_No=s.Roll_No
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
JOIN Books b ON i.Book_Id=b.Book_Id
WHERE i.Return_Date IS NULL AND i.Due_Date<CURDATE()
ORDER BY Overdue_Days DESC;

-- 8. Monthly borrowing trend.
SELECT DATE_FORMAT(Issue_Date,'%Y-%m') AS Borrow_Month,COUNT(*) AS Total_Issues
FROM issue GROUP BY DATE_FORMAT(Issue_Date,'%Y-%m') ORDER BY Borrow_Month;

-- 9. Course-wise student borrowing analysis.
SELECT s.Course,b.Course AS Book_Course,COUNT(*) AS Borrow_Count
FROM Student s JOIN issue i ON s.Roll_No=i.Roll_No JOIN Books b ON i.Book_Id=b.Book_Id
GROUP BY s.Course,b.Course ORDER BY s.Course,Borrow_Count DESC;

-- 10-13. Course-specific book lists.
SELECT b.Book_Id,b.Book_Title,b.Course,a.Available_Copies FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE b.Course='B.Tech' ORDER BY b.Book_Title;
SELECT b.Book_Id,b.Book_Title,b.Course,a.Available_Copies FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE b.Course='Pharmacy' ORDER BY b.Book_Title;
SELECT b.Book_Id,b.Book_Title,b.Course,a.Available_Copies FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE b.Course='BBA' ORDER BY b.Book_Title;
SELECT b.Book_Id,b.Book_Title,b.Course,a.Available_Copies FROM Books b JOIN Availability a ON b.Book_Id=a.Book_Id WHERE b.Course='MCA' ORDER BY b.Book_Title;

-- 14. Recommendation examples are tested immediately after the procedure creation above.

-- 15. Faculty vs Student privilege checks.
SELECT UserPriority('20EC001') AS Faculty_Priority,UserPriority('26BTCSE001') AS Student_Priority;
SELECT UserLoanDays('20EC001') AS Faculty_Loan_Days,UserLoanDays('26BTCSE001') AS Student_Loan_Days;
SELECT UserFineRate('20EC001') AS Faculty_Fine_Per_Day,UserFineRate('26BTCSE001') AS Student_Fine_Per_Day;
SELECT CalculateFine('20EC001','2026-09-01','2026-10-06') AS Faculty_Fine;
SELECT CalculateFine('26BTCSE001','2026-09-01','2026-09-21') AS Student_Fine;

-- DATA VALIDATION
-- ---------------------------------------------------------------
SHOW TABLES;

SELECT COUNT(*) AS Student_Count FROM Student;
SELECT COUNT(*) AS Faculty_Count FROM Faculty;
SELECT COUNT(*) AS Book_Count FROM Books;
SELECT COUNT(*) AS Issue_Count FROM issue;
SELECT COUNT(*) AS Reservation_Count FROM Reservation;

SELECT Faculty_Id,Full_Name,Department,Join_Date
FROM Faculty
ORDER BY Faculty_Id
LIMIT 10;

SELECT Roll_No,Full_Name,Course,Department,`Year` AS Current_Year,Join_Date
FROM Student
ORDER BY Roll_No
LIMIT 20;

SELECT 'Author' AS Table_Name,COUNT(*) AS Row_Count FROM Author
UNION ALL SELECT 'Publisher',COUNT(*) FROM Publisher
UNION ALL SELECT 'Category',COUNT(*) FROM Category
UNION ALL SELECT 'Student',COUNT(*) FROM Student
UNION ALL SELECT 'Faculty',COUNT(*) FROM Faculty
UNION ALL SELECT 'Librarian',COUNT(*) FROM Librarian
UNION ALL SELECT 'Books',COUNT(*) FROM Books
UNION ALL SELECT 'Availability',COUNT(*) FROM Availability
UNION ALL SELECT 'Issue',COUNT(*) FROM issue
UNION ALL SELECT 'Reservation',COUNT(*) FROM Reservation;

SELECT COUNT(*) AS Books_Without_Availability
FROM Books b LEFT JOIN Availability a ON b.Book_Id=a.Book_Id
WHERE a.Book_Id IS NULL;

SELECT COUNT(*) AS Duplicate_Book_Availability_Rows
FROM (SELECT Book_Id,COUNT(*) c FROM Availability GROUP BY Book_Id HAVING COUNT(*)>1) x;

SELECT COUNT(*) AS Wrong_Student_Joining_Year_Rows
FROM Student
WHERE `Year`<>2026-YEAR(Join_Date)+1;

SELECT COUNT(*) AS Reservation_Expiry_Errors
FROM Reservation
WHERE Expiry_Date<>DATE_ADD(Reservation_Date,INTERVAL 1 MONTH);

SELECT COUNT(*) AS Faculty_Priority_Errors
FROM Reservation r
JOIN Faculty f ON r.Faculty_Id=f.Faculty_Id
WHERE r.Priority<>1;

SELECT COUNT(*) AS Student_Priority_Errors
FROM Reservation r
JOIN Student s ON r.Roll_No=s.Roll_No
WHERE r.Priority<>2;

SELECT COUNT(*) AS Wrong_Loan_Period_Rows
FROM issue i
LEFT JOIN Faculty f ON i.Faculty_Id=f.Faculty_Id
WHERE (f.Faculty_Id IS NOT NULL AND i.Due_Date<>DATE_ADD(i.Issue_Date,INTERVAL 30 DAY))
   OR (f.Faculty_Id IS NULL AND i.Due_Date<>DATE_ADD(i.Issue_Date,INTERVAL 14 DAY));

SELECT COUNT(*) AS Wrong_Returned_Fine_Rows
FROM issue i
WHERE i.Return_Date IS NOT NULL
  AND ((i.Faculty_Id IS NOT NULL AND i.Fine<>CalculateFine(i.Faculty_Id,i.Due_Date,i.Return_Date))
    OR (i.Roll_No IS NOT NULL AND i.Fine<>CalculateFine(i.Roll_No,i.Due_Date,i.Return_Date)));

SELECT COUNT(*) AS Course_Tagged_Books FROM Books WHERE Course IN('B.Tech','Pharmacy','BBA','MCA');

SELECT COUNT(*) AS OutOfStock_Books_With_Active_Reservations
FROM Availability a
WHERE a.Available_Copies=0
AND EXISTS (SELECT 1 FROM Reservation r WHERE r.Book_Id=a.Book_Id AND r.Status='Active');
