#1000


Gunnar Larsen Script~
0 g 100
~
  wait 5s
  say Well?
  wait 2s
  say Any Radar return?
~
#1001


James Sneed Script~
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
#1003

Underground Guide~
0 b 100
~
set fol %self.follower%
set inroom %self.room.vnum%

if %fol%
  wait 1s
  say Hello %actor.name%
  wait 1s
  say Thank you for taking the Underground Kingdom tour.
  wait 1s
  say We will be on our way shortly.
  wait %random.30% sec

  if %inroom% == 1000
    north
  else
    %random.dir%
  end

end
~
#1075


Professor Bruckner 0x1075~
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
$~
