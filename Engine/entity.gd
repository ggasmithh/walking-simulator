extends KinematicBody2D

const SPEED = 75

var velocity = Vector2.ZERO

func update_animation():
	if velocity != Vector2.ZERO:
		# We are either moving to the right or the left
		if abs(velocity.x) > abs(velocity.y):
			# Moving right
			if velocity.x > 0:
				$AnimatedSprite.play("walk_right")
				
			# Moving left
			elif velocity.x < 0:
				$AnimatedSprite.play("walk_left")
			
		# We are either moving forward (toward) or backward (away)
		elif abs(velocity.x) < abs(velocity.y):
			# Moving forward (toward)
			if velocity.y > 0:
				$AnimatedSprite.play("walk_down")
				
			#Moving backward (away)
			elif velocity.y < 0:
				$AnimatedSprite.play("walk_up")
			
	else:
		$AnimatedSprite.frame = 1
		
func handle_movement():
	move_and_slide(velocity * SPEED)
