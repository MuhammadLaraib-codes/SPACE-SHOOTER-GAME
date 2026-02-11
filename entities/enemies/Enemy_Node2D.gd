class_name Enemy
extends Node2D


# Declare member variables here.
var enemy_speed: = 100
var enemy_half_width = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position = Vector2(rand_range(0, 400), 0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += enemy_speed * delta
	position.x = clamp(position.x, enemy_half_width, 400 - enemy_half_width)



func _on_EnemyBoundary_Area2D_area_entered(area: Area2D):
	if area.name == "BulletBoundary_Area2D":
		area.get_parent().queue_free()
		queue_free()
