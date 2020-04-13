extends "res://Engine/entity.gd"

func handle_input():
	velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# Make diagonal movement impossible
	if abs(velocity.x) >= abs(velocity.y):
		velocity.y = 0
	elif abs(velocity.y) >= abs(velocity.x):
		velocity.x = 0

func _physics_process(delta):
	handle_input()
	handle_movement()
	
func _process(delta):
	update_animation()
