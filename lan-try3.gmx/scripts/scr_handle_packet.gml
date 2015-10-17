//scr_handle_packet(buffer)
var buffer = argument[0];
var message_id = buffer_read(buffer, buffer_u8);

switch(message_id){

    case SPAWN:
        var mx = buffer_read(buffer, buffer_u16);
        var my = buffer_read(buffer, buffer_u16);
        instance_create(mx, my, obj_zombie);
        break;

    case MOVE:
        var mx = buffer_read(buffer, buffer_u16);
        var my = buffer_read(buffer, buffer_u16);
        var index = buffer_read(buffer, buffer_u8);

        obj_network.him.x = mx;
        obj_network.him.y = my;
        obj_network.him.image_index = index;

        break;
        
    case SHOOT:
        obj_network.t = buffer_read(buffer, buffer_u16);
        obj_network.hisdirect = buffer_read(buffer, buffer_u16);
        obj_network.draw = buffer_read(buffer, buffer_u16);
        obj_network.alarm[0] = 3;
        

        break;
        
    case CONNECT:
        var mx = buffer_read(buffer, buffer_u16);
        var my = buffer_read(buffer, buffer_u16);
        var index = buffer_read(buffer, buffer_u8);
        obj_network.zombies = buffer_read(buffer, buffer_u32);
        for(var p = 0; p < ds_list_size(obj_network.zombies)-1; p++){
            var currzombie = ds_list_find_value(obj_network.zombies, p);
            instance_create(currzombie.x, currzombie.y, obj_zombie);
        }
        obj_network.serverPlayer = instance_create(mx, my, obj_player);
        obj_network.clientPlayer = instance_create(940, 500, obj_player);
        obj_network.me = clientPlayer;
        obj_network.him = serverPlayer;
        obj_network.him.image_index = index;
        break;
}
