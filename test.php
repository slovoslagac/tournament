<?php
/**
 * Created by PhpStorm.
 * User: petar
 * Date: 23.11.2017
 * Time: 16:28
 */;
$arrayofmatches = array();
$numofteams = 16;
$matchnumber = 0;
$matchnumberperround = array();
$matchnumberend = array(0);
$round = 1;
$numofrounds = log($numofteams)/ log(2);

//function matchgenerator($numofteams){
for ($i = 1; $i <= $numofteams; $i++) {
//    while ($matchnumber < $numofteams) {
        if(fmod($i, 2) == 1){
            $matchnumber ++;
            $arrayofmatches[$matchnumber][0] = $i;
        } else {
            $arrayofmatches[$matchnumber][1] = $i;

        }
//    }


}
//print_r($arrayofmatches);

$matchnumberperround[1] = $matchnumber;
$matchnumberend[1] = $matchnumber;

for($r = 2; $r<= $numofrounds; $r++) {
    $matchnumberperround[$r] = $matchnumberperround[$r-1]/2;
    for ($m=$matchnumberend[$r-2]+1;$m<=$matchnumberend[$r-1]; $m++){
        $matchnumber++;
        $val = $matchnumberend[$r-2] + $m*2;
        $arrayofmatches[$matchnumber][0] = $m;
        $m++;
        $arrayofmatches[$matchnumber][1] = $m;

    }

    $matchnumberend[$r] = $matchnumber;
}


print_r($arrayofmatches);
echo"<br>";
