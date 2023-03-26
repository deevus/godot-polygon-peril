extends "res://actor.gd";

class_name Player

signal gameover

@onready var death_sound = $DeathExplosion

# Called when the node enters the scene tree for the first time.
func _ready():
	super();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta);

func die():
	emit_signal("gameover")
