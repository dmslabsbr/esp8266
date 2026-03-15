# esp8266

Leia em inglês: [README.md](README.md)

[![Lua](https://img.shields.io/badge/Lua-5.1%2B-blue?logo=lua)](https://www.lua.org/)
[![ESP8266](https://img.shields.io/badge/ESP8266-NodeMCU-green)](https://www.nodemcu.com/)
[![Firmware](https://img.shields.io/badge/firmware-scripts%20Lua-orange)](.)

Scripts em Lua para **ESP8266** (firmware estilo NodeMCU): configuração de Wi‑Fi e leitura de sensores de temperatura/umidade DHT com saída no serial.

---

## Descrição

Este repositório contém programas em Lua para placas ESP8266 com firmware que executa Lua (ex.: NodeMCU). Eles fazem a conexão Wi‑Fi e a leitura dos sensores DHT11/DHT22, exibindo os valores no serial (TTY).

| Arquivo | Função |
|--------|--------|
| **init.lua** | Conecta à rede Wi‑Fi (modo station) e em seguida executa outro programa Lua (ex.: `pega2Dh.lc`). |
| **PrintDh22.lua** | Lê um DHT22 e um DHT11 em pinos fixos e imprime temperatura e umidade na serial. |

---

## Requisitos

- Placa ESP8266 com firmware **NodeMCU** (ou compatível) com os módulos: `wifi`, `dht`, `tmr`, `ow`.
- Sensores DHT11/DHT22 ligados aos GPIO configurados nos scripts (veja comentários).

---

## Instalação

1. Grave no ESP8266 uma build NodeMCU que inclua os módulos acima.
2. Envie os arquivos Lua para o dispositivo (ex.: ESPlorer, nodemcu-uploader ou similar).

---

## Uso

- **init.lua**: Ajuste `wifi.sta.config("SEU_SSID","SUA_SENHA")` e o alvo do `dofile("...")`, depois envie o arquivo. No boot, o dispositivo conecta ao Wi‑Fi e executa o script indicado.
- **PrintDh22.lua**: Defina `pinSensor1` e `pinSensor2` para os pinos dos DHT (padrão 3 e 4). Abra um terminal serial na taxa do board para ver as linhas de temperatura e umidade.

---

## Configuração

- **init.lua**: SSID, senha e nome do script executado após conectar em `dofile()`.
- **PrintDh22.lua**: `pinSensor1`, `pinSensor2`, `TempoRepetir` (intervalo em ms), `temp_alarm`, `ehDebug`.

---

## Licença

Consulte o repositório ou o mantenedor para os termos de licença.
