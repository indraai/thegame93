#1000
Gunnar Larsen~
0 g 100
~
  wait 5s
  say Well?
  wait 2s
  say Any Radar return?
~
#1001
James Sneed~
0 g 100
~
  wait 6s
  emote looks up, a broad smile on his face.
  say This is it, friends—the Bottomless Crevasse.
  wait 4s
  emote shakes head
  say None.
  *set time after 10s here
~
#1002
Hash Tracker~
1 acg 100
n~
wait 2s
You are in %actor.room.vnum% currently.
~
#1003
Underground Kingdom Guide~
0 b 100
~
set fol %self.follower%
set inroom %self.room.vnum%
set startroom 1000
if %fol%
  if %inroom% == %startroom%
    wait 5 sec
    north
  else
    wait 60 sec
    %random.dir%
  end
else
  if %inroom% != %startroom%
    %mgoto% 1000
  end
end
~
#1005
RM1005~
2 g 100
~
set thetoken %actor.inventory(1013)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1008
R1008 Give Token~
2 g 100
~
set thetoken %actor.inventory(1008)%
set thisroom %actor.room.vnum%
set reward 50

if !%thetoken%
  wait 1s
  nop %actor.exp(%reward%)%
  %send% %actor% exp:You received %reward% EXP for your efforts.
  wait 1s
  nop %actor.gold(%reward%)%
  %send% %actor% gld:You received %reward% GOLD for a job well done.
  wait 1s
  %load% obj 1008 %actor%
  %send% %actor% tkn:You earned the 0x1008 Token Key.
end
~
#1012
R1012 Check Token~
2 g 100
~
set thetoken %actor.inventory(1020)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1013
R1013 Give Token~
2 g 100
~
set thetoken %actor.inventory(1013)%
set thisroom %actor.room.vnum%
set reward 60

if !%thetoken%
  wait 1s
  nop %actor.exp(%reward%)%
  %send% %actor% exp:You received %reward% EXP for your efforts.
  wait 1s
  nop %actor.gold(%reward%)%
  %send% %actor% gld:You received %reward% GOLD for a job well done.
  wait 1s
  %load% obj 1008 %actor%
  %send% %actor% tkn:You earned the 0x1013 Token Key.
end
~
#1020
R1020 Give Token~
2 g 100
~
set thetoken %actor.inventory(1020)%
set thisroom %actor.room.vnum%
set reward 70

if !%thetoken%
  wait 1s
  nop %actor.exp(%reward%)%
  %send% %actor% exp:You received %reward% EXP for your efforts.
  wait 1s
  nop %actor.gold(%reward%)%
  %send% %actor% gld:You received %reward% GOLD for a job well done.
  wait 1s
  %load% obj 1008 %actor%
  %send% %actor% tkn:You earned the 0x1020 Token Key.
end
~
#1021
RM1021~
2 g 100
~
set thetoken %actor.inventory(1032)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1026
RM1026~
2 g 100
~
set thetoken %actor.inventory(1024)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1037
RM1037~
2 g 100
~
set thetoken %actor.inventory(1047)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1039
RM1039~
2 g 100
~
set thetoken %actor.inventory(1047)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1044
RM1039~
2 g 100
~
set thetoken %actor.inventory(1023)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1051
RM1051~
2 g 100
~
set thetoken %actor.inventory(1064)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1053
RM1053~
2 g 100
~
set thetoken %actor.inventory(1060)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1055
RM1055~
2 g 100
~
set thetoken %actor.inventory(1062)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1058
RM1058~
2 g 100
~
set thetoken %actor.inventory(1072)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1068
RM1068~
2 g 100
~
set thetoken %actor.inventory(1072)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1070
RM1070~
2 g 100
~
set thetoken %actor.inventory(1084)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% north purge
end
~
#1075
Professor Bruckner~
0 g 100
~
wait 2s
emote fills his pipe with tobacco.
wait 2s
say As I explained it's a Black Hole in the center of the Earth.
wait 2s
emote lights his pipe
wait 2s
say Who will volunteer to come with me?
~
#1077
RM1077~
2 g 100
~
set thetoken %actor.inventory(1033)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
#1078
RM1078~
2 g 100
~
set thetoken %actor.inventory(1074)%
set thisroom %actor.room.vnum%
if %thetoken%
  %door% %thisroom% south purge
end
~
$~
