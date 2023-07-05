<!DOCTYPE html>

<!-- Included the DB connector -->
<?php include 'db.php'; ?>
<?php
$sql = "select * from events";
$rows = $db->query($sql);
$rw = $db->query($sql);
?>

<?php
// Set your timezone!! function sets the default timezone used by all date/time functions in the script.
date_default_timezone_set('America/Vancouver');

// Get prev & next month
if (isset($_GET['ym'])) {
    $ym = $_GET['ym'];
} else {
    // This month
    $ym = date('Y-m');
}

// Check format ....strtotime(time, now)...This method is for the PREV and NEXT buttons
// takes UNIX time and uses it as a reference point
$timestamp = strtotime($ym . '-01');  // the first day of the month
if ($timestamp === false) {
    $ym = date('Y-m');
    $timestamp = strtotime($ym . '-01');
}

// Today (Format:2021-11-8).....j - The day of the month without leading zeros (1 to 31)
$today = date('Y-m-j');

// Title (Format:November, 2021) // in the <head>, 2nd <li>
$title = date('F, Y', $timestamp);

// Create prev & next month link
$prev = date('Y-m', strtotime('-1 month', $timestamp));
$next = date('Y-m', strtotime('+1 month', $timestamp));

// Number of days in the month....t - The number of days in the given month
$day_count = date('t', $timestamp);

// 1:Mon 2:Tue 3: Wed ... 7:Sun.....N - The ISO-8601 numeric repres. of a day (1 for Monday, 7 for Sunday)
$str = date('N', $timestamp);

// Array for calendar
$weeks = [];
$week = '';

// Add empty cell(s)....The str_repeat() function repeats a string a specified number of times.
// creates the horizontal boxes for the week
$week .= str_repeat('<td></td>', $str - 1); // MAYBE PUT A PHP ECHO STATEMENT HERE????

// increments the day of month, and day of the week, from 1-7

for ($day = 1; $day <= $day_count; $day++, $str++) {

    $num = sprintf("%02d", $day); // Formats the day so it has a leading zero (e.g. 01, 02, 03... etc, but only for the single digits)

    $date = $ym . '-' . $num;

    if ($today == $date) {
        $week .= '<td class="today">'; // styles todays date as greyish
    } else {
        $week .= '<td class=width>'; // styles the box as plain white
    }

    $week .= $day; // Shows the days on the calendar

    foreach ($rw as $r) {

        if ($r['date'] == $date) {
            $week .=  '<br>' . '<div class="rectangle">' . $r['name'] . '</div>'; // Shows the name of the event on its corresponding date
        }
		if($r['date'] == $today){
			include(reminder.php);
		}
    }

    if ($str % 7 == 0 || $day == $day_count) {

        // last day of the month
        if ($day == $day_count && $str % 7 != 0) {
            // Add empty cell(s)
            $week .= str_repeat('<td></td>', 7 - $str % 7);
        }

        $weeks[] = '<tr>' . $week . '</tr>'; // inserts the row for that week

        $week = '';
    }
}
?>

<html lang="en">

<head>
    <meta charset="utf-8">
    <!-- This below is the JQuery code that is mandatory -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- This below is the JavaScript code that is mandatory -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- This below is the CSS code that is mandatory -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity+sha384-BVYiiSIFeK1dGmJRAkycuHAHRg320mUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>Event Scheduling Calendar</title>
</head>

<body>

    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <style>
        body {
            /* Adds whitespace to top and bottom of page, feel free to change */
            margin-top: 50px;
            margin-bottom: 400px;
        }

        .container1 {
            /* For calendar */
            font-family: 'Montserrat', sans-serif;
            margin: 60px auto;

        }

        .container2 {
            /* For event list; centers text */
            font-family: 'Montserrat', sans-serif;
            margin: 60px auto;
        }

        .left {
            text-align: left;
        }

        .rectangle {
            height: auto;
            width: auto;
            background-color: #a2b2cc;
            font-weight: bold;
            font-size: 12px;
            position: center;
            color: black;
            border-radius: 10px;

        }

        .list-inline {
            text-align: center;
            margin-bottom: 30px;
        }

        .title {
            font-weight: bold;
            font-size: 26px;
        }

        th {
            text-align: center;
        }

        .width {
            width: 100px;
            height: 80px;
        }


        th {
            text-align: center;
        }

        td {
            height: 50px;

        }

        th:nth-of-type(6),
        td:nth-of-type(6) {
            color: blue;
        }

        th:nth-of-type(7),
        td:nth-of-type(7) {
            color: blue;
        }

        .today {
            background-color: ghostwhite;
        }
    </style>
    </head>

    <body>
        <div class="container2">
            <center>
                <h1>List of Events</h1>
            </center>
                        <!-- This is the hover functionality that makes the index page go grey when hovering items-->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Event #</th>
                                    <th scope="col">Event Category</th>
                                    <th scope="col">Event Name</th>
                                    <th scope="col">Event Date</th>
                                    <th scope="col">Event Time</th>
                                </tr>
                            </thead>
							
							<?php if ($date ==   '2021-12-07') ?>
                            <tbody>
                                <tr>
                                    <!-- This returns an associative array so we can loop through it -->
                                    <?php while ($row = $rows->fetch_assoc()) { ?>
                                        <th><center><?php echo $row['id'] ?></center></th>
                                        <td><center><?php echo $row['category'] ?></center></td>
                                        <td class="col-md-4"><center><?php echo $row['name'] ?></center></td>
                                        <td><center><?php echo $row['date'] ?></center></td>
                                        <td><center><?php echo $row['time'] ?></td>
                                        <td><a href="index.php" class="btn btn-default">Exit</a></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                </div>

    </body>

</html>