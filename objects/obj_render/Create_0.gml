var _model=import_model("humpty")
_model=-1

player_model=import_model("dwarf")
vertex_freeze(player_model)
enemy_model=import_model("humpty")
vertex_freeze(enemy_model)
enemy2_model=import_model("spider")
vertex_freeze(enemy2_model)
floor_model=import_model("tile")
wall_model=import_model("wall")
spike_model=import_model("spike")
vertex_freeze(spike_model)

gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
gpu_set_alphatestenable(true)

setup=false

display_reset(8,1)

scl=70
dist=1000
camera_dir=45