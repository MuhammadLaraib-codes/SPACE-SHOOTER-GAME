extends Node


# Declare member variables here.
var enemy_scene = preload("res://entities/enemies/Enemy_Node2D.tscn")


func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.9
	timer.connect("timeout", self, "_create_enemy")
	timer.start()
	
func _create_enemy():
	var enemy_instance = enemy_scene.instance()
	get_parent().get_node("Enemies_Node").add_child(enemy_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
