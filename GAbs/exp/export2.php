<?php
require('database.php');
$sql="select * from enseignant";
$res=mysqli_query($con,$sql);
$html='<table><tr>
<th>Nom</th>
<th>Prenom</th>
<th>Adresse</th>
<th>Email</th>
<th>Telephone</th></tr>';
while($row=mysqli_fetch_assoc($res)){
	$html.='<tr>
	<td>'.$row['nom_ens'].'</td>
	<td>'.$row['prenom_ens'].'</td>
	<td>'.$row['adresse_ens'].'</td>
	<td>'.$row['email_ens'].'</td>
	<td>'.$row['phone_ens'].'</td>
	</tr>';
}
$html.='</table>';
header('Content-Type:application/xls');
header('Content-Disposition:attachment;filename=report.xls');
echo $html;
?>