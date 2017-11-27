<?php
/**
 * Created by PhpStorm.
 * User: petar
 * Date: 26.11.2017
 * Time: 16:33
 */
if(isset($_POST["submit"])) {
$target_dir = "img/profile/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image

    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);



    echo "File is an image - ".$target_dir .basename($_FILES['fileToUpload']['name']);
    move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);

}
?>


<!DOCTYPE html>
<html>
<body>

<form action="upload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload Image" name="submit">
</form>

</body>
</html>