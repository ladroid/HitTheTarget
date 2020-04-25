extends Node2D

#export (int) var attack_range = 5
var enemies = preload("res://scenes/Enemy.tscn")
var bird_spawn_delay = 50.0/60.0
var timer = 0.0

func spawn_enemy():
	var screen_size = get_viewport().get_visible_rect().size
	var enemy = enemies.instance()
	var x = rand_range(0,screen_size.x)
	var y = rand_range(0,screen_size.y)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
	print("SPAWN SPAWN")

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if(timer >= bird_spawn_delay):
		timer -= bird_spawn_delay
		spawn_enemy()
	timer += delta


func _on_SpaceShip_shoot(bullet, pos, dir):
	var b = bullet.instance()
	add_child(b)
	b._start(pos, dir)
