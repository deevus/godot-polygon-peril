extends "res://actor.gd";

signal gameover
signal hit

@onready var death_sound = $DeathExplosion

func take_damage(damage: int, _source: Object):
	health = max(health - damage, 0);
	hit.emit(health)

func die():
	gameover.emit()
