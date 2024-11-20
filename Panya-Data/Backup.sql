USE panyaBakery;

DELETE FROM dbo.ORDER_ITEMS
WHERE id IN (SELECT id FROM dbo.PRODUCTS)

DELETE FROM dbo.CATEGORIES
WHERE name IN (SELECT name FROM dbo.PRODUCTS)

DELETE FROM PRODUCTS;

SET IDENTITY_INSERT dbo.PRODUCTS ON;

INSERT INTO PRODUCTS(id, name, description, price, image, category_name, is_in_stock, created_at) VALUES
(1, 'Baguette', 'Classic French long loaf with a crispy crust', 50.000, 'assets\product-images\Baguette.jpg', 'Bread',1 ,16/7/2024),
(2, 'Ciabatta', 'Italian bread with a soft, airy interior', 50.000, 'assets\product-images\Ciabatta.jpg', 'Bread',1, 16/7/2024),
(3, 'Sourdough', 'Tangy bread made with natural yeast starter', 50.000, 'assets\product-images\Sourdough.jpg', 'Bread',1 , 16/7/2024),
(4, 'Rye Bread', 'Dense bread made with rye flour', 50.000, 'assets\product-images\RyeBread.jpg', 'Bread',1 , 16/7/2024),
(5, 'Focaccia', 'Italian flatbread with olive oil and herbs', 50.000, 'assets\product-images\Focaccia.jpg', 'Bread',1 , 16/7/2024),
(6, 'Brioche', 'Rich, buttery French bread', 50.000, 'assets\product-images\Brioche.jpg', 'Bread',1 , 16/7/2024),
(7, 'Pita Bread', 'Soft and chewy Middle Eastern flatbread', 50.000, 'assets\product-images\PitaBread.jpeg', 'Bread',1 , 16/7/2024),
(8, 'Naan', 'Leavened Indian flatbread', 50.000, 'assets\product-images\Naan.jpg', 'Bread',1 , 16/7/2024),
(9, 'Challah', 'Sweet, braided Jewish bread', 50.000, 'assets\product-images\Challah.jpg', 'Bread',1 , 16/7/2024),
(10, 'Multigrain Bread', 'Bread made with multiple types of grains', 50.000, 'assets\product-images\MultigrainBread.jpg', 'Bread',1 , 16/7/2024),
(11, 'Whole Wheat Bread', 'Bread made with whole wheat flour', 50.000, 'assets\product-images\WholeWheatBread.jpg', 'Bread',1 , 16/7/2024),
(12, 'White Bread', 'Classic soft white bread', 50.000, 'assets\product-images\WhiteBread.jpg', 'Bread',1 , 16/7/2024),
(13, 'Bagel', 'Dense, chewy bread ring', 50.000, 'assets\product-images\Bagel.jpg', 'Bread',1 , 16/7/2024),
(14, 'Pretzel', 'Soft, baked bread twisted into a knot', 50.000, 'assets\product-images\Pretzel.jpg', 'Bread',1 , 16/7/2024),
(15, 'Cornbread', 'Sweet, crumbly bread made with cornmeal', 50.000, 'assets\product-images\Cornbread.jpg', 'Bread',1 , 16/7/2024),
(16, 'BananaBread', 'Moist, sweet bread made with bananas', 50.000, 'assets\product-images\BananaBread.jpg', 'Bread',1 , 16/7/2024),
(17, 'Pumpkin Bread', 'Spiced, sweet bread made with pumpkin', 50.000, 'assets\product-images\PumpkinBread.jpg', 'Bread',1 , 16/7/2024),
(18, 'Zucchini Bread', 'Moist, sweet bread made with zucchini', 50.000, 'assets\product-images\ZucchiniBread.jpg', 'Bread',1 , 16/7/2024),
(19, 'Flatbread', 'Thin, crisp bread', 50.000, 'assets\product-images\Flatbread.jpg', 'Bread',1 , 16/7/2024),
(20, 'Lavash', 'Soft, thin flatbread', 50.000, 'assets\product-images\Lavash.jpg', 'Bread',1 , 16/7/2024),
(21, 'Chocolate Cake', 'Rich and moist chocolate cake', 80.000, 'assets\product-images\ChocolateCake.jpg', 'Cake',1 , 16/7/2024),
(22, 'Vanilla Cake', 'Classic vanilla cake with buttercream frosting', 80.000, 'assets\product-images\VanillaCake.jpg', 'Cake',1 , 16/7/2024),
(23, 'Red Velvet Cake', 'Soft red velvet cake with cream cheese frosting', 80.000, 'assets\product-images\RedVelvetCake.jpg', 'Cake',1 , 16/7/2024),
(24, 'Carrot Cake', 'Spiced carrot cake with cream cheese frosting', 80.000, 'assets\product-images\CarrotCake.jpg', 'Cake',1 , 16/7/2024),
(25, 'Cheesecake', 'Creamy cheesecake with a graham cracker crust', 80.000, 'assets\product-images\Cheesecake.jpg', 'Cake',1 , 16/7/2024),
(26, 'Lemon Cake', 'Tangy lemon cake with lemon glaze', 80.000, 'assets\product-images\LemonCake.jpg', 'Cake',1 , 16/7/2024),
(27, 'Coffee Cake', 'Moist coffee-flavored cake with coffee icing', 80.000, 'assets\product-images\CoffeeCake.jpg', 'Cake',1 , 16/7/2024),
(28, 'Strawberry Shortcake', 'Light and fluffy cake with fresh strawberries and cream', 80.000, 'assets\product-images\StrawberryShortcake.jpg', 'Cake',1 , 16/7/2024),
(29, 'Black Forest Cake', 'Chocolate cake with cherries and whipped cream', 80.000, 'assets\product-images\BlackForestCake.jpg', 'Cake',1 , 16/7/2024),
(30, 'Tiramisu', 'Italian dessert with layers of coffee-soaked sponge and mascarpone', 80.000, 'assets\product-images\Tiramisu.jpg', 'Cake',1 , 16/7/2024),
(31, 'Pineapple Upside Down Cake', 'Moist cake topped with caramelized pineapple', 80.000, 'assets\product-images\PineappleUpsideDownCake.jpg', 'Cake',1 , 16/7/2024),
(32, 'Blueberry Muffin Cake', 'Cake with fresh blueberries and a hint of lemon', 80.000, 'assets\product-images\BlueberryMuffinCake.jpg', 'Cake',1 , 16/7/2024),
(33, 'Coconut Cake', 'Light coconut-flavored cake with coconut frosting', 80.000, 'assets\product-images\CoconutCake.jpg', 'Cake',1 , 16/7/2024),
(34, 'Banana Cake', 'Moist banana cake with cream cheese frosting', 80.000, 'assets\product-images\BananaCake.jpg', 'Cake',1 , 16/7/2024),
(35, 'Raspberry Cake', 'Delicate cake with fresh raspberries and cream', 80.000, 'assets\product-images\RaspberryCake.jpg', 'Cake',1 , 16/7/2024),
(36, 'Pumpkin Cake', 'Spiced pumpkin cake with cream cheese frosting', 80.000, 'assets\product-images\PumpkinCake.jpg', 'Cake',1 , 16/7/2024),
(37, 'Matcha Cake', 'Japanese green tea-flavored cake', 80.000, 'assets\product-images\MatchaCake.jpg', 'Cake',1 , 16/7/2024),
(38, 'Opera Cake', 'French layered cake with coffee and chocolate', 80.000, 'assets\product-images\OperaCake.jpg', 'Cake',1 , 16/7/2024),
(39, 'Sacher Torte', 'Austrian chocolate cake with apricot filling', 80.000, 'assets\product-images\SacherTorte.jpg', 'Cake',1 , 16/7/2024),
(40, 'Almond Cake', 'Delicate almond-flavored cake with almond frosting', 80.000, 'assets\product-images\AlmondCake.jpg', 'Cake',1 , 16/7/2024),
(41, 'Green Tea', 'Refreshing green tea with a subtle flavor', 60.000, 'assets\product-images\GreenTea.jpg', 'Beverages',1 , 16/7/2024),
(42, 'Black Tea', 'Black Tea', 60.000, 'assets\product-images\BlackTea.jpeg', 'Beverages',1 , 16/7/2024),
(43, 'Chai Latte', 'Spiced tea with steamed milk', 60.000, 'assets\product-images\ChaiLatte.jpg', 'Beverages',1 , 16/7/2024),
(44, 'Matcha Latte', 'Japanese matcha green tea with steamed milk', 60.000, 'assets\product-images\MatchaLatte.jpg', 'Beverages',1 , 16/7/2024),
(45, 'Milk Tea', 'Classic milk tea with a creamy texture', 60.000, 'assets\product-images\MilkTea.jpg', 'Beverages',1 , 16/7/2024),
(46, 'Oolong Tea', 'Smooth oolong tea with a floral aroma', 60.000, 'assets\product-images\OolongTea.jpg', 'Beverages',1 , 16/7/2024),
(47, 'Earl Grey Tea', 'Black tea infused with bergamot oil', 60.000, 'assets\product-images\EarlGreyTea.jpg', 'Beverages',1 , 16/7/2024),
(48, 'Hibiscus Tea', 'Tart and tangy hibiscus tea', 60.000, 'assets\product-images\HibiscusTea.jpg', 'Beverages',1 , 16/7/2024),
(49, 'Chamomile Tea', 'Calming chamomile tea with a floral flavor', 60.000, 'assets\product-images\ChamomileTea.jpg', 'Beverages',1 , 16/7/2024),
(50, 'Thai Iced Tea', 'Sweet and creamy Thai iced tea', 60.000, 'assets\product-images\ThaiIcedTea.jpg', 'Beverages',1 , 16/7/2024);
