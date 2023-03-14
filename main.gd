extends Node

@onready var ui = $UserInterface
@onready var ui_title_screen = $UserInterface/Title
@onready var ui_gameover_screen = $UserInterface/GameOver
@onready var bgm = $"/root/Bgm"

var levels = [
	# Level 0
	preload("res://level.tscn")
	# TODO: Level 1
	# 
]

var current_level: Node2D;

func _ready():
	pass

func press_start():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("action_start"):
		load_level(0)
	

func load_level(number):
	bgm.stop()
	ui_title_screen.hide()
	
	current_level = levels[number].instantiate()
	
	add_child(current_level)
	
	current_level.player.gameover.connect(_on_gameover)
	
func reset_game():
	get_tree().reload_current_scene()

func restart_level():
	get_tree().reload_current_scene()

func _on_gameover():
	ui_gameover_screen.show()
	current_level.free()


# Restart	
func _unhandled_input(event):
	if (event.is_action_pressed("ui_accept") || event.is_action_pressed("action_start")) and $UserInterface/GameOver.visible:
		reset_game()
