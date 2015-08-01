# ESP8266-DHT11
This is a little modified code from user OK1CDJ.
ESP8266 with DHT11 including sleep mode code. To enable deep sleep on ESP-01 module you have to solder one wire like on this picture ![](http://zftlab.org/images/2014102801.jpg)
You do not need to remove LED.

To change the sleep time shange this part of code. It is basically minutes*seconds:

					  node.dsleep(2*60000000) -- 2x60 sec or 2 minutes
                      --attempt to make this ESP-01 compatible
                      --wifi.sleeptype(wifi.LIGHT_SLEEP)
                      --tmr.delay(2*60000000) -- 2x60 sec or 2 minutes
                      --wifi.sleeptype(wifi.NONE_SLEEP)
 
Change secret.lua with your SSID, Password and you API Key from Thingspeak.

I suggest to use ESP8266 LuaLoader http://benlo.com/esp8266/index.html#LuaLoader for uploading the code.

To flash ESP8266 with firmware use ESP8266Flasher.exe
This code has been tested with flash rom nodemcu_512k_20141219.bin
