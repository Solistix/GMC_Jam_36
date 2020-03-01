var input_vbuff=argument0
var xx=argument1
var yy=argument2
var zz=argument3

vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_normal()
vertex_format_add_texcoord()
vertex_format_add_colour()
var vformat=vertex_format_end()

var vbuff=buffer_create_from_vertex_buffer(input_vbuff,buffer_vbuffer,1)

var buff=vertex_create_buffer()
vertex_begin(buff,vformat)

var pos_x, pos_y, pos_z,n_x,n_y,n_z,uv_x,uv_y,r,g,b,a
buffer_seek(vbuff,buffer_seek_start,0)

var num=0
while(buffer_tell(vbuff)<buffer_get_size(vbuff))
{
	pos_x=buffer_read(vbuff,buffer_f32)
	pos_y=buffer_read(vbuff,buffer_f32)
	pos_z=buffer_read(vbuff,buffer_f32)

	n_x=buffer_read(vbuff,buffer_f32)
	n_y=buffer_read(vbuff,buffer_f32)
	n_z=buffer_read(vbuff,buffer_f32)

	uv_x=buffer_read(vbuff,buffer_f32)
	uv_y=buffer_read(vbuff,buffer_f32)

	r=buffer_read(vbuff,buffer_u8)
	g=buffer_read(vbuff,buffer_u8)
	b=buffer_read(vbuff,buffer_u8)
	a=buffer_read(vbuff,buffer_u8)

	vertex_position_3d(buff,pos_x+xx,pos_y+yy,pos_z+zz)
	vertex_normal(buff,n_x,n_y,n_z)
	vertex_texcoord(buff,uv_x,uv_y)
	vertex_colour(buff,make_color_rgb(r,g,b),a)
	
	num+=36
}

vertex_end(buff)

return buff