<?php
require('database.php');
$sql="select * from etudiant";
$res=mysqli_query($con,$sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Export data to excel in PHP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <a href="export.php"><button type="button" class="btn btn-primary">Export</button></a>
  <table class="table table-bordered  table-striped">
    <thead>
      <tr>
      <th>CNE</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Adresse</th>
        <th>Email</th>
        <th>Telephone</th>
      </tr>
    </thead>
    <tbody>
	 <?php while($row=mysqli_fetch_assoc($res)){?>	
	 <tr>
   <td><?php echo $row['CNE']?></td>
        <td><?php echo $row['nom_ens']?></td>
        <td><?php echo $row['prenom_ens']?></td>
        <td><?php echo $row['adresse_ens']?></td>
        <td><?php echo $row['email_ens']?></td>
        <td><?php echo $row['phone_ens']?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<style>
.btn{
	float: right;
    margin-bottom: 20px;
    margin-top: 20px;
}
</style>
</body>
</html>
