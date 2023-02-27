extends Node

@onready var Player = $Level/Actors/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.connect("gameover", _on_gameover)
	$UserInterface/GameOver.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_gameover():
	$UserInterface/GameOver.show()
	

# Restart	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/GameOver.visible:
		get_tree().reload_current_scene()
