<?php 

$host = @$_SERVER["HTTP_HOST"];

switch($host){
    case "www.adress.com":
        $env = "prod";
        break;
    case "adress.com":
        $env = "prod";
        break;
    default:
        $env = "localhost";
        break;
}
if($env == "prod"){
    $servername = "localhost";
    $username = "";
    $password = "";
    $dbname = "grocery_data";
} else{
    // local
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "grocery_data";
}
