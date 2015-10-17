//scr_moveZombie()
curr = obj_network.me;
if(obj_network.clientPlayer != 0){
    if(distance_to_object(obj_network.me) > distance_to_object(obj_network.him)){
        curr = obj_network.him;
    }
}
if(x > curr.x+(curr.sprite_width/2))
{
    if(y > curr.y+(curr.sprite_height/2))
        direction = 135;
    else if(y < curr.y-(curr.sprite_height/2))
        direction = 225;
    else
        direction = 180;   
}
else if(x < curr.x-(curr.sprite_width/2))
{
    if(y > curr.y+(curr.sprite_height/2))
        direction = 45;
    else if(y < curr.y-(curr.sprite_height/2))
        direction = 315;
    else
        direction = 0;
}
else
{
    if(y > curr.y+(curr.sprite_height/2))
        direction = 90;
    else if(y < curr.y-(curr.sprite_height/2))
        direction = 270;
}

if(!place_meeting(x + lengthdir_x(8,direction), y + lengthdir_y(8,direction), obj_zombie))
    speed = 1;
else
    speed = 0;
    
