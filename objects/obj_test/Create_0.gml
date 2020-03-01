model_list=ds_list_create()
ds_list_add(model_list,import_model("humpty"),import_model("spider"),import_model("dwarf"),import_model("tile"))
ds_list_add(model_list,import_model("wall"),import_model("spike"),import_model("spikeball"))

gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
gpu_set_alphatestenable(true)

spr_list=ds_list_create()
ds_list_add(spr_list,spr_matcap,spr_matcap_2,spr_matcap_3,spr_matcap_4,spr_matcap_5,spr_matcap_6,spr_matcap_7)

num=0
num2=0


surf=surface_create(512,512)