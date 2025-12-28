extends RigidBody3D

@onready var bat_model = %bat_model
var spd = randf_range(2.0, 10.0)

@onready var player = get_node("/root/game/Player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	direction.y = 0.0
	linear_velocity = direction * spd
	var target = player.global_position
	target.y = global_position.y
	bat_model.look_at(target, Vector3.UP)
	bat_model.rotate_y(PI)
	
	

	
func take_damage():
	bat_model.hurt()
