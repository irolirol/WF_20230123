--遊俠火槍(初/中)+忍房下層
require "wait"
function GO_MOB()      
  
  strStatus = GetVariable("VSTATUS")
  if strStatus == "MASTER" then
    return
  end


  print("TR:GO_MOB")

  strLOCK = GetVariable("VLOCK")
  iNow = 0
  iMax = 0
  iNext = 0
  
  arrPath = {"move 3","s","s","w","n","n","move 2","w;w","e;n;e","w;w","e;n;e","w;w","e;n;e","w;w"}
  iNow = GetVariable("VPATH")
  iMax = #arrPath
  iNext = iNow + 1
  print("DEBUG_NEAT_PATH:"..tostring(iNext))
  
  if (iNext > iMax) then
   Execute("move 1")
  else
   Execute(arrPath[iNext])
   SetVariable ("VPATH", iNext)
   wait.time(5)
   Execute("stare")
  end
end

                       
function KILL_MOB()      
  
  arrMob = {"soldier","soldier","soldier","soldier","soldier","soldier","ninjia","soldier","ninjia","ninjia","ninjia","ninjia","ninjia","ninjia"}  
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