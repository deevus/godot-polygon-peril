extends "res://actor.gd";

signal gameover
signal hit

@onready var death_sound = $DeathExplosion

# Called when the node enters the scene tree for the first time.
func _ready(): 
	super();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta);

func take_damage(damage: int, _source: Object):
	health = max(health - damage, 0);
	emit_signal('hit', health)

func die():
	emit_signal("gameover")
