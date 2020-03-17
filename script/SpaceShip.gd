extends KinematicBody2D

export var min_move_speed = 100
export var max_move_speed = 300
export var stop_distance = 10
export(float) var gun_cooldown = 0.4

export(PackedScene) var Laser

const scn_laser = preload("res://scenes/Laser.tscn")

var can_shoot = true
signal shoot

func _ready():
	$GunTimer.wait_time = gun_cooldown

func _process(delta):
	_look_at_mouse()
	_move_to_mouse()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot()
	
func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
	
func _move_to_mouse():
	if position.distance_to(get_global_mouse_position()) > stop_distance:
		var direction = get_global_mouse_position() - position
		var normalized_dir = direction.normalized()
		var direct_distance = direction.length()
		move_and_slide(normalized_dir * max(min_move_speed, min(max_move_speed, direct_distance)))

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		#var dir = (get_global_mouse_position() - position).rotated($trunnel.global_rotation)
		var dir = Vector2(1, 0).rotated($trunnel.global_rotation)
		emit_signal("shoot", Laser, $trunnel/Position2D.global_position, dir)
		#sawn_laser($trunnel/Position2D.global_position, dir)
		
func sawn_laser(pos, dir):
	var laser = scn_laser.instance()
	add_child(laser)
	laser._start(pos, dir)

func _on_GunTimer_timeout():
	can_shoot = true
