<?PHP 
$con=mysqli_connect('localhost','root','','GAbs');
$sql="select * from enseignant";
$res=mysql_query($con,$sql);
$html='<table><tr><td>Name</td><td>fdd</td><td>dsds</td><td>sdsd</td></tr>';
while($row=mysqli_fetch_assoc($res)){
	$html.='<tr><td>sdfsdf</td><td>dfd</td><td>dfsd</td></tr>';
}
$html.='</table>';
header('Content-Type:application/xls');
header('Content-Disposition:attachment;filename=report.xls');
echo $html;
?>