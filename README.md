# gt67r4
## Adaptive Discord API wrapper

gt67r4 is Discord API wrapper whose purpose is to work out of the box in as many environments as possible.
For this moment it support Lua 5.x, LuaJIT and Cuberite minecraft server environment.

## Adaptive system explanation

Cause gt67r4 made to be adaptive, it have such feature as backends for HTTP responses. The backend is automatically selected based on the working environment

- If turbo (https://luarocks.org/modules/kernelsauce/turbo) is installed, then turbo backend is selected
- If luasockets (https://github.com/diegonehab/luasocket) is installed then luasockets backend is selected
- If wrapper runs on Cuberite server, then cuberite backend is selected

If no backend was founded then library throws error
## Dependencies

There is no strict dependencies at all, for example for cuberite no extra dependencies is needed but...

- If you want gt67r4 to work in Lua 5.x then luasocket module (https://github.com/diegonehab/luasocket) with https support should be installed 
- If you want gt67r4 to work in LuaJIT Lua 5.x variant can be used, but better desicion is to install turbo (https://luarocks.org/modules/kernelsauce/turbo)

## Usage

See examples/ folder

## Documentation
<a href="https://github.com/Rorkh/gt67r4/blob/main/DOCS.md">Clack</a>