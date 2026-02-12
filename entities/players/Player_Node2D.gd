extends Node2D


# Declare member variables here.
var player_direction_x_axis: = 0
var player_direction_y_axis: = 0
var player_speed: = 200
var player_half_width = 16
var bullet_scene = preload("res://entities/bullets/Bullet_Node2D.tscn")
var bullet_timer = 0.4
var bullet_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bullet_counter += delta
	if Input.is_action_pressed("PlayerShoot") and bullet_counter > bullet_timer:
		bullet_counter = 0
		var bullet_instance = bullet_scene.instance()
		bullet_instance.position.x = position.x
		bullet_instance.position.y = position.y - 25
		get_parent().get_node("Bullets_Node").add_child(bullet_instance)
		
	if Input.is_action_pressed("PlayerMoveLeft"):
		player_direction_x_axis = -1
		
	elif Input.is_action_pressed("PlayerMoveRight"):
		player_direction_x_axis = 1
		
	elif Input.is_action_pressed("PlayerMoveDown"):
		player_direction_y_axis = 1
		
	elif Input.is_action_pressed("PlayerMoveUp"):
		player_direction_y_axis = -1
		
	else: 
		player_direction_x_axis = 0
		player_direction_y_axis = 0
		
		
	position.x = clamp(position.x + delta * player_direction_x_axis * player_speed, player_half_width, 400 - player_half_width)
	position.y = clamp(position.y + delta * player_direction_y_axis * player_speed, player_half_width + 20, 600 - player_half_width)
	
	

		


func _on_PlayerBoundary_Area2D_area_entered(area: Area2D):
	if area.name == "EnemyBoundary_Area2D":
		area.get_parent().queue_free()
		queue_free()
		get_tree().paused = true
