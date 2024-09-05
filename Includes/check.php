<?php 

	//Calling the connection page
	include('connection.php');


	//Table to be used
	$table_name1 = "Items";
	
	$query1 = "SELECT COUNT(itemID) AS COUNT 
				FROM $table_name1
				WHERE Quantity < Mini_Quantity";
	$result1 = mysql_query($query1);
	$row1 = mysql_fetch_array($result1);
	$count = $row1['COUNT'];
			
	if($count > 0)
		{
		if($count == 1)
			{
		echo "There is <b> $count </b> Item under Minimum Quantity in Stock...";
		echo "<a class = 'view' href = 'default.php?id=itmudsp'><font size = '3'>View it</font></a>";		
			}
		else
			{
		echo "There are <b> $count </b> Items under Minimum Quantity in Stock...";
		echo "<a class = 'view' href = 'default.php?id=itmudsp'><font size = '3'>View them</font></a>";		
			}
		}
	else
		{
			
		}
		
mysql_close($con);		
?>