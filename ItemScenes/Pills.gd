extends RigidBody3D

#@onready var anim_pill = %AnimationPlayer


func on_pickup(body):
	print("Contact with ", body.name)
	if(body.name == "Player"):
		print("Picked up pills")
		queue_free()
		
#func _ready():
	#anim_pill.play("Idle")
