extends Node

signal level_started

@onready var ui = $UserInterface
@onready var ui_title_screen = $UserInterface/Title
@onready var ui_gameover_screen = $UserInterface/GameOver
@onready var ui_lifebar = $UserInterface/LifeBar
@onready var bgm = $"/root/Bgm"

var levels = [
	# Level 0
	preload("res://level.tscn")
	# TODO: Level 1
	# 
]

var current_level: Node2D;

func _ready():
	ui_gameover_screen.hide()
	ui_lifebar.hide()
	bgm.play()

func load_level(number):
	bgm.stop()
	ui_title_screen.hide()
	ui_lifebar.show()

	current_level = levels[number].instantiate()
	
	add_child(current_level)
	
	current_level.player.gameover.connect(_on_gameover)
	current_level.player.hit.connect(ui.lifebar.update)
	
func reset_game():
	current_level.free()
	get_tree().reload_current_scene()

func restart_level():
	get_tree().reload_current_scene()

func _on_gameover():
	ui_gameover_screen.show()
	
# Restart	
func _unhandled_input(event):

	if current_level == null && Input.is_action_pressed("action_start"):
		load_level(0)

	if ui_gameover_screen.visible && (event.is_action_pressed("ui_accept") || event.is_action_pressed("action_start")):
		reset_game()
