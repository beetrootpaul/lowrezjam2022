pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
-- lowrezjam2022 entry
-- by beetroot paul

#include src/debug.lua
#include src/utils.lua
#include src/assets.lua
#include src/audio.lua
#include src/collisions.lua

#include src/enemies/enemies.lua
#include src/enemies/enemy.lua
#include src/enemies/health.lua
#include src/enemies/path_following_position.lua

#include src/game_state/game_state.lua
#include src/game_state/lives.lua

#include src/misc/timer.lua

#include src/screens/screen_gameplay.lua
#include src/screens/screen_over.lua
#include src/screens/screen_title.lua

#include src/towers/range/range_circle.lua
#include src/towers/tower.lua
#include src/towers/towers.lua

#include src/warzone/cores.lua
#include src/warzone/ground.lua
#include src/warzone/path.lua
#include src/warzone/road.lua
#include src/warzone/warzone.lua

#include src/waves/wave.lua
#include src/waves/waves.lua

#include src/main.lua

--[[

glyphs:
q > […]
w > [∧]
e > [░]
r > [➡️]
t > [⧗]
y > [▤]
u > [⬆️]
i > [☉]
o > [🅾️]
p > [◆]
a > [█]
s > [★]
d > [⬇️]
f > [✽]
g > [●]
h > [♥]
j > [웃]
k > [⌂]
l > [⬅️]
z > [▥]
x > [❎]
c > [🐱]
v > [ˇ]
b > [▒]
n > [♪]
m > [😐]

--]]

__gfx__
00000000000000009890999000000000000000000000000001a00000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009890888000000000000000000000000061c60000000000000000000000000000000000000000000000000000000000000003000000011000
0070070000000000333099900000000000000000000000005665000000000000000000000000000000000000000000000000000000000000003003000011c100
00077000000000000000333000000000000000000000000005500000000000000000000000000000000000000000000000000000000000000030330000111100
0007700000000000aaa0aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d33d0000d11d00
0070070000000000aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005dd500005dd500
00000000000000005550aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055dd000055dd0
00000000000000000000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000000d
e3330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
333e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000011000
3e33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003003000011c100
33e30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030330000111100
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d33d0000d11d00
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005dd500005dd500
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055ddd00055ddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000011000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003003000011c100
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030330000111100
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d33d0000d11d00
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005dd50d005dd50d
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055dd000055dd0
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000011000
ffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003003000011c100
ffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030330000111100
555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d33d0d00d11d0d
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005dd5d0005dd5d0
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055d0000055d00
