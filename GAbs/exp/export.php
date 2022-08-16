<?php
require('database.php');
$sql="select * from etudiant";
$res=mysqli_query($con,$sql);
$html='<table><tr>
<th>CNE</th>
<th>Nom</th>
<th>Prenom</th>
<th>Ville</th>
<th>Email</th>
<th>Telephone</th></tr>';
while($row=mysqli_fetch_assoc($res)){
	$html.='<tr>
	<td>'.$row['CNE'].'</td>
	<td>'.$row['nom_etu'].'</td>
	<td>'.$row['prenom_etu'].'</td>
	<td>'.$row['ville_etu'].'</td>
	<td>'.$row['email_etu'].'</td>
	<td>'.$row['phone_etu'].'</td>
	</tr>';
}
$html.='</table>';
header('Content-Type:application/xls');
header('Content-Disposition:attachment;filename=report.xls');
echo $html;
?>