-- Imprime temperaturas DH22
-- 2015 DMS

pinSensor1 = 3
pinSensor2 = 4
pinLed = 2
temp_alarm = 25
ehDebug = true
TempoRepetir = 5000


ow.setup(pinSensor1)
ow.setup(pinSensor2)


counter=0
status="-"
rodando = 0 -- qnt rodando.



function logD(mensagem)
  if (ehDebug == true) then
    print (mensagem);
  end
end

-- converte o valor booleano
function bol2string(valor)
  local st = ""
  if valor==nil then
   st="NULL"
  elseif valor==true then 
    st="TRUE" else st="FALSE" 
  end
  return st
end

--- Get temp de qualquer DHxx
function getTempDH(pinDH, tipo)
  local status,temp,humi,temp_decimial,humi_decimial
  if tipo==11 then
    status,temp,humi,temp_decimial,humi_decimial = dht.read11(pinDH)
  end
  if tipo==22 then
    status,temp,humi,temp_decimial,humi_decimial = dht.readxx(pinDH)
  end 
  if( status == dht.OK ) then
    -- Integer firmware using this example
    print(     
      string.format(
        "DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
        math.floor(temp),
        temp_decimial,
        math.floor(humi),
        humi_decimial
      )
    )
    -- Float firmware using this example
    print("DHT"..tipo.. " ("..pinDH..") Temperature:"..temp.." / ".."Humidity:"..humi)
  elseif( status == dht.ERROR_CHECKSUM ) then
    print( "DHT Checksum error." );
  elseif( status == dht.ERROR_TIMEOUT ) then
    print( "DHT Time out." );
  end
  return temp,humi
end


function roda()

  tmr.wdclr() 
  rodando = rodando + 1
  counter = counter + 1
  -- pega os dados de temperatura

  temp, humi = getTempDH(pinSensor1,22)
  temp2, humi2 = getTempDH(pinSensor2,11)

end


-- inicio do APP / Info

print("Pino Sensor 1: " .. pinSensor1);
print("Pino Sensor 2: " .. pinSensor2);
print("Tempo Repetir: " .. TempoRepetir .. "ms");



-- send data every X ms to thing speak
tmr.alarm(0, TempoRepetir, 1, function() roda() end )