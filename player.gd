extends "res://actor.gd";

signal gameover

@onready var death_sound = $DeathExplosion

func _ready():
	super()
	death.connect(_on_die)

func _on_die():
	gameover.emit()
