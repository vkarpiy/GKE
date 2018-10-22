//Input
movement_left = keyboard_check(ord("A"));
movement_right = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
shift = keyboard_check(vk_shift);

//Movement
walkSpeed = 4;
if (shift) walkSpeed = 6;
var move = movement_right - movement_left;
hsp = move * walkSpeed;
vsp += grv;

//Jump
if (place_meeting(x, y + 1, oWall)) and (jump)
{
	vsp -= 10;
}

//Horizontal collision
if(place_meeting(x+hsp, y, oWall))
{
	while(!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x += hsp;

//Vertical collision
if(place_meeting(x, y+vsp, oWall))
{
	while(!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}



//Animations
if (place_meeting(x, y + 1, oWall))
{
	
	if(move == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerRunning;
		image_xscale = sign(move);
	}
}

if (place_meeting(x, y + 1, oWall)) and (jump)
{
	sprite_index = sPlayerJumpUp;
}
if (!place_meeting(x, y + 1, oWall)) and (vsp < 0)
{
	sprite_index = sPlayerJumpUp;
	image_index = 2;
}
if (!place_meeting(x, y + 1, oWall)) and (vsp > 0)
{
	sprite_index = sPlayerJumpDown;
}

//Spikes
if(place_meeting(x, y, oSpikeUp))
{
	hp -= 0.5;
	flash = 6;
	vsp -= 9 + vsp;
}
y += vsp;

//Kill 
// ДОПИСАТИ БЛЯТЬ!
if (hp < 0)
{
	instance_destroy();
}