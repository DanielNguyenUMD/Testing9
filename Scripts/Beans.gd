extends RigidBody3D

@onready var anim_beans = %AnimationPlayer

func on_pickup(body):
	print("Contact with ", body.name)
	if(body.name == "Player"):
		print("Picked up beans")
		queue_free()
		
func _ready():
	anim_beans.play("Idle")
