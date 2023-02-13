extends Node2D

const Actor = preload("res://actor.gd");

@export var actor: Node2D;

func _physics_process(_delta):
	process_input();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_input():
	if (self.actor == null):
		return;

	var velocity = actor.velocity;

	if (Input.is_action_pressed("move_up")):
		velocity.y -= actor.speed * actor.gravity;
	if (Input.is_action_pressed("move_down")):
		velocity.y += actor.speed * actor.gravity;
	if (Input.is_action_pressed("move_left")):
		velocity.x -= actor.speed * actor.gravity;
	if (Input.is_action_pressed("move_right")):
		velocity.x += actor.speed * actor.gravity;

	var mouse_position = get_global_mouse_position();
	actor.look_at(mouse_position);

	actor.velocity = velocity;

	if (Input.is_action_just_pressed("attack")):
		actor.attack(actor.position, actor.rotation);
