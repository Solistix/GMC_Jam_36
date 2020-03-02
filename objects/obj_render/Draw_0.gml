if (live_call()) return live_result

var w=ds_grid_width(global.room_grid)
var h=ds_grid_height(global.room_grid)

if !setup && instance_exists(obj_player)
{
	setup=true
	scl=global.grid_cell_size/4
	x=obj_player.x//coords[0]*4*scl
	y=-obj_player.y//coords[1]*4*scl
	
	var size=w*h
	var vnum=vertex_get_number(floor_model)
	var vsize=vnum*36

	var new_buff=buffer_create(vsize*size,buffer_grow,1)

	vertex_format_begin()
	vertex_format_add_position_3d()
	vertex_format_add_normal()
	vertex_format_add_texcoord()
	vertex_format_add_colour()
	var vformat=vertex_format_end()

	if file_exists("floor_model.buff")
	{
		var buff=buffer_load("floor_model.buff")
		complete_floor_model=vertex_create_buffer_from_buffer(buff,vformat)
		vertex_freeze(complete_floor_model)
	}
	else
	{
		for(var i=0;i<w;i++)
		{
			for(var j=0;j<h;j++)
			{
				var xx=4*i
				var yy=-4*j
				var zz=0
				var new_model=model_translate(floor_model,xx,yy,zz)
				buffer_copy_from_vertex_buffer(new_model,0,vnum,new_buff,vsize*(i*h+j))
				vertex_delete_buffer(new_model)
			}
		}

		complete_floor_model=vertex_create_buffer_from_buffer(new_buff,vformat)
		buffer_save(buffer_create_from_vertex_buffer(complete_floor_model,buffer_fixed,1),"floor_model.buff")
		vertex_freeze(complete_floor_model)
	}
	
	/*for(var i=0;i<w;i++)
	{
		for(var j=0;j<h;j++)
		{
			var inst=global.room_grid[# i,j]


			var xx=4*i
			var yy=-4*j
			var zz=0
			var new_model=model_translate(model,xx,yy,zz)
			buffer_copy_from_vertex_buffer(new_model,0,vnum,new_buff,vsize*(i*h+j))
			vertex_delete_buffer(new_model)
		}
	}

	complete_floor_model=vertex_create_buffer_from_buffer(new_buff,vformat)
	buffer_save(buffer_create_from_vertex_buffer(complete_floor_model,buffer_fixed,1),"floor_model.buff")
	vertex_freeze(complete_floor_model)*/
}

m=matrix_get(matrix_world)

x=lerp(x,obj_player.coords[0]*4*scl,0.05)
y=lerp(y,-obj_player.coords[1]*4*scl,0.05)

matrix_set(matrix_view,matrix_build_lookat(x+lengthdir_x(dist,camera_dir),y+lengthdir_y(dist,camera_dir),dist,x,y,0,0,0,-1))

shader_set(shdTest)

matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,scl,scl,scl))
vertex_submit(complete_floor_model,pr_trianglelist,sprite_get_texture(spr_matcap,0))

var _scl=scl

with(obj_wall)
{
	matrix_set(matrix_world,matrix_build(4*_scl*coords[0],-4*_scl*coords[1],0.5*_scl,0,0,0,_scl,_scl,_scl))
	vertex_submit(other.wall_model,pr_trianglelist,sprite_get_texture(spr_matcap_5,0))
}

with(obj_arrow_trap)
{
	matrix_set(matrix_world,matrix_build(4*_scl*coords[0],-4*_scl*coords[1],0.5*_scl,0,0,0,_scl,_scl,_scl))
	vertex_submit(other.spike_model,pr_trianglelist,sprite_get_texture(spr_matcap_7,0))
}

with(spike_trap)
{
	matrix_set(matrix_world,matrix_build(4*_scl*coords[0],-4*_scl*coords[1],0.5*_scl,0,0,0,_scl,_scl,_scl))
	vertex_submit(other.spike_model,pr_trianglelist,sprite_get_texture(spr_matcap_7,0))
}

with(spike_ball)
{
	matrix_set(matrix_world,matrix_build(4*_scl*coords[0],-4*_scl*coords[1],0.5*_scl,0,0,0,_scl,_scl,_scl))
	vertex_submit(other.spike_model,pr_trianglelist,sprite_get_texture(spr_matcap_7,0))
}

with(obj_player)
{
	var dir=convert_direction(is_facing)
	matrix_set(matrix_world,matrix_build(x,-y,0.5*_scl,0,0,dir,_scl,_scl,_scl))
	vertex_submit(other.player_model,pr_trianglelist,sprite_get_texture(spr_matcap_7,0))
}

with(enemy_1)
{
	var dir=convert_direction(is_facing)
	matrix_set(matrix_world,matrix_build(4*_scl*coords[0],-4*_scl*coords[1],0.5*_scl,0,0,dir,_scl,_scl,_scl))
	vertex_submit(other.enemy_model,pr_trianglelist,sprite_get_texture(spr_matcap_7,0))
}

shader_reset()
matrix_set(matrix_world,m)

if keyboard_check_released(vk_enter)
{
	game_restart()
}