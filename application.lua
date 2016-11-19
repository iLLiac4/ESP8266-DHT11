pin = 3
temp = 0
humi =0

function getTemp()
    print("getting")
    status, temp, humi = dht.read11(pin)
    if status == dht.OK then
        -- Float firmware using this example
        print("DHT Temperature:"..temp..";".."Humidity:"..humi)

    elseif status == dht.ERROR_CHECKSUM then
        print( "DHT Checksum error." )
    elseif status == dht.ERROR_TIMEOUT then
        print( "DHT timed out." )
    end
end

--- Get temp and send data to thingspeak.com
function sendData()
    getTemp()
    -- conection to thingspeak.com
    print("Sending data to thingspeak.com")
    conn=net.createConnection(net.TCP, 0)
    conn:on("receive", function(conn, payload) print(payload) end)

    conn:connect(80,'184.106.153.149')
    conn:send("GET /update?key=SAYRD0NUBSOGIMTE&field1="..temp.."&field2="..humi.." HTTP/1.1\r\n")
    conn:send("Host: api.thingspeak.com\r\n")
    conn:send("Accept: */*\r\n")
    conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
    conn:send("\r\n")
    conn:on("sent",function(conn)
        print("Closing connection")
        conn:close()
    end)
    conn:on("disconnection", function(conn)
        print("Got disconnection...")
    end)
end

-- send data every X ms to thing speak
tmr.alarm(2, 3600000, 1, function() sendData() end )
