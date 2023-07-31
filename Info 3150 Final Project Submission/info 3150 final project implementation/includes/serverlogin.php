<?php
$servername = den1.mysql1.gear.host;
$username = info3150project;
$password = info_3150;

// Create connection
$conn = new mysqli_connect($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";
?>

$conn = mysqli_connect("den1.mysql1.gear.host", "info3150project", "info_3150");
  // Check connection
  if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
  } 
  $sql = "SELECT date, time, stockname, pricetobuy, pricetosell, numberofshares, gross, fee, net FROM login";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
   // output data of each row
   while($row = $result->fetch_assoc()) {
    echo "<tr><td>" . $row["id"]. "</td><td>" . $row["username"] . "</td><td>"
. $row["password"]. "</td></tr>";
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
//?>