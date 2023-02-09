--忍房up層
require "wait"
function GO_MOB()      
  
  print("DEBUG:GO_MOB")
  iNow = 0
  iMax = 0
  iNext = 0
  
  --EXP < 6000   (TRAN 9 猴子)
  --arrPath = {"move 3","w;w","move 2","w;w","e;n;e","w;w","e;n;e","w;w","e;n;e","w;w"}

  --EXP < 16000 (TRAN 9 猴王)
  --arrPath = {"move 3;w;u;enter","move 3","w;w","move 2","w;w","e;n;e","w;w","e;n;e","w;w","e;n;e","w;w"}

  --EXP > 6000 (龍門最後一排_右邊)
  arrPath = {"move 3","w","move 2","w;w","e;n;e","w;w","e;n;e","w;w","e;n;e","w;w"}

  iNow = GetVariable("VPATH")
  iMax = #arrPath
  iNext = iNow + 1
  print("DEBUG_NEAT_PATH:"..tostring(iNext))
  
  if (iNext > iMax) then
   Execute("recall;buy leg;buy waterbag;exa")
   wait.time(5)
   Execute("move 1")
  else
   Execute(arrPath[iNext])
   SetVariable ("VPATH", iNext)
   wait.time(5)
   Execute("stare")
  end
end

                       
function KILL_MOB()      
  
  --EXP < 6000
  --arrMob = {"monkey","monkey","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia"}  

  --EXP < 16000
  --arrMob = {"king","monkey","monkey","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia"}  
  
  --EXP > 16000
  arrMob = {"guard","guard","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia"}
  
  print("DEBUG:KILL_MOB")
  iNow = tonumber(GetVariable("VPATH"))
  print("DEBUG_NOW_PATH:"..tostring(iNow))
  Execute("kill "..tostring(arrMob[iNow]))


end

function PRAC_MED()
 Execute("ex4;em;ex4;ex1;ex2")  
end 

function PRAC_REP()
 Execute("ex3;er;ex3;ex1;ex2")  
end 

function PRAC_FOR()
 Execute("ex1;ex2;ex1;ex2;exercise 50")  
end 

function PRAC_SK(SKTYPE)
 Execute(SKTYPE)
 Execute("ex1;ex2")  
end 

function LEARN_SK(SKNAME)
 Execute("ex3;ex4;ex1;ex2")  
 Execute("ln "..SKNAME)
end 