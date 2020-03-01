scl=100
dist=500
dir=current_time/10

if keyboard_check_released(ord("1"))
{
	num++
	num=num mod ds_list_size(spr_list)
}

if keyboard_check_released(ord("2"))
{
	num2++
	num2=num2 mod ds_list_size(model_list)
}


m=matrix_get(matrix_world)
matrix_set(matrix_view,matrix_build_lookat(x+lengthdir_x(dist,dir),y+lengthdir_y(dist,dir),200+dist,x,y,200,0,0,-1))
matrix_set(matrix_world,matrix_build(x,y,-scl,0,0,0,scl,scl,scl))
shader_set(shdTest)
//texture_set_stage(shader_get_sampler_index(shdTest,"matcap_tex"),surface_get_texture(surf))
vertex_submit(model_list[|num2],pr_trianglelist,sprite_get_texture(spr_list[|num],0))
shader_reset()
matrix_set(matrix_world,m)
