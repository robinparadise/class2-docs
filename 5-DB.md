# 1. DB

When working with databases in PHP, you typically use the PHP Data Objects (PDO) extension or the MySQLi extension to interact with databases. Here's a basic example using PDO with MySQL, which is a common database combination. Before running the code, ensure that you have a MySQL database set up and replace the placeholders in the code with your actual database credentials.

### 1. **Connecting to the Database:**

```php
<?php
$host = 'your_database_host';
$dbname = 'your_database_name';
$username = 'your_database_username';
$password = 'your_database_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
```

Replace `'your_database_host'`, `'your_database_name'`, `'your_database_username'`, and `'your_database_password'` with your actual database connection details.

### 2. **Executing Queries:**

#### SELECT Query:

```php
<?php
try {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username");
    $username = 'john_doe';
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // Process $result
    print_r($result);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

#### INSERT Query:

```php
<?php
try {
    $stmt = $pdo->prepare("INSERT INTO users (username, email) VALUES (:username, :email)");
    $username = 'new_user';
    $email = 'new_user@example.com';
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    echo "Record inserted successfully";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

#### UPDATE Query:

```php
<?php
try {
    $stmt = $pdo->prepare("UPDATE users SET email = :email WHERE username = :username");
    $username = 'john_doe';
    $newEmail = 'john_doe@example.com';
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $newEmail);
    $stmt->execute();

    echo "Record updated successfully";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

#### DELETE Query:

```php
<?php
try {
    $stmt = $pdo->prepare("DELETE FROM users WHERE username = :username");
    $username = 'user_to_delete';
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    echo "Record deleted successfully";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

# 2. PDO

When working with PHP's PDO extension to fetch data from a database, you can use different fetch styles to determine how the result set is returned. Two common fetch styles are `PDO::FETCH_ASSOC` and `PDO::FETCH_OBJ`. Let's look at examples for each:

### 1. **FETCH_ASSOC:**

`PDO::FETCH_ASSOC` fetches the result set as an associative array where column names are used as keys.

```php
<?php
$host = 'your_database_host';
$dbname = 'your_database_name';
$username = 'your_database_username';
$password = 'your_database_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT username, email FROM users");
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $row) {
        echo "Username: " . $row['username'] . ", Email: " . $row['email'] . "<br>";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

In this example, `$result` will be an array where each element represents a row from the database, and you can access the values using column names.

### 2. **FETCH_OBJ:**

`PDO::FETCH_OBJ` fetches the result set as an object where properties are named after the columns.

```php
<?php
$host = 'your_database_host';
$dbname = 'your_database_name';
$username = 'your_database_username';
$password = 'your_database_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT username, email FROM users");
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_OBJ);

    foreach ($result as $row) {
        echo "Username: " . $row->username . ", Email: " . $row->email . "<br>";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
```

In this example, `$result` will be an array of objects, and you can access the column values using object properties.

Choose the fetch style that best fits your coding preferences or the specific requirements of your application. Both `FETCH_ASSOC` and `FETCH_OBJ` are commonly used, and the choice often comes down to personal or team preferences.