# 1. Basic

Sure, let's cover some basics of PHP. PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. Below are some fundamental concepts and examples:

### 1. **Syntax:**
   PHP code is embedded within HTML and is enclosed within `<?php` and `?>` tags.

   ```php
   <?php
      // Your PHP code goes here
   ?>
   ```

### 2. **Variables:**
   Variables in PHP start with a dollar sign `$` followed by the variable name. PHP is loosely typed, so you don't need to declare variable types.

   ```php
   <?php
      $name = "John";
      $age = 25;
   ?>
   ```

### 3. **Echo and Print:**
   You can use `echo` or `print` to output content to the browser.

   ```php
   <?php
      echo "Hello, $name!";
      print("Age: $age");
   ?>
   ```

### 4. **Data Types:**
   PHP supports various data types, including strings, integers, floats, booleans, arrays, and more.

   ```php
   <?php
      $stringVar = "Hello";
      $intVar = 42;
      $floatVar = 3.14;
      $boolVar = true;
      $arrayVar = array("apple", "banana", "cherry");
   ?>
   ```

### 5. **Operators:**
   PHP supports a variety of operators for arithmetic, comparison, logical operations, etc.

   ```php
   <?php
      $result = $a + $b;  // Addition
      $isEqual = ($a == $b);  // Equal to
      $logicalAnd = ($x && $y);  // Logical AND
   ?>
   ```

### 6. **Conditional Statements:**
   Use `if`, `else if`, and `else` for conditional logic.

   ```php
   <?php
      if ($age >= 18) {
         echo "You are an adult.";
      } else {
         echo "You are a minor.";
      }
   ?>
   ```

### 7. **Loops:**
   Use `for`, `while`, or `foreach` for looping.

   ```php
   <?php
      for ($i = 0; $i < 5; $i++) {
         echo $i;
      }

      $numbers = array(1, 2, 3, 4, 5);
      foreach ($numbers as $number) {
         echo $number;
      }
   ?>
   ```

### 8. **Functions:**
   Define functions using the `function` keyword.

   ```php
   <?php
      function greet($name) {
         echo "Hello, $name!";
      }

      greet("Alice");
   ?>
   ```

### 9. **Include and Require:**
   Include external PHP files using `include` or `require`.

   ```php
   <?php
      include 'header.php';
      require 'footer.php';
   ?>
   ```

### 10. **Form Handling:**
   PHP is commonly used to handle HTML forms. Access form data using `$_POST` or `$_GET` superglobals.

   ```php
   <?php
      $username = $_POST['username'];
      $password = $_POST['password'];
   ?>
   ```

# 2. Relative paths
In PHP, you can use relative paths to refer to resources such as files, images, or other web pages within your project directory structure. Relative paths are specified in relation to the current working directory or the location of the script file. Here are some common ways to create relative paths in PHP:

1. **Basic Relative Paths:**

   ```php
   // Assuming your PHP file is in the root directory
   $relativePath = 'images/image.jpg';
   ```

   This path is relative to the location of the current PHP script.

2. **Using `dirname(__FILE__)` or `__DIR__`:**

   ```php
   // Using dirname(__FILE__)
   $currentDirectory = dirname(__FILE__);
   $relativePath = $currentDirectory . '/images/image.jpg';

   // Using __DIR__
   $currentDirectory = __DIR__;
   $relativePath = $currentDirectory . '/images/image.jpg';
   ```

   Both `dirname(__FILE__)` and `__DIR__` give you the absolute path of the current script's directory, and you can append the relative path to it.

3. **Using `$_SERVER['DOCUMENT_ROOT']`:**

   ```php
   // Assuming your web root is "/var/www/html"
   $documentRoot = $_SERVER['DOCUMENT_ROOT'];
   $relativePath = $documentRoot . '/images/image.jpg';
   ```

   This method gives you the absolute path of the web server's document root, and you can append the relative path to it.

4. **Using `../` to Move Up a Directory:**

   ```php
   // Moving up one directory from the current script
   $relativePath = '../images/image.jpg';
   ```

   Use `../` to move up one level in the directory structure.

