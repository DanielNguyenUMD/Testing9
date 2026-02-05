extends RigidBody3D

var health = 3
@onready var bat_model = %bat_model
var spd = randf_range(2.0,4.0)
var deathFlag = false
var itemDropChance = 1#randi_range(1,2)
var itemTypeChance = 4#randi_range(1,3)

@onready var player = get_node("/root/game/Player")

func _ready():
	print("I am the gravity on init. of mob ", gravity_scale)

func _physics_process(_delta):
	

	
		var horizontal_dir = Vector3(player.global_position.x - global_position.x, 0, player.global_position.z - global_position.z).normalized()	
	
		linear_velocity.x = horizontal_dir.x * spd
		linear_velocity.z = horizontal_dir.z * spd
	
	#end horiz
	#begin vert
	
		var target_y = player.global_position.y + 1.0
		var height_diff = target_y - global_position.y
		var vert_spd = 2.0
		linear_velocity.y = clamp(height_diff * vert_spd, -spd, spd)
			
	
	#end vert
	
		var dist_to_player = global_position.distance_to(player.global_position)
		if dist_to_player > 0.5:
			var look_target = player.global_position
			look_target.y = global_position.y
		
			if abs(look_target.x - global_position.x) < 0.1 and abs(look_target.z - global_position.z) < 0.1:
				look_target.x += 0.1
			else:
				look_target.y = global_position.y
		
			bat_model.look_at(look_target, Vector3.UP)
		
		
	
		bat_model.rotate_y(PI)
	#var direction = global_position.direction_to(player.global_position)
	#direction.y = 0.0
	#linear_velocity = direction * spd
	#var target = player.global_position
	#target.y = global_position.y
	#bat_model.look_at(target, Vector3.UP)
	#bat_model.rotate_y(PI)
	
func do_damage():
	print("Necessary, only visible for debug purposes")	
	

func take_damage():
	bat_model.hurt()
	
	health -= 1
	if(health == 0):
		queue_free()
		if(itemDropChance == 1):
			print("Item Type Chance: ", itemTypeChance)
			if(itemTypeChance == 1):
				print("Dropped pills")
				const PILLS = preload("res://ItemScenes/Pills.tscn")
				var pills_item = PILLS.instantiate()
				get_tree().current_scene.add_child(pills_item)
				pills_item.global_position = %bat_model.global_position
				pills_item.global_position.y -= 0.5
				
			if(itemTypeChance == 2):
				print("Dropped beans")
				const BEANS= preload("res://ItemScenes/Beans.tscn")
				var beans_item = BEANS.instantiate()
				get_tree().current_scene.add_child(beans_item)
				beans_item.global_position = %bat_model.global_position
				beans_item.global_position.y -= 0.5
				
			if(itemTypeChance == 3):
				print("Dropped adrenaline")
				const ADREN = preload("res://ItemScenes/Adrenaline.tscn")
				var adren_item = ADREN.instantiate()
				get_tree().current_scene.add_child(adren_item)
				adren_item.global_position = %bat_model.global_position
				adren_item.global_position.y -= 0.5
				
			if(itemTypeChance == 4):
				print("Dropped harpy feather")
				const HARPY = preload("res://ItemScenes/HarpyFeather.tscn")
				var harpy_item = HARPY.instantiate()
				get_tree().current_scene.add_child(harpy_item)
				harpy_item.global_position = %bat_model.global_position
				harpy_item.global_position.y -= 0.5
				
				
		
		
		
		
		
		
