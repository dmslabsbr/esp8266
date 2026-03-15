# esp8266

Read in Portuguese: [README.pt-BR.md](README.pt-BR.md)

[![Lua](https://img.shields.io/badge/Lua-5.1%2B-blue?logo=lua)](https://www.lua.org/)
[![ESP8266](https://img.shields.io/badge/ESP8266-NodeMCU-green)](https://www.nodemcu.com/)
[![Firmware](https://img.shields.io/badge/firmware-Lua%20scripts-orange)](.)

Lua scripts for **ESP8266** (NodeMCU-style firmware): Wi‑Fi setup and DHT temperature/humidity sensor reading with serial output.

---

## Description

This repo holds small Lua programs for ESP8266 boards running a Lua-capable firmware (e.g. NodeMCU). They handle Wi‑Fi connection and reading DHT11/DHT22 sensors, printing values over the serial (TTY).

| File | Purpose |
|------|--------|
| **init.lua** | Connects to a Wi‑Fi network (station mode) and then runs another Lua program (e.g. `pega2Dh.lc`). |
| **PrintDh22.lua** | Reads one DHT22 and one DHT11 on fixed pins and prints temperature and humidity to the serial port. |

---

## Requirements

- ESP8266 board with **NodeMCU** (or compatible) firmware including: `wifi`, `dht`, `tmr`, `ow`.
- DHT11/DHT22 sensors wired to the configured GPIO pins (see script comments).

---

## Install

1. Flash your ESP8266 with a NodeMCU build that includes the modules above.
2. Upload the Lua files to the device (e.g. via ESPlorer, nodemcu-uploader, or similar).

---

## Usage

- **init.lua**: Edit `wifi.sta.config("YOUR_SSID","YOUR_PASSWORD")` and the `dofile("...")` target, then upload. On boot, the device connects to Wi‑Fi and runs the specified script.
- **PrintDh22.lua**: Set `pinSensor1` / `pinSensor2` to your DHT pins (defaults 3 and 4). Open a serial terminal at the board’s baud rate to see temperature and humidity lines.

---

## Config

- **init.lua**: SSID, password, and the post-connect script name in `dofile()`.
- **PrintDh22.lua**: `pinSensor1`, `pinSensor2`, `TempoRepetir` (interval in ms), `temp_alarm`, `ehDebug`.

---

## License

See repository or contact the maintainer for license terms.
