--init.lua
dofile("secret.lua")
print("Setting up WIFI..."..ssid)
wifi.setmode(wifi.STATION)
ap="XX"

    function listap(t)
      if (t~=nil) then
          for k,v in pairs(t) do
             ap = k
             print(k.." : "..v)
           end
      end
    end
wifi.sta.getap(listap)

--modify according your wireless router settings
wifi.sta.config(ssid, ssid_pass)
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function() 
if wifi.sta.getip()== nil then 
print("IP unavaiable, Waiting on home") 
else 
tmr.stop(1)
print("Config done, IP is "..wifi.sta.getip())
dofile("dht11.lua")
end 
end)
