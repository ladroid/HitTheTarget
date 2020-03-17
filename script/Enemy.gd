extends KinematicBody2D

var speed = 10000
var attack_range = 5
func _read():
	pass
	
#const scn_player = preload("res://scenes/SpaceShip.tscn")
#onready var player = get_tree().get_root().get_node("SpaceShip")
#var velocity = Vector2()

#func _physics_process(delta):
	#var player = scn_player.instance()
#	var dir = (player.global_position - global_position).normalized()
#	move_and_collide(dir * speed * delta)

#func _process(delta):
	#var player = scn_player.instance()
	#if player.position.x > position.x:
		#velocity.x += speed
	#if player.position.x < position.x:
		#velocity.x -= speed
	#if player.position.y > position.y:
		#velocity.y += speed
	#if player.position.y < position.y:
		#velocity.y -= speed

#func _physics_process(delta):
	#move_and_slide(velocity * delta)


