CREATE TABLE [customer] (
  [id_customer] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] varchar(45),
  [last_name] varchar(45),
  [email] varchar(45),
  [password] varchar(45),
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [subscription] (
  [id_subsription] int PRIMARY KEY IDENTITY(1, 1),
  [status] varchar(45),
  [created_at] datetime,
  [updated_at] datetime,
  [fk_customer] int,
  [fk_product_subsribed_to] int
)
GO

CREATE TABLE [order] (
  [id_order] int PRIMARY KEY IDENTITY(1, 1),
  [order_number] varchar(45),
  [delivery_date] date,
  [purchase_price] decimal(8,2),
  [created_at] datetime,
  [updated_at] datetime,
  [fk_subscription] int,
  [fk_product] int
)
GO

CREATE TABLE [product] (
  [id_product] int PRIMARY KEY IDENTITY(1, 1),
  [product_sku] varchar(45),
  [number_of_recepies] tinyint,
  [number_of_meals] tinyint,
  [fk_product_family] int
)
GO

CREATE TABLE [product_family] (
  [id_product_family] int PRIMARY KEY IDENTITY(1, 1),
  [product_family_handle] varchar(45)
)
GO

ALTER TABLE [subscription] ADD FOREIGN KEY ([fk_customer]) REFERENCES [customer] ([id_customer])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([fk_subscription]) REFERENCES [subscription] ([id_subsription])
GO

ALTER TABLE [product] ADD FOREIGN KEY ([fk_product_family]) REFERENCES [product_family] ([id_product_family])
GO

ALTER TABLE [subscription] ADD FOREIGN KEY ([fk_product_subsribed_to]) REFERENCES [product] ([id_product])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([fk_product]) REFERENCES [product] ([id_product])
GO
-- And given the following information:
-- * created_at fields have a timestamp of the time at which a row was inserted in a table for
-- the first time.
-- * product_sku is unique for every product.
-- * product_family_handle is unique for every product family.
-- * Subscription status can be: ‘paused’, ‘cancelled’ or ‘active’.
-- * The fk_product field in the order table indicates the product that was purchased in an
-- order. The fk_product_subscribed_to in the subscription table indicates the product a
-- subscription is currently subscribed to. A subscription can change the product it is
-- subscribed to at any moment.
-- * An order is generated when a box is shipped to a customer

-- Write SQL statements to retrieve the following information:
-- 1. For the customer with email address ‘fancygirl83@hotmail.com’ show all product_skus
-- the customer has an active subscription for.

SELECT product_sku FROM product 
  INNER JOIN subscription ON product.id_product = subscription. id_product 
  INNER JOIN customer ON subscription.id_customer = customer.id_customer 
    WHERE customer.email = "fancygirl83@hotmail.com" 
      AND subscription.status = "active";

-- 2. Get all the customers that have an active subscription to a product that corresponds to a
-- product family with product_family_handle = ‘classic-box’

SELECT first_name, last_name FROM customer 
  INNER JOIN subscription ON customer.id_customer = subscription.id_customer 
  INNER JOIN product ON subscription.id_product = product.id_product 
  INNER JOIN product_family ON product.id_product_family=product.id_product_family 
    WHERE product_family_handle = "classic-box"

-- 3. Get all the paused subscriptions that have only received one box.

Select status From subscription 
  Inner join order on subscription.id_subscription = order.id_subscription 
  Where status = “paused” 
    and order_number = “received one box”

-- 4. How many subscriptions do our customers have on average?

-- 5. How many customers have ordered more than one product?

-- 6. How many customers have ordered more that one product with the same subscription?

-- 7. Get a list of all customers which got a box delivered to them two weeks ago, and the 
-- count of boxes that had been delivered to them up to that week (loyalty)

-- 8. For all our customers, get the date of the latest order delivered to them and include
-- associated product_sku, delivery_date and purchase price. If there were two orders
-- delivered to the same customer on the same date, they should both appear.