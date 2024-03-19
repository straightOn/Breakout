extends RigidBody2D

const INITIAL_SPEED = 1000
var velocity = Vector2(1, -1).normalized() * INITIAL_SPEED

func _process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		var collider = collision.get_collider()
		if collider.has_method('collide'):
			collider.collide(1)
