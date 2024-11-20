-- Create the database
CREATE DATABASE panyaBakery;
GO
USE panyaBakery;
GO

-- CATEGORIES Table
CREATE TABLE CATEGORIES (
    category_id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
GO

-- PRODUCTS Table
CREATE TABLE PRODUCTS (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    image VARCHAR(255),
    category_name VARCHAR(255),
    is_in_stock BIT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_name) REFERENCES CATEGORIES(name)
);
GO

-- USERS Table
CREATE TABLE USERS (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    address TEXT,
    username VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    is_admin BIT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
GO

-- ORDERS Table
CREATE TABLE ORDERS (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    user_id INT REFERENCES USERS(id),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_type VARCHAR(50),
    status VARCHAR(50),
    total_price DECIMAL(10, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
GO

-- ORDER_ITEMS Table
CREATE TABLE ORDER_ITEMS (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    order_id INT REFERENCES ORDERS(id),
    product_id INT REFERENCES PRODUCTS(id),
    quantity INT,
    price DECIMAL(10, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
GO


USE panyaBakery;
GO

-- Insert sample data into CATEGORIES table
INSERT INTO CATEGORIES (name)
VALUES 
    ('Bread'),
    ('Cake'),
    ('Beverages');
GO

-- Insert sample data into PRODUCTS table
INSERT INTO PRODUCTS (name, description, price, image, category_name, is_in_stock)
VALUES 
    ('Baguette', 'Classic French long loaf with a crispy crust', 50.000, 'assets\product-images\Baguette.jpg', 'Bread',1),
('Ciabatta', 'Italian bread with a soft, airy interior', 50.000, 'assets\product-images\Ciabatta.jpg', 'Bread',1),
('Sourdough', 'Tangy bread made with natural yeast starter', 50.000, 'assets\product-images\Sourdough.jpg', 'Bread',1),
('Rye Bread', 'Dense bread made with rye flour', 50.000, 'assets\product-images\RyeBread.jpg', 'Bread',1),
('Focaccia', 'Italian flatbread with olive oil and herbs', 50.000, 'assets\product-images\Focaccia.jpg', 'Bread',1),
('Brioche', 'Rich, buttery French bread', 50.000, 'assets\product-images\Brioche.jpg', 'Bread',1),
('Pita Bread', 'Soft and chewy Middle Eastern flatbread', 50.000, 'assets\product-images\PitaBread.jpeg', 'Bread',1),
('Naan', 'Leavened Indian flatbread', 50.000, 'assets\product-images\Naan.jpg', 'Bread',1),
('Challah', 'Sweet, braided Jewish bread', 50.000, 'assets\product-images\Challah.jpg', 'Bread',1),
('Multigrain Bread', 'Bread made with multiple types of grains', 50.000, 'assets\product-images\MultigrainBread.jpg', 'Bread',1),
('Whole Wheat Bread', 'Bread made with whole wheat flour', 50.000, 'assets\product-images\WholeWheatBread.jpg', 'Bread',1),
('White Bread', 'Classic soft white bread', 50.000, 'assets\product-images\WhiteBread.jpg', 'Bread',1),
('Bagel', 'Dense, chewy bread ring', 50.000, 'assets\product-images\Bagel.jpg', 'Bread',1),
('Pretzel', 'Soft, baked bread twisted into a knot', 50.000, 'assets\product-images\Pretzel.jpg', 'Bread',1),
('Cornbread', 'Sweet, crumbly bread made with cornmeal', 50.000, 'assets\product-images\Cornbread.jpg', 'Bread',1),
('BananaBread', 'Moist, sweet bread made with bananas', 50.000, 'assets\product-images\BananaBread.jpg', 'Bread',1),
('Pumpkin Bread', 'Spiced, sweet bread made with pumpkin', 50.000, 'assets\product-images\PumpkinBread.jpg', 'Bread',1),
('Zucchini Bread', 'Moist, sweet bread made with zucchini', 50.000, 'assets\product-images\ZucchiniBread.jpg', 'Bread',1),
('Flatbread', 'Thin, crisp bread', 50.000, 'assets\product-images\Flatbread.jpg', 'Bread',1),
('Lavash', 'Soft, thin flatbread', 50.000, 'assets\product-images\Lavash.jpg', 'Bread',1),
('Chocolate Cake', 'Rich and moist chocolate cake', 80.000, 'assets\product-images\ChocolateCake.jpg', 'Cake',1),
('Vanilla Cake', 'Classic vanilla cake with buttercream frosting', 80.000, 'assets\product-images\VanillaCake.jpg', 'Cake',1),
('Red Velvet Cake', 'Soft red velvet cake with cream cheese frosting', 80.000, 'assets\product-images\RedVelvetCake.jpg', 'Cake',1),
('Carrot Cake', 'Spiced carrot cake with cream cheese frosting', 80.000, 'assets\product-images\CarrotCake.jpg', 'Cake',1),
('Cheesecake', 'Creamy cheesecake with a graham cracker crust', 80.000, 'assets\product-images\Cheesecake.jpg', 'Cake',1),
('Lemon Cake', 'Tangy lemon cake with lemon glaze', 80.000, 'assets\product-images\LemonCake.jpg', 'Cake',1),
('Coffee Cake', 'Moist coffee-flavored cake with coffee icing', 80.000, 'assets\product-images\CoffeeCake.jpg', 'Cake',1),
('Strawberry Shortcake', 'Light and fluffy cake with fresh strawberries and cream', 80.000, 'assets\product-images\StrawberryShortcake.jpg', 'Cake',1),
('Black Forest Cake', 'Chocolate cake with cherries and whipped cream', 80.000, 'assets\product-images\BlackForestCake.jpg', 'Cake',1),
('Tiramisu', 'Italian dessert with layers of coffee-soaked sponge and mascarpone', 80.000, 'assets\product-images\Tiramisu.jpg', 'Cake',1),
('Pineapple Upside Down Cake', 'Moist cake topped with caramelized pineapple', 80.000, 'assets\product-images\PineappleUpsideDownCake.jpg', 'Cake',1),
('Blueberry Muffin Cake', 'Cake with fresh blueberries and a hint of lemon', 80.000, 'assets\product-images\BlueberryMuffinCake.jpg', 'Cake',1),
('Coconut Cake', 'Light coconut-flavored cake with coconut frosting', 80.000, 'assets\product-images\CoconutCake.jpg', 'Cake',1),
('Banana Cake', 'Moist banana cake with cream cheese frosting', 80.000, 'assets\product-images\BananaCake.jpg', 'Cake',1),
('Raspberry Cake', 'Delicate cake with fresh raspberries and cream', 80.000, 'assets\product-images\RaspberryCake.jpg', 'Cake',1),
('Pumpkin Cake', 'Spiced pumpkin cake with cream cheese frosting', 80.000, 'assets\product-images\PumpkinCake.jpg', 'Cake',1),
('Matcha Cake', 'Japanese green tea-flavored cake', 80.000, 'assets\product-images\MatchaCake.jpg', 'Cake',1),
('Opera Cake', 'French layered cake with coffee and chocolate', 80.000, 'assets\product-images\OperaCake.jpg', 'Cake',1),
('Sacher Torte', 'Austrian chocolate cake with apricot filling', 80.000, 'assets\product-images\SacherTorte.jpg', 'Cake',1),
('Almond Cake', 'Delicate almond-flavored cake with almond frosting', 80.000, 'assets\product-images\AlmondCake.jpg', 'Cake',1),
('Green Tea', 'Refreshing green tea with a subtle flavor', 60.000, 'assets\product-images\GreenTea.jpg', 'Beverages',1),
('Black Tea', 'Black Tea', 60.000, 'assets\product-images\BlackTea.jpeg', 'Beverages',1),
('Chai Latte', 'Spiced tea with steamed milk', 60.000, 'assets\product-images\ChaiLatte.jpg', 'Beverages',1),
('Matcha Latte', 'Japanese matcha green tea with steamed milk', 60.000, 'assets\product-images\MatchaLatte.jpg', 'Beverages',1),
('Milk Tea', 'Classic milk tea with a creamy texture', 60.000, 'assets\product-images\MilkTea.jpg', 'Beverages',1),
('Oolong Tea', 'Smooth oolong tea with a floral aroma', 60.000, 'assets\product-images\OolongTea.jpg', 'Beverages',1),
('Earl Grey Tea', 'Black tea infused with bergamot oil', 60.000, 'assets\product-images\EarlGreyTea.jpg', 'Beverages',1),
('Hibiscus Tea', 'Tart and tangy hibiscus tea', 60.000, 'assets\product-images\HibiscusTea.jpg', 'Beverages',1),
('Chamomile Tea', 'Calming chamomile tea with a floral flavor', 60.000, 'assets\product-images\ChamomileTea.jpg', 'Beverages',1),
('Thai Iced Tea', 'Sweet and creamy Thai iced tea', 60.000, 'assets\product-images\ThaiIcedTea.jpg', 'Beverages',1);
GO

-- Insert sample data into USERS table
INSERT INTO USERS (last_name, first_name, phone_number, email, address, username, password, is_admin)
VALUES 
    ('Smith', 'John', '123-456-7890', 'john.smith@example.com', '123 Main St', 'johnsmith', 'password123', 0),
    ('Doe', 'Jane', '234-567-8901', 'jane.doe@example.com', '456 Elm St', 'janedoe', 'password123', 0),
    ('Brown', 'Charlie', '345-678-9012', 'charlie.brown@example.com', '789 Oak St', 'charlieb', 'password123', 0),
    ('Wilson', 'Alice', '456-789-0123', 'alice.wilson@example.com', '101 Pine St', 'alicew', 'password123', 0),
    ('Johnson', 'David', '567-890-1234', 'david.johnson@example.com', '202 Maple St', 'davidj', 'password123', 1);
GO

-- Insert sample data into ORDERS table
INSERT INTO ORDERS (user_id, order_date, order_type, status, total_price)
VALUES 
    (1, CURRENT_TIMESTAMP, 'Online', 'Completed', 20.50),
    (2, CURRENT_TIMESTAMP, 'In-Store', 'Completed', 7.50),
    (3, CURRENT_TIMESTAMP, 'Online', 'Pending', 15.00),
    (4, CURRENT_TIMESTAMP, 'In-Store', 'Completed', 5.00),
    (5, CURRENT_TIMESTAMP, 'Online', 'Shipped', 25.00),
    (1, CURRENT_TIMESTAMP, 'In-Store', 'Completed', 3.50),
    (2, CURRENT_TIMESTAMP, 'Online', 'Cancelled', 12.00),
    (3, CURRENT_TIMESTAMP, 'In-Store', 'Completed', 8.50),
    (4, CURRENT_TIMESTAMP, 'Online', 'Completed', 18.00),
    (5, CURRENT_TIMESTAMP, 'In-Store', 'Completed', 9.00);
GO

-- Insert sample data into ORDER_ITEMS table
INSERT INTO ORDER_ITEMS (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 2, 7.00),
    (1, 2, 1, 2.00),
    (1, 4, 1, 3.00),
    (2, 3, 1, 2.50),
    (2, 5, 1, 4.00),
    (3, 6, 3, 7.50),
    (4, 7, 1, 1.00),
    (4, 8, 2, 5.00),
    (5, 9, 1, 3.00),
    (5, 10, 1, 3.50);
GO


use panyaBakery

SELECT 
    o.id AS order_id,
    o.user_id,
    p.name AS product,
    o.order_date,
    o.order_type,
    o.status,
    oi.price
FROM 
    ORDERS o
JOIN 
    ORDER_ITEMS oi ON o.id = oi.order_id
JOIN 
    PRODUCTS p ON oi.product_id = p.id
ORDER BY 
    o.id;


