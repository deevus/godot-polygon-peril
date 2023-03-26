extends "res://actor.gd"

@onready var player: Player = get_node("/root/Main/Level/Actors/Player");

func _ready():
	super();

func _physics_process(delta):
	super(delta);

func _on_timer_timeout():
	if (player != null):
		look_at(player.global_position);
		attack(position, rotation);
