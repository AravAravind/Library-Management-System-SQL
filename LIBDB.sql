CREATE DATABASE IF NOT EXISTS LibDB;
USE LibDB;
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    category_id INT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year INT,
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE,
    CONSTRAINT unique_book UNIQUE (title, author_id, publication_year)
);
CREATE TABLE IF NOT EXISTS Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    membership_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS Borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date DATE NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS LostDamagedBooks (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Lost', 'Damaged') NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    amount DECIMAL(10,2) NOT NULL,
    due_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Unpaid', 'Paid') DEFAULT 'Unpaid',
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);
-- Insert data into Authors table
INSERT INTO Authors (name) VALUES
('J.K. Rowling'),
('George Orwell'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King'),
('Mark Twain'),
('Jane Austen'),
('Charles Dickens'),
('Ernest Hemingway'),
('F. Scott Fitzgerald'),
('Harper Lee'),
('Leo Tolstoy'),
('Fyodor Dostoevsky'),
('Gabriel Garcia Marquez'),
('William Shakespeare'),
('H.G. Wells'),
('Isaac Asimov'),
('Arthur Conan Doyle'),
('Emily Bronte'),
('Victor Hugo'),
('Herman Melville'),
('Jules Verne'),
('Aldous Huxley'),
('Ray Bradbury'),
('Oscar Wilde'),
('Franz Kafka'),
('Dante Alighieri'),
('Homer'),
('Mary Shelley'),
('Bram Stoker'),
('George R.R. Martin'),
('Rick Riordan'),
('C.S. Lewis'),
('J.D. Salinger'),
('Kurt Vonnegut'),
('Margaret Atwood'),
('Douglas Adams'),
('Dan Brown'),
('E.L. James'),
('Suzanne Collins'),
('John Green'),
('Haruki Murakami'),
('Paulo Coelho'),
('Toni Morrison'),
('Ralph Ellison'),
('Kazuo Ishiguro'),
('Jodi Picoult'),
('Neil Gaiman'),
('Roald Dahl'),
('Dr. Seuss'),
('Beatrix Potter');

-- Insert data into Categories table
INSERT INTO Categories (category_name) VALUES
('Fiction'),
('Science Fiction'),
('Mystery'),
('Fantasy'),
('Thriller'),
('Horror'),
('Romance'),
('Historical Fiction'),
('Biography'),
('Self-Help'),
('Philosophy'),
('Poetry'),
('Drama'),
('Children'),
('Young Adult'),
('Adventure'),
('Dystopian'),
('Classic'),
('Crime'),
('Humor'),
('Non-Fiction'),
('Psychology'),
('Science'),
('Business'),
('Health'),
('Education'),
('Politics'),
('Spirituality'),
('Cookbooks'),
('Travel'),
('Autobiography'),
('War'),
('Mythology'),
('Religion'),
('Sports'),
('Technology'),
('Art'),
('Music'),
('Photography'),
('True Crime'),
('Nature'),
('Essays'),
('Linguistics'),
('Magic'),
('Supernatural'),
('Psychological Thriller'),
('Science & Nature'),
('Graphic Novels'),
('Short Stories'),
('Western'),
('Anthology');

-- Insert data into Books table
INSERT INTO Books (title, author_id, category_id, isbn, publication_year, copies_available) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 4, '9780439554930', 1997, 5),
('1984', 2, 17, '9780451524935', 1949, 3),
('The Hobbit', 3, 4, '9780261102217', 1937, 4),
('Murder on the Orient Express', 4, 3, '9780007119318', 1934, 2),
('The Shining', 5, 6, '9780307743657', 1977, 3),
('The Adventures of Tom Sawyer', 6, 16, '9780486400778', 1876, 5),
('Pride and Prejudice', 7, 7, '9780679783268', 1813, 2),
('A Tale of Two Cities', 8, 8, '9781853260391', 1859, 4),
('The Old Man and the Sea', 9, 18, '9780684801223', 1952, 3),
('The Great Gatsby', 10, 18, '9780743273565', 1925, 3),
('To Kill a Mockingbird', 11, 18, '9780061120084', 1960, 4),
('War and Peace', 12, 8, '9780140447934', 1869, 2),
('Crime and Punishment', 13, 18, '9780486415871', 1866, 3),
('One Hundred Years of Solitude', 14, 18, '9780060883287', 1967, 4),
('Hamlet', 15, 13, '9780451526922', 1603, 2),
('The Time Machine', 16, 2, '9780553213515', 1895, 3),
('Foundation', 17, 2, '9780553293357', 1951, 4),
('Sherlock Holmes: A Study in Scarlet', 18, 3, '9780486474915', 1887, 5),
('Wuthering Heights', 19, 7, '9780141439556', 1847, 2),
('Les Misérables', 20, 8, '9780451419431', 1862, 3),
('Moby-Dick', 21, 8, '9780142437247', 1851, 3),
('Twenty Thousand Leagues Under the Sea', 22, 16, '9780553212525', 1870, 4),
('Brave New World', 23, 17, '9780060850524', 1932, 5),
('Fahrenheit 451', 24, 17, '9781451673319', 1953, 3),
('The Picture of Dorian Gray', 25, 18, '9780141442464', 1890, 2),
('The Metamorphosis', 26, 18, '9780486290300', 1915, 4),
('The Divine Comedy', 27, 12, '9780142437223', 1320, 3),
('The Odyssey', 28, 16, '9780140268867', -700, 2),
('Frankenstein', 29, 6, '9780486282114', 1818, 3),
('Dracula', 30, 6, '9780486454016', 1897, 2),
('A Game of Thrones', 31, 4, '9780553593716', 1996, 4),
('Percy Jackson & The Lightning Thief', 32, 4, '9780786838653', 2005, 5),
('The Chronicles of Narnia', 33, 4, '9780066238500', 1950, 3),
('The Catcher in the Rye', 34, 18, '9780316769488', 1951, 2),
('Slaughterhouse-Five', 35, 18, '9780440180296', 1969, 4),
('The Handmaid’s Tale', 36, 17, '9780385490818', 1985, 3),
('The Hitchhiker’s Guide to the Galaxy', 37, 16, '9780345391803', 1979, 2),
('The Da Vinci Code', 38, 3, '9780307474278', 2003, 5),
('Fifty Shades of Grey', 39, 7, '9780345803481', 2011, 3),
('The Hunger Games', 40, 15, '9780439023481', 2008, 4),
('Looking for Alaska', 41, 15, '9780142402511', 2005, 3),
('Norwegian Wood', 42, 18, '9780375704024', 1987, 2),
('The Alchemist', 43, 18, '9780062315007', 1988, 4),
('Beloved', 44, 8, '9781400033416', 1987, 3),
('Invisible Man', 45, 18, '9780679732761', 1952, 2),
('Never Let Me Go', 46, 17, '9781400078776', 2005, 5),
('My Sister’s Keeper', 47, 7, '9780743454537', 2004, 3),
('American Gods', 48, 18, '9780062572230', 2001, 2),
('Charlie and the Chocolate Factory', 49, 14, '9780142410318', 1964, 4),
('The Cat in the Hat', 50, 14, '9780394800011', 1957, 3);


-- Insert data into Members table
INSERT INTO Members (name, email, phone, membership_date) VALUES
('Alice Johnson', 'alice.johnson@email.com', '1234567890', '2023-02-05'),
('Bob Smith', 'bob.smith@email.com', '2345678901', '2023-02-05'),
('Charlie Brown', 'charlie.brown@email.com', '3456789012', '2023-02-05'),
('David White', 'david.white@email.com', '4567890123', '2023-02-05'),
('Eve Adams', 'eve.adams@email.com', '5678901234', '2023-02-05'),
('Arjun Kumar', 'arjun.kumar@example.com', '9876543210', '2023-01-10'),
('Meera Nair', 'meera.nair@example.com', '9876543211', '2023-01-15'),
('Rahul Sharma', 'rahul.sharma@example.com', '9876543212', '2023-01-20'),
('Sita Patel', 'sita.patel@example.com', '9876543213', '2023-02-05'),
('Vikram Rao', 'vikram.rao@example.com', '9876543214', '2023-02-10'),
('Divya Menon', 'divya.menon@example.com', '9876543215', '2023-02-20'),
('Karan Gupta', 'karan.gupta@example.com', '9876543216', '2023-03-01'),
('Anjali Verma', 'anjali.verma@example.com', '9876543217', '2023-03-10'),
('Naveen Yadav', 'naveen.yadav@example.com', '9876543218', '2023-03-20'),
('Pooja Desai', 'pooja.desai@example.com', '9876543219', '2023-03-25'),
('Sandeep Malhotra', 'sandeep.malhotra@example.com', '9876543220', '2023-04-05'),
('Neha Joshi', 'neha.joshi@example.com', '9876543221', '2023-04-10'),
('Rajesh Kumar', 'rajesh.kumar@example.com', '9876543222', '2023-04-15'),
('Sneha Iyer', 'sneha.iyer@example.com', '9876543223', '2023-04-20'),
('Amit Tiwari', 'amit.tiwari@example.com', '9876543224', '2023-05-01'),
('Priya Das', 'priya.das@example.com', '9876543225', '2023-05-05'),
('Manoj Kapoor', 'manoj.kapoor@example.com', '9876543226', '2023-05-10'),
('Rohit Sen', 'rohit.sen@example.com', '9876543227', '2023-05-15'),
('Kavita Shukla', 'kavita.shukla@example.com', '9876543228', '2023-05-20'),
('Harish Mehta', 'harish.mehta@example.com', '9876543229', '2023-06-01'),
('Sunita Reddy', 'sunita.reddy@example.com', '9876543230', '2023-06-05'),
('Deepak Jain', 'deepak.jain@example.com', '9876543231', '2023-06-10'),
('Bhavna Tripathi', 'bhavna.tripathi@example.com', '9876543232', '2023-06-15'),
('Saurabh Choudhary', 'saurabh.choudhary@example.com', '9876543233', '2023-06-20'),
('Anita Bhandari', 'anita.bhandari@example.com', '9876543234', '2023-07-01'),
('Varun Saxena', 'varun.saxena@example.com', '9876543235', '2023-07-05'),
('Ritu Sharma', 'ritu.sharma@example.com', '9876543236', '2023-07-10'),
('Gautam Agrawal', 'gautam.agrawal@example.com', '9876543237', '2023-07-15'),
('Swati Nanda', 'swati.nanda@example.com', '9876543238', '2023-07-20'),
('Aditya Khanna', 'aditya.khanna@example.com', '9876543239', '2023-08-01'),
('Shruti Bose', 'shruti.bose@example.com', '9876543240', '2023-08-05'),
('Vivek Dutta', 'vivek.dutta@example.com', '9876543241', '2023-08-10'),
('Simran Kaur', 'simran.kaur@example.com', '9876543242', '2023-08-15'),
('Tarun Pillai', 'tarun.pillai@example.com', '9876543243', '2023-08-20'),
('Isha Naik', 'isha.naik@example.com', '9876543244', '2023-09-01'),
('Ajay Roy', 'ajay.roy@example.com', '9876543245', '2023-09-05'),
('Pallavi Mishra', 'pallavi.mishra@example.com', '9876543246', '2023-09-10'),
('Siddharth Rane', 'siddharth.rane@example.com', '9876543247', '2023-09-15'),
('Chitra Mohan', 'chitra.mohan@example.com', '9876543248', '2023-09-20'),
('Nitin Srivastava', 'nitin.srivastava@example.com', '9876543249', '2023-10-01'),
('Yamini Shetty', 'yamini.shetty@example.com', '9876543250', '2023-10-05'),
('Arvind Kumar', 'arvind.kumar@example.com', '9876543251', '2023-10-10'),
('Divakar Singh', 'divakar.singh@example.com', '9876543252', '2023-10-15'),
('Hema Prasad', 'hema.prasad@example.com', '9876543253', '2023-10-20'),
('Suresh Narayan', 'suresh.narayan@example.com', '9876543254', '2023-10-25'),
('Lavanya Ramesh', 'lavanya.ramesh@example.com', '9876543255', '2023-11-01'),
('Karthik Balaji', 'karthik.balaji@example.com', '9876543256', '2023-11-05'),
('Malini Chandran', 'malini.chandran@example.com', '9876543257', '2023-11-10'),
('Nishant Goel', 'nishant.goel@example.com', '9876543258', '2023-11-15');

-- Insert data into Borrowings table
INSERT INTO Borrowings (member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2024-02-01', Null),
(2, 2, '2024-02-02', Null),
(3, 3, '2024-02-03', Null),
(4, 4, '2024-02-04', Null),
(5, 5, '2024-02-05', Null),
(1, 10, '2023-01-12', '2023-01-22'),
(2, 25, '2023-01-18', '2023-01-30'),
(3, 5, '2023-01-22', '2023-02-05'),
(4, 30, '2023-02-08', '2023-02-18'),
(5, 12, '2023-02-15', '2023-02-28'),
(6, 7, '2023-02-22', '2023-03-05'),
(7, 18, '2023-03-05', '2023-03-20'),
(8, 22, '2023-03-12', '2023-03-22'),
(9, 3, '2023-03-20', '2023-04-01'),
(10, 15, '2023-03-27', '2023-04-07'),
(11, 9, '2023-04-02', '2023-04-15'),
(12, 26, '2023-04-10', '2023-04-20'),
(13, 4, '2023-04-18', '2023-05-01'),
(14, 14, '2023-04-25', '2023-05-05'),
(15, 8, '2023-05-03', '2023-05-15'),
(16, 29, '2023-05-10', '2023-05-25'),
(17, 11, '2023-05-18', '2023-06-01'),
(18, 20, '2023-05-27', '2023-06-10'),
(19, 6, '2023-06-05', '2023-06-18'),
(20, 13, '2023-06-12', '2023-06-25'),
(21, 2, '2023-06-20', '2023-07-01'),
(22, 24, '2023-06-28', '2023-07-10'),
(23, 1, '2023-07-05', '2023-07-18'),
(24, 16, '2023-07-12', '2023-07-25'),
(25, 27, '2023-07-20', '2023-08-01'),
(26, 21, '2023-07-28', '2023-08-10'),
(27, 19, '2023-08-05', '2023-08-18'),
(28, 28, '2023-08-12', '2023-08-25'),
(29, 23, '2023-08-20', '2023-09-01'),
(30, 17, '2023-08-28', '2023-09-10'),
(31, 10, '2023-09-05', '2023-09-18'),
(32, 5, '2023-09-12', '2023-09-25'),
(33, 30, '2023-09-20', '2023-10-01'),
(34, 12, '2023-09-28', '2023-10-10'),
(35, 7, '2023-10-05', '2023-10-18'),
(36, 18, '2023-10-12', '2023-10-25'),
(37, 22, '2023-10-20', '2023-11-01'),
(38, 3, '2023-10-28', '2023-11-10'),
(39, 15, '2023-11-05', '2023-11-18'),
(40, 9, '2023-11-12', '2023-11-25'),
(41, 26, '2023-11-20', '2023-12-01'),
(42, 4, '2023-11-28', '2023-12-10'),
(43, 14, '2023-12-05', '2023-12-18'),
(44, 8, '2023-12-12', '2023-12-25'),
(45, 29, '2023-12-20', '2024-01-01'),
(46, 11, '2023-12-28', '2024-01-10'),
(47, 20, '2024-01-05', '2024-01-18'),
(48, 6, '2024-01-12', '2024-01-25'),
(49, 13, '2024-01-20', '2024-02-01'),
(50, 2, '2024-01-28', NULL);

-- Insert data into Reviews table
INSERT INTO Reviews (member_id, book_id, rating, review_text, review_date) VALUES
(1, 1, 5, 'Amazing book!', '2023-02-12'),
(2, 2, 4, 'Very thought-provoking.', '2023-02-12'),
(3, 3, 5, 'Loved the adventure!', '2023-02-12'),
(4, 4, 3, 'Good but predictable.', '2023-02-12'),
(5, 5, 5, 'A horror classic!', '2023-02-12'),
(1, 10, 5, 'An amazing read! Highly recommended.', '2023-01-15'),
(2, 25, 4, 'Good book with interesting insights.', '2023-01-22'),
(3, 5, 3, 'Decent read but could be better.', '2023-02-05'),
(4, 30, 5, 'One of the best books I have read.', '2023-02-12'),
(5, 12, 4, 'Very informative and well-written.', '2023-02-25'),
(6, 7, 2, 'Didn’t meet my expectations.', '2023-03-03'),
(7, 18, 5, 'Loved every bit of it!', '2023-03-10'),
(8, 22, 4, 'Engaging and well-paced.', '2023-03-20'),
(9, 3, 3, 'Not bad but not great either.', '2023-04-01'),
(10, 15, 5, 'Fantastic storytelling.', '2023-04-10'),
(11, 9, 4, 'Quite enjoyable and thought-provoking.', '2023-04-18'),
(12, 26, 2, 'Didn’t like the writing style.', '2023-04-25'),
(13, 4, 3, 'An average book with some good points.', '2023-05-03'),
(14, 14, 5, 'Absolutely loved it!', '2023-05-12'),
(15, 8, 4, 'A great read for weekends.', '2023-05-20'),
(16, 29, 3, 'Could have been better.', '2023-06-01'),
(17, 11, 5, 'Very inspiring and deep.', '2023-06-10'),
(18, 20, 4, 'Kept me engaged till the end.', '2023-06-18'),
(19, 6, 2, 'Too slow-paced for my taste.', '2023-06-27'),
(20, 13, 5, 'Absolutely mesmerizing!', '2023-07-05'),
(21, 2, 3, 'Good but not as expected.', '2023-07-12'),
(22, 24, 4, 'Informative and well-researched.', '2023-07-22'),
(23, 1, 5, 'Would read it again!', '2023-07-30'),
(24, 16, 3, 'Okay but not great.', '2023-08-08'),
(25, 27, 2, 'Couldn’t finish it.', '2023-08-15'),
(26, 21, 4, 'Loved the narrative style.', '2023-08-25'),
(27, 19, 5, 'A masterpiece!', '2023-09-01'),
(28, 28, 3, 'Not bad but didn’t impress me.', '2023-09-10'),
(29, 23, 4, 'An engaging and fun read.', '2023-09-18'),
(30, 17, 5, 'A must-read for everyone.', '2023-09-28'),
(31, 10, 4, 'Would recommend to others.', '2023-10-05'),
(32, 5, 2, 'Expected more from this book.', '2023-10-12'),
(33, 30, 5, 'One of my favorites!', '2023-10-20'),
(34, 12, 3, 'Interesting but not amazing.', '2023-10-28'),
(35, 7, 4, 'A decent read.', '2023-11-05'),
(36, 18, 5, 'Brilliant storytelling!', '2023-11-12'),
(37, 22, 3, 'Okayish, could be better.', '2023-11-20'),
(38, 3, 2, 'Didn’t enjoy it much.', '2023-11-28'),
(39, 15, 4, 'Good book with a strong message.', '2023-12-05'),
(40, 9, 5, 'Absolutely fantastic!', '2023-12-12'),
(41, 26, 3, 'Worth a read but not outstanding.', '2023-12-20'),
(42, 4, 2, 'Wouldn’t recommend.', '2023-12-28'),
(43, 14, 5, 'Totally worth the hype.', '2024-01-05'),
(44, 8, 4, 'A well-structured book.', '2024-01-12'),
(45, 29, 3, 'Mediocre at best.', '2024-01-20'),
(46, 11, 2, 'Not my type of book.', '2024-01-28'),
(47, 20, 5, 'Simply incredible!', '2024-02-05'),
(48, 6, 4, 'Very insightful and well-written.', '2024-02-12'),
(49, 13, 3, 'A mixed bag of thoughts.', '2024-02-20'),
(50, 2, 5, 'One of the best books of all time.', '2024-02-28');

-- Insert data into LostDamagedBooks table
INSERT INTO LostDamagedBooks (member_id, book_id, report_date, status) VALUES
(1, 1, '2023-01-22', 'Lost'),
(2, 3, '2023-01-22', 'Damaged'),
(3, 5, '2023-01-22', 'Lost'),
(4, 2, '2023-01-22', 'Damaged'),
(5, 4, '2023-01-22', 'Lost'),
(1, 10, '2023-01-10', 'Lost'),
(2, 25, '2023-01-22', 'Damaged'),
(3, 5, '2023-02-05', 'Lost'),
(4, 30, '2023-02-15', 'Damaged'),
(5, 12, '2023-02-25', 'Lost'),
(6, 7, '2023-03-02', 'Damaged'),
(7, 18, '2023-03-10', 'Lost'),
(8, 22, '2023-03-18', 'Damaged'),
(9, 3, '2023-04-01', 'Lost'),
(10, 15, '2023-04-08', 'Damaged'),
(11, 9, '2023-04-15', 'Lost'),
(12, 26, '2023-04-23', 'Damaged'),
(13, 4, '2023-05-01', 'Lost'),
(14, 14, '2023-05-10', 'Damaged'),
(15, 8, '2023-05-18', 'Lost'),
(16, 29, '2023-05-28', 'Damaged'),
(17, 11, '2023-06-05', 'Lost'),
(18, 20, '2023-06-15', 'Damaged'),
(19, 6, '2023-06-22', 'Lost'),
(20, 13, '2023-07-01', 'Damaged'),
(21, 2, '2023-07-10', 'Lost'),
(22, 24, '2023-07-18', 'Damaged'),
(23, 1, '2023-07-27', 'Lost'),
(24, 16, '2023-08-05', 'Damaged'),
(25, 27, '2023-08-12', 'Lost'),
(26, 21, '2023-08-22', 'Damaged'),
(27, 19, '2023-09-01', 'Lost'),
(28, 28, '2023-09-10', 'Damaged'),
(29, 23, '2023-09-18', 'Lost'),
(30, 17, '2023-09-28', 'Damaged'),
(31, 10, '2023-10-05', 'Lost'),
(32, 5, '2023-10-12', 'Damaged'),
(33, 30, '2023-10-20', 'Lost'),
(34, 12, '2023-10-28', 'Damaged'),
(35, 7, '2023-11-05', 'Lost'),
(36, 18, '2023-11-12', 'Damaged'),
(37, 22, '2023-11-20', 'Lost'),
(38, 3, '2023-11-28', 'Damaged'),
(39, 15, '2023-12-05', 'Lost'),
(40, 9, '2023-12-12', 'Damaged'),
(41, 26, '2023-12-20', 'Lost'),
(42, 4, '2023-12-28', 'Damaged'),
(43, 14, '2024-01-05', 'Lost'),
(44, 8, '2024-01-12', 'Damaged'),
(45, 29, '2024-01-20', 'Lost'),
(46, 11, '2024-01-28', 'Damaged'),
(47, 20, '2024-02-05', 'Lost'),
(48, 6, '2024-02-12', 'Damaged'),
(49, 13, '2024-02-20', 'Lost'),
(50, 2, '2024-02-28', 'Damaged');


-- Insert data into Fines table
INSERT INTO Fines (member_id, amount, due_date, status) VALUES
(1, 50.00, '2024-03-01', 'Unpaid'),
(2, 25.00, '2024-03-05', 'Paid'),
(3, 30.00, '2024-03-10', 'Unpaid'),
(4, 40.00, '2024-03-15', 'Paid'),
(5, 20.00, '2024-03-20', 'Unpaid'),
(1, 50.00, '2023-01-10', 'Unpaid'),
(2, 30.00, '2023-01-15', 'Paid'),
(3, 75.50, '2023-01-22', 'Unpaid'),
(4, 20.00, '2023-02-05', 'Paid'),
(5, 40.00, '2023-02-12', 'Unpaid'),
(6, 60.75, '2023-02-20', 'Paid'),
(7, 35.00, '2023-03-02', 'Unpaid'),
(8, 45.00, '2023-03-10', 'Paid'),
(9, 25.00, '2023-03-18', 'Unpaid'),
(10, 80.00, '2023-03-28', 'Paid'),
(11, 55.50, '2023-04-05', 'Unpaid'),
(12, 90.00, '2023-04-12', 'Paid'),
(13, 22.75, '2023-04-20', 'Unpaid'),
(14, 65.00, '2023-04-28', 'Paid'),
(15, 48.00, '2023-05-05', 'Unpaid'),
(16, 38.50, '2023-05-12', 'Paid'),
(17, 42.25, '2023-05-20', 'Unpaid'),
(18, 70.00, '2023-05-28', 'Paid'),
(19, 33.00, '2023-06-05', 'Unpaid'),
(20, 85.00, '2023-06-12', 'Paid'),
(21, 29.50, '2023-06-20', 'Unpaid'),
(22, 95.00, '2023-06-28', 'Paid'),
(23, 50.75, '2023-07-05', 'Unpaid'),
(24, 60.25, '2023-07-12', 'Paid'),
(25, 28.00, '2023-07-20', 'Unpaid'),
(26, 75.00, '2023-07-28', 'Paid'),
(27, 40.50, '2023-08-05', 'Unpaid'),
(28, 55.00, '2023-08-12', 'Paid'),
(29, 36.25, '2023-08-20', 'Unpaid'),
(30, 68.00, '2023-08-28', 'Paid'),
(31, 47.50, '2023-09-05', 'Unpaid'),
(32, 30.75, '2023-09-12', 'Paid'),
(33, 53.25, '2023-09-20', 'Unpaid'),
(34, 80.00, '2023-09-28', 'Paid'),
(35, 41.00, '2023-10-05', 'Unpaid'),
(36, 95.50, '2023-10-12', 'Paid'),
(37, 27.75, '2023-10-20', 'Unpaid'),
(38, 65.50, '2023-10-28', 'Paid'),
(39, 78.25, '2023-11-05', 'Unpaid'),
(40, 45.00, '2023-11-12', 'Paid'),
(41, 38.00, '2023-11-20', 'Unpaid'),
(42, 85.25, '2023-11-28', 'Paid'),
(43, 50.00, '2023-12-05', 'Unpaid'),
(44, 90.00, '2023-12-12', 'Paid'),
(45, 33.75, '2023-12-20', 'Unpaid'),
(46, 72.50, '2023-12-28', 'Paid'),
(47, 44.75, '2024-01-05', 'Unpaid'),
(48, 56.00, '2024-01-12', 'Paid'),
(49, 68.50, '2024-01-20', 'Unpaid'),
(50, 39.25, '2024-01-28', 'Paid');

SELECT b.title, a.name AS author, c.category_name, b.publication_year, b.copies_available 
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Categories c ON b.category_id = c.category_id;

SELECT m.name AS member, b.title, br.borrow_date, br.return_date
FROM Borrowings br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL AND br.borrow_date < NOW() - INTERVAL 14 DAY;

SELECT b.title, COUNT(br.borrowing_id) AS borrow_count
FROM Borrowings br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

CREATE TRIGGER after_borrowing_insert
AFTER INSERT ON Borrowings
FOR EACH ROW
UPDATE Books SET copies_available = copies_available - 1 WHERE book_id = NEW.book_id;

DELIMITER $$

CREATE TRIGGER after_return_update
AFTER UPDATE ON Borrowings
FOR EACH ROW 
BEGIN
  IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
    UPDATE Books 
    SET copies_available = copies_available + 1 
    WHERE book_id = NEW.book_id;
  END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_late_return
AFTER UPDATE ON Borrowings
FOR EACH ROW 
BEGIN
  IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL AND 
     DATEDIFF(NEW.return_date, NEW.borrow_date) > 14 THEN
    INSERT INTO Fines (member_id, amount, due_date, status)
    VALUES (NEW.member_id, 50.00, NOW(), 'Unpaid');
  END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER prevent_over_borrowing
BEFORE INSERT ON Borrowings
FOR EACH ROW
BEGIN
  DECLARE book_count INT;
  
  SELECT COUNT(*) INTO book_count 
  FROM Borrowings 
  WHERE member_id = NEW.member_id AND return_date IS NULL;
  
  IF book_count >= 5 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Member has already borrowed 5 books!';
  END IF;
END$$

DELIMITER ;

CREATE VIEW MostBorrowedBooks AS
SELECT b.title, COUNT(br.borrowing_id) AS borrow_count
FROM Borrowings br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;

SELECT * FROM MostBorrowedBooks;

CREATE VIEW FrequentBorrowers AS
SELECT m.name, COUNT(br.borrowing_id) AS books_borrowed
FROM Borrowings br
JOIN Members m ON br.member_id = m.member_id
GROUP BY m.name
ORDER BY books_borrowed DESC;

SELECT * FROM FrequentBorrowers;


CREATE INDEX idx_books_title ON Books (title);
CREATE INDEX idx_members_email ON Members (email);
CREATE INDEX idx_borrowings_member_book ON Borrowings (member_id, book_id);



