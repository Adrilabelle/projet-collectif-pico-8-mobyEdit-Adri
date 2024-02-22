pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
function _init()
	create_player()
	bullets={}
	create_bulles()
end

function _update()
	player_movement()
	if(btnp(❎)) shoot()
	update_bullets()
	update_bulles()
	update_camera()
end

function _draw()
cls()
draw_map()
draw_player()

--baleine
--spr(1,p.x,p.y)
--bullets
	for b in all(bullets) do
		spr(2,b.x*8,b.y*8)
	end
--bulles
	for b in all(bulles) do
		pset(b.x,b.y,b.col)
	end
end

-->8
--map
function draw_map()
	map(0,0,0,0,128,64)
	sprite=64
	end

function check_flag(flag,x,y)
	local sprite=mget(x,y)
	return fget(sprite,flag)
end

function update_camera()
camera(x,y)
end

	
-->8
--player

function create_player()
	p={x=6,y=4,sprite=1}
end

function player_movement()
newx=p.x
newy=p.y
	if (btnp(➡️)) newx+=1
	if (btnp(⬅️)) newx-=1
	if (btnp(⬆️)) newy-=1
	if (btnp(⬇️)) newy+=1
	
	if not check_flag(0,newx,newy) then
		p.x=newx --p.x= mid(0,newx,127)
		p.y=newy        --p.y= mid(0,newy,63)
		if(p.x<0) p.x=0
		if(p.y<0) p.y=0
		if(p.x>127) p.x=127
		if(p.y>120) p.y=120
	end
end

function draw_player()
	spr(p.sprite,p.x*6,p.y*8)
end
-->8
--bullets

function shoot ()
	new_bullet= {
		x=p.x,
		y=p.y,
		speed=4
	}
		add(bullets,new_bullet)
		sfx(0)
end

function update_bullets()
	for b in all(bullets) do
		b.x-=b.speed
	end
end
-->8
-- bulles

function create_bulles()
	bulles={}
	for i=1,13 do
	new_bulles={
		x=rnd(70),
		y=rnd(128),
			col=1,
			speed=1+rnd(1)
			}
			add(bulles,new_bulles)
	end
	for i=1,18 do
	new_bulles={
		x=rnd(128),
		y=rnd(128),
		col=rnd({7,12,6}),
		speed=1+rnd(1)
		}
		add(bulles,new_bulles)
	end
end

function update_bulles()
	for b in all (bulles) do
		b.y-=b.speed
		if b.y < 0 then
			b.y=rnd(128,0)
			b.x=rnd(120)
		end
	end
end
__gfx__
00000000055550000000000011111e81000000002d11111100000000111111110000000011111111000000004411124161611111111111188887111111111111
0000000055555505000000008111e8110000000011d2111100000000311111110000000011111111000000001221121116111111111111881188711111111111
0070070055755555000a00001e1e81e100000000111d2111000000003113111b0000000011111111000000001121124161611111111118811118871111111111
000770005555555500a9a0001e1e11e10000000011d21111000000003b13b1330000000011111111000000001421241116111111111188711111871111111111
0007700055555565000a000018eeee81000000002d211111000000003b13b131000000001115d111000000001112111161611111111188711111871111111111
007007000566660500000000118e811100000000d11111110000000013b333310000000011555d11000000001112111116111111111188711111871111111111
000000000055550000000000111e1111000000001d211111000000001133311100000000a55555d1000000001122211161611111111118871188811111111111
0000000000000000000000009aaeaaa90000000011d22111000000009aa3aaa9000000005555555d000000009222224916111111111111188888111111111111
0005555000000000000000001111111100000000ccccccccc1c1cc1c000000001111111111111111111113333333611161611111111111118871111100000000
5055555500000000000000001111711100000000cccccccc1c1111c1000000001111111111111111111133555555661116111111111111118871111100000000
5555575500000000000000001117c71100000000c1c1ccccc1cc1c1c000000001111111111111111111135555555556161611111111111118871117700000000
5555555500000000000000001111711100000000cccccccccc11c11c000000001111111111111111111135555555556116111111118871118871118700000000
5655555500000000000000001111111100000000cccc1cc111111111000000001111111111aaaa11111355555555555661611111118881118871188800000000
50666650000000000000000011171111000000001c1c11cccc111ccc0000000011111111aaa99aaa113555555555555616111111111887118871888100000000
005555000000000000000000117c711100000000c1c1cc1c1111111100000000aaa999aaa999999a135555555555555661611111111188718878881100000000
0000000000000000000000001117111100000000c11cc1cc11111111000000009a99a99999aaaa99135555555555555616111111111118888888811100000000
000990000000000000000000171111110000000000000000cccccccc00000000aaaaaaaa00000000135555555555555600000000000000000000000000000000
0099990900000000000000007c7111710000000000000000cccccccc00000000aaaaaaaa00000000135555555555555600000000000000000000000000000000
090999900000000000000000171117c70000000000000000cccccccc00000000aaa999aa00000000135555555555555600000000000000000000000000000000
999999090000000000000000111111710000000000000000cccccccc00000000a999999a00000000335553333333555500000000000000000000000000000000
009900000000000000000000111171110000000000000000cccccccc000000009999999900000000555535555553355500000000000000000000000000000000
0000000000000000000000001117c7110000000000000000cccccccc00000000999aaa9900000000555355555555535500000000000000000000000000000000
000000000000000000000000111171110000000000000000cccccccc00000000aaaaaaaa00000000555555555555555500000000000000000000000000000000
000000000000000000000000111111110000000000000000cccccccc00000000aaaaaaaa00000000555555555555555500000000000000000000000000000000
__gff__
0000000000000000000100000101010000000000000000000000010101010100000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f230f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f1c0f0f0f0f0f0f0f0f0f130f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0f0f0f0f0f0f0f0f0f130f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d1e0f0f0f0f0f0f0f0f0f130f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f130f0f0f0f0f0f0f0f0f0f230f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f13000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f130f0f0f0f0f0f0f0f0f0f130f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f13000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f230f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f23000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f130f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
230f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f0f230f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f130f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b0f0f0f0f0f0f230f0f0f0f0d0e0f0f0f0f0f1a1b0f0f0f0f0f1a1b0f0f0f1a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2b030719180b180719030f0f1d1e0f050b0f0f2a2b0f0f0f070b2a2b0f0f032a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2828282828282828282828282828282828282828282828282828282828282828000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00030000207602176023760287501e750197400d74009730057300272000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
