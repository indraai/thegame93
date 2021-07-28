#3100
North: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == north && %actor.is_pc%
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
  return 0
else
  %echoaround% security:allow:%secstr%
end
~
#3101
East: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == east && %actor.is_pc%
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
  return 0
else
  %echoaround% security:allow:%secstr%
end
~
#3102
South: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == south && %actor.is_pc%
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
  return 0
else
  %echoaround% security:allow:%secstr%
end
~
#3103
West: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == west && %actor.is_pc%
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
  return 0
else
  %echoaround% security:allow:%secstr%
end
~
#3104
Up: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == up && %actor.is_pc%
  return 0
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
else
  %echoaround% security:allow:%secstr%
end
~
#3105
Down: Agency Guard~
2 q 100
~
set vnum %self.vnum%
set secstr %vnum%:%actor.id%:%direction%
%echoaround% security:check:%secstr%
if %direction% == down && %actor.is_pc%
  return 0
  %send% %actor% Access Denied
  %echoaround% security:deny:%secstr%
else
  %echoaround% security:allow:%secstr%
end
~
#3106
Security Check~
2 q 100
~
set vnum %self.vnum%
set role agent
if %actor.is_pc%
  set role PLAYER
  if %actor.align% < -100
    set role EVIL

if %actor.is_thief%
  set role THIEF

if %actor.is_killer%
  set role KILLER

set secstr %vnum%:%direction%:%actor.id%:%role%

if %role% == AGENT
  %send% %actor% Security Granted... %actor.name% %role%
  %echoaround% security:grant:%secstr%
elseif %role% == PLAYER
  %send% %actor% Security Granted... %actor.name% %role%
  %echoaround% security:grant:%secstr%
else
  %send% %actor% Security Alert... %actor.name% %role%
  %echoaround% security:alert:%secstr%
  * send to the love shack
  %teleport% %actor% 28617
~
#3107
Security Greeting~
0 g 100
~
say Hello %actor.name%.
~
$~
