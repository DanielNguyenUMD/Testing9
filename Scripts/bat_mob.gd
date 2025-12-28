extends RigidBody3D

@onready var bat_model = %bat_model
var spd = randf_range(2.0, 10.0)

@onready var player = get_node("/root/game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	direction.y = 0.0
	linear_velocity = direction * spd

func take_damage():
	bat_model.hurt()
