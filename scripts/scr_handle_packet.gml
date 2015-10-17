//scr_handle_packet(buffer)
var buffer = argument[0];
var message_id = buffer_read(buffer, buffer_u8);

switch(message_id){
    case MOVE:
        var mx = buffer_read(buffer, buffer_u16);
        var my = buffer_read(buffer, buffer_u16);
        
        if(obj_network.is_server == true){
            obj_network.clientPlayer.x = mx;
            obj_network.clientPlayer.y = my;
        }else{
            obj_network.serverPlayer.x = mx;
            obj_network.serverPlayer.y = my;
        }
        break;
        
    case CONNECT:
        var mx = buffer_read(buffer, buffer_u16);
        var my = buffer_read(buffer, buffer_u16);
        
        obj_network.serverPlayer = instance_create(mx, my, obj_player);
        obj_network.clientPlayer = instance_create(100, 100, obj_player);
        obj_network.me = clientPlayer;
        break;
}
