extends RigidBody3D


func on_pickup(body):
	print("Contact with ", body.name)
	if(body.name == "Player"):
		print("Picked up pills")
		queue_free()
