pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
-- lowrezjam2022 entry
-- by beetroot paul

#include src/global/utils.lua
#include src/global/assets.lua
#include src/global/audio.lua

#include src/game_states/gs_gameplay.lua

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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
