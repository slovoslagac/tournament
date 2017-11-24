<?php
/**
 * Created by PhpStorm.
 * User: petar
 * Date: 23.11.2017
 * Time: 16:28
 */
;
$tmpArray = array(1,5,4,7,8,11);
$numMatch = array();


function matchgenerator($array){
    $numparticipants = count($array);
    $maxnumMatches = ceil($numparticipants/2);
    $maxturnamentParticipants=0;
    $tmpcount = 0;
    while ($numparticipants > $maxturnamentParticipants) {
        $maxturnamentParticipants = pow(2,$tmpcount);
        $tmpcount++;
    }

    $freeparticipants = $maxturnamentParticipants - $numparticipants;

    echo "$maxnumMatches - $maxturnamentParticipants ($freeparticipants)<br>";
    for($i=1;  $i<=$maxnumMatches; $i++ ) {
        $home = $i*2-2;
        $away = $i*2-1;
        echo "mec broj $i igraju $array[$home] - $array[$away]<br>";
    }


}


matchgenerator($tmpArray);