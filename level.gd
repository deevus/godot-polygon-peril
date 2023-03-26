extends Node2D

@onready var player = $Actors/Player;
@onready var bgm = $BGM

# Called when the node enters the scene tree for the first time.
func _ready():
	bgm.stop()
	bgm.play()
	#TODO: fix gameover
	#Player.connect("gameover", _on_gameover)
	#$UserInterface/GameOver.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
