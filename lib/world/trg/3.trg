#300
Direction Greeting~
0 g 20
~
if %actor.is_pc%
  wait 1 sec
  if %direction% == none
    say Where did YOU come from, %actor.name%?
  else
    say Hello, %actor.name%, how are things to the %direction%?
  end
end
~
#302
Sindhu Ship~
1 c 100
en~
%echo% Sindhu Boarding.
~
#326
Vasudeva Greetings~
0 g 100
~
%echo% This trigger commandlist is not complete!
~
#336
SARYA SECURITY~
2 g 100
~
%echo% security:%actor.name% %actor.class% %direction%
~
#350
SOMA SECURITY~
2 g 100
~
%echo% security:%actor.name% %actor.class% %direction%
~
#363
indra.rocks ship boarding procedure~
2 g 100
~
wait 2s
%echo% indra.rocks ship boarding procedure.
~
#385
clear on_tour variable~
2 g 100
~
rdelete on_tour %actor.id%
~
#386
386 Tour~
2 d 100
*~
rdelete on_tour %actor.id%

if %speech% == start tour
  set on_tour 1
  remote on_tour %actor.id%
  wait 2s
  %send% %actor% The tour will begin shortly.
  wait 10s
  %send% %actor% talk:#corpus say:brian Welcome to the tour of Training Level 1.
  wait 10s
  %send% %actor% talk:#corpus say:brian These are training exercises, and not factual true proven legal understood events. Wink Wink.
  wait 10s
  %send% %actor% talk:#corpus say:brian  Your tour will begin in 30 seconds. Thank you, and have a nice day.
  wait 30s
  %send% %actor% gui:#mud north
end
~
$~
