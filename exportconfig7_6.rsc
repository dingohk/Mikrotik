#RouterOS 7.6 or before
:local systemname [/system identity get name];
#:local systemdate [/system clock get date];

:local date [/system clock get date];
:local months {"jan"="01";"feb"="02";"mar"="03";"apr"="04";"may"="05";"jun"="06";"jul"="07";"aug"="08";"sep"="09";"oct"=10;"nov"=11;"dec"=12};
:local day [:pick $date 4 6]; 
#[:tonum [:pick $date 4 6]];
:local year [:tonum [:pick $date 7 11]];
:local month [:pick $date 0 3];
:local mm (:$months->$month);
:local newdate "$year$mm$day";

:local Time [/system clock get time]


# Format YYYYMMDD-HHMMSS
:local DateTimeCode ($newdate . "-".[:pick $Time 0 2].[:pick $Time 3 5]);
#:local DateTimeCode ($newdate . "-".[:pick $Time 0 2].[:pick $Time 3 5].[:pick $Time 6 8])
:local filename ($systemname . "-" . $DateTimeCode);

#line for ros7
/export terse show-sensitive file=$filename;
#line for ros6
#/export terse file=$filename; 
