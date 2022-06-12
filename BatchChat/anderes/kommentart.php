<html>
<head>
<title>Bla</title>
<meta name="author">

<!------------------------------------------------------------------CSS ANFANG------------------------------------------------------------------------->

<style type="text/css">
body 
{
font-family:Arial, sans-serif
}

.text_table 
{
border:0px solid #000;
width:654px;
}
.td_text
{
text-align: left;
}

.comm_table 
{
border-style: ridge;
border:0px solid #000;
width:654px;
}

.td_comm
{
text-align: left;
border:1px solid #000;
}
form
{
align: left;
}
	
</style>
</head>
<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">

<!------------------------------------------------------------------CSS ENDE------------------------------------------------------------------------->



<?php
/*--------------------------------------------Deklaration der Variablen/Verbindungsdaten ANFANG-------------------------------------------------------*/
$nick = $_POST['nick'];
$kommentar = $_POST['kommentar'];
$submitbutton = $_POST['submitbutton'];
$date = $_POST['date'];

$id = $row['stories.id'];

$server="*****";
$user="****";
$pass="***";
$database="***";
/*---------------------------------------------Deklaration der Variablen/Verbindungsdaten ENDE--------------------------------------------------------*/



/*-----------------------------------------------Verbindung zum MySQL-Server Aufbauen ANFANG----------------------------------------------------------*/
$verbindung = mysql_connect($server, $user, $pass) or die ("Konnte Verbindung zur Datenbank nicht herstellen!");
// echo "<br>Verbindung zu server <b>$server</b> hergestellt.";
/*------------------------------------------------Verbindung zum MySQL-Server Aufbauen ENDE-----------------------------------------------------------*/



/*----------------------------------------------Verbindung zur MySQL-Datenbank Aufbauen ANFANG--------------------------------------------------------*/
mysql_select_db($database, $verbindung) or die("Fehler beim Zugriff auf die Datenbank <b>$database</b>");
// echo "<br>In Datenbank <b>$database</b> gewechselt... <br><br>";
/*-----------------------------------------------Verbindung zur MySQL-Datenbank Aufbauen ENDE---------------------------------------------------------*/



/*--------------------------------------------------Ausgabe des Textes mit der ID 1 ANFANG------------------------------------------------------------*/
$ausg1 = "SELECT text FROM stories WHERE textid = '1'";
$erg1 = mysql_query($ausg1) or die ("Query failed: " . mysql_error());

	while($row = mysql_fetch_object($erg1))
        {
        echo "
			  <center><table class='text_table'>
        	  <tr>
       		  <td class='td_text'>
       		  $row->text
       		  </td>
        	  </tr>
       	      </center>
			  <br><br><br>
			 ";
        }
/*---------------------------------------------------Ausgabe des Textes mit der ID 1 ENDE-------------------------------------------------------------*/



/*------------------------Speichern der textid in Variable -> Kombinierte Abhängigkeit von Kommentaren -> Text ANFANG---------------------------------*/
$txtid = "SELECT textid FROM stories WHERE textid = '1'";
$ergebnis = mysql_query($txtid);
while($row = mysql_fetch_array($ergebnis)) 
{
   $storieid = $row["textid"];
} 
/*---------------------------Speichern der textid in Variable -> Kombinierte Abhängigkeit von Kommentaren->Text ENDE----------------------------------*/
?>


<!----------------------------------------------Eingabefelder zum Schreiben von Kommentaren ANFANG----------------------------------------------------->
<table class='comm_table'>
<tr>
<td>
<form action='<?php echo $_SERVER['PHP_SELF']?>' method='post' target=''>
Name: <br><input type='Text' name='nick' value='' size='' maxlength=''>
</td>
</tr>
<br>
<tr>
<td>
Text: <br><textarea name="kommentar" cols="40" rows="10"></textarea>
<input type='hidden' name='date' value='<?php echo date('d.m.y'); ?>'>
</td>
</tr>
<tr>
<td>
<input type='Submit' name='submitbutton' value='Submit'>
</td>
</tr> 
</form>
</table>
<!-----------------------------------------------Eingabefelder zum Schreiben von Kommentaren ENDE------------------------------------------------------>

<?php

/*--------------------------------------Speichern der Kommentare in der Datenbank (in Tabelle 'comments') ANFANG---------------------------------------*/
if (isset($submitbutton))
{	
	$sql = "INSERT INTO comments (nick, kommentar, datum, storienr) VALUES('$nick', '$kommentar', '$date', '$storieid')";
	if (mysql_query($sql))
  		echo "<br>Kommentar eingetragen ! (SQL OK!)";
  	 	else
  		echo "<br>Kommentar <b>nicht</b> eingetragen. Bitte Admin informieren!</br>";
}
/*---------------------------------------Speichern der Kommentare in der Datenbank (in Tabelle 'comments') ENDE----------------------------------------*/



/*--------------------------------------------Ausgabe der in der Datenbank gespeicherten Kommentare ANFANG---------------------------------------------*/
$ausg1 = "SELECT nick, datum, kommentar FROM comments, stories WHERE comments.storienr = stories.textid";
$erg1 = mysql_query($ausg1) or die ("Query failed: " . mysql_error());

        while($row = mysql_fetch_object($erg1))
        {
        echo "<center><table class='comm_table'>
       	      <tr>
        	  <td class='td_comm'>
			  <b>
        	  $row->nick
			  </b>
              </td>
        	  </tr>
         	  <tr>
       		  <td class='td_comm'>
       		  $row->kommentar
       		  </td>
       		  </tr>
       		  <tr>
        	  <td class='td_comm'>
       		  $row->datum
       		  </td>
        	  </tr>
        	  </center>
        	  <br><br>
			 ";
        }
/*---------------------------------------------Ausgabe der in der Datenbank gespeicherten Kommentare ENDE----------------------------------------------*/

mysql_close($verbindung);
?>


</body>
</html>