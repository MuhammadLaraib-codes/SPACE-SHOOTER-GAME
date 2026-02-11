extends Node2D


# Declare member variables here.
var player_direction: = 0
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
		player_direction = -1
		
	elif Input.is_action_pressed("PlayerMoveRight"):
		player_direction = 1
		
	else: 
		player_direction = 0
		
	position.x = clamp(position.x + delta * player_direction * player_speed, player_half_width, 400 - player_half_width)
	
	
func _on_PlayerBoundary_Area2D_area_entered(area: Area2D):
	if area.name == "EnemyBoundary_Area2D":
		get_tree().paused = true
		
