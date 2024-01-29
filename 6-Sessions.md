# Sessions

PHP sessions are often used to maintain user-specific data across multiple pages during a user's visit to a website. A common use case for sessions is implementing a shopping cart functionality in an e-commerce website.

### 1. **Initialize Session:**

Firstly, start the session at the beginning of each PHP file where you want to use session variables.

```php
<?php
session_start();
?>
```

### 2. **Add Product to Cart:**

Assuming you have a list of products with their details, you can create a page to display the products and allow users to add items to their cart.

**product_list.php:**

```php
<?php
// Initialize session
session_start();

// Sample product list
$products = [
    ['id' => 1, 'name' => 'Product A', 'price' => 10.99],
    ['id' => 2, 'name' => 'Product B', 'price' => 19.99],
    ['id' => 3, 'name' => 'Product C', 'price' => 5.99]
];

// Check if a product is added to the cart
if (isset($_POST['add_to_cart'])) {
    $productId = $_POST['product_id'];

    // Check if the product is already in the cart
    if (!isset($_SESSION['cart'][$productId])) {
        // Add the product to the cart with a quantity of 1
        $_SESSION['cart'][$productId] = ['quantity' => 1, 'name' => $products[$productId - 1]['name'], 'price' => $products[$productId - 1]['price']];
    } else {
        // If the product is already in the cart, increment the quantity
        $_SESSION['cart'][$productId]['quantity']++;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    
    <?php foreach ($products as $product): ?>
        <form method="post" action="">
            <h3><?php echo $product['name']; ?></h3>
            <p>Price: $<?php echo $product['price']; ?></p>
            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
            <input type="submit" name="add_to_cart" value="Add to Cart">
        </form>
    <?php endforeach; ?>

    <p><a href="view_cart.php">View Cart</a></p>
</body>
</html>
```

### 3. **View Cart:**

Create a page to display the items in the shopping cart.

**view_cart.php:**

```php
<?php
// Initialize session
session_start();

// Check if the cart is not empty
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    echo "<h1>Shopping Cart</h1>";

    foreach ($_SESSION['cart'] as $productId => $product) {
        echo "<p>{$product['name']} (Quantity: {$product['quantity']}, Price: \${$product['price']} each)</p>";
    }

    echo "<p>Total Items: " . array_sum(array_column($_SESSION['cart'], 'quantity')) . "</p>";
    echo "<p>Total Price: \$" . number_format(array_sum(array_map(function($product) {
        return $product['quantity'] * $product['price'];
    }, $_SESSION['cart'])), 2) . "</p>";
} else {
    echo "<h1>Your shopping cart is empty.</h1>";
}
?>
```

In this example, the session variable `$_SESSION['cart']` is used to store the items added to the shopping cart. The `product_list.php` page displays a list of products, and when a user clicks "Add to Cart," the corresponding product is added to the session variable.

The `view_cart.php` page then displays the contents of the cart, including the quantity, name, and price of each item, along with the total number of items and the total price.