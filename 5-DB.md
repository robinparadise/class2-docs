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

# 2. Object and arrays in PHP-JS

To include and create an array of objects from a database query in a PHP page, and then use that array of objects in a JavaScript function, you can follow these steps:

### 1. Include Database Connection:

Assuming you have a database connection file (e.g., `db_connect.php`), include it in your PHP file.

```php
<?php
include 'db_connect.php';
?>
```

### 2. Query Database and Create Array of Objects:

Perform a database query and fetch the results. Create an array of objects from the query result.

```php
<?php
// Assuming you have a function to connect to the database in db_connect.php
include 'db_connect.php';

// Perform a database query (replace 'your_table' with your actual table name)
$query = "SELECT * FROM your_table";
$result = $conn->query($query);

// Create an array of objects from the query result
$dataArray = array();
while ($row = $result->fetch_assoc()) {
    $dataArray[] = $row;
}
?>
```

### 3. Convert PHP Array to JSON:

Convert the PHP array to a JSON string using `json_encode`. This step is necessary to pass the data from PHP to JavaScript.

```php
<?php
// Convert PHP array to JSON
$jsonData = json_encode($dataArray);
?>
```

### 4. Use JSON Data in JavaScript:

Include the JSON data in your JavaScript code. You can echo the JSON data directly into a JavaScript variable.

```php
<?php
// Include JSON data in JavaScript
echo "<script>";
echo "var jsonData = " . $jsonData . ";";
echo "</script>";
?>
```

### 5. Use the Data in a JavaScript Function:

Now you can use the `jsonData` variable in your JavaScript functions.

```html
<script>
function processJsonData() {
    // Access the jsonData variable here
    console.log(jsonData);

    // Example: Iterate through the array of objects
    for (let i = 0; i < jsonData.length; i++) {
        console.log("ID: " + jsonData[i].id + ", Name: " + jsonData[i].name);
    }
}

// Call the function when the page is loaded
document.addEventListener("DOMContentLoaded", function () {
    processJsonData();
});
</script>
```

# 3. AJAX

A modern approach: The Fetch API to retrieve data from the server asynchronously:

### 1. Create a PHP Endpoint to Fetch Data:

Create a PHP script that fetches data from the database and returns it as JSON. This script will be called asynchronously using the Fetch API.

```php
<?php
// your_fetch_data.php

include 'db_connect.php';

// Perform a database query (replace 'your_table' with your actual table name)
$query = "SELECT * FROM your_table";
$result = $conn->query($query);

// Create an array of objects from the query result
$dataArray = array();
while ($row = $result->fetch_assoc()) {
    $dataArray[] = $row;
}

// Output the data as JSON
header('Content-Type: application/json');
echo json_encode($dataArray);
?>
```

### 2. Use Fetch API in JavaScript:

In your HTML or main PHP file, use JavaScript to fetch data from the PHP endpoint.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Data Example</title>
</head>
<body>

<script>
// Fetch data from PHP endpoint
fetch('your_fetch_data.php')
    .then(response => response.json())
    .then(data => {
        // Data is available in the 'data' variable
        console.log(data);

        // Example: Iterate through the array of objects
        for (let i = 0; i < data.length; i++) {
            console.log("ID: " + data[i].id + ", Name: " + data[i].name);
        }

        // You can pass 'data' to your functions or use it as needed
        processJsonData(data);
    })
    .catch(error => console.error('Error fetching data:', error));

function processJsonData(data) {
    // Your processing logic here
    // ...

    // Example: Output data to the console
    console.log("Processing data:", data);
}
</script>

</body>
</html>
```

This approach separates the data retrieval logic into a dedicated PHP script (`your_fetch_data.php`) and uses the Fetch API in JavaScript to asynchronously request the data. This results in a cleaner separation of concerns and can make your code more maintainable.

# 4. PDO

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