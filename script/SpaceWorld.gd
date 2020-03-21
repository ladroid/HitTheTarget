extends Node2D

#export (int) var attack_range = 5
export (int) var speed = 10000
var enemies = preload("res://scenes/Enemy.tscn")

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,10):
		var enemy = enemies.instance()
		randomize()
		var x = rand_range(0,screen_size.x)
		var y = rand_range(0,screen_size.y)
		enemy.position.y = y
		enemy.position.x = x
		add_child(enemy)

func _physics_process(delta):
	var dir = ($SpaceShip.global_position - $Enemy.global_position).normalized()
	$Enemy.move_and_slide(dir * speed * delta)


func _on_SpaceShip_shoot(bullet, pos, dir):
	var b = bullet.instance()
	add_child(b)
	b._start(pos, dir)
