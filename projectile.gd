extends "res://actor.gd"

@export_category("Projectile")
@export var damage: int = 1;

func _ready():
	super();

	area_2d.connect("body_entered", self._on_body_entered);
	area_2d.connect("area_entered", self._on_area_entered);

func _physics_process(delta):
	move_local_x(delta * speed);

func _on_body_entered(collider: Node2D):
	maybe_hit(collider);

func _on_area_entered(area: Area2D):
	maybe_hit(area.get_parent());

func maybe_hit(node: Node2D):
	print('maybe_hit: ', node.name);

	if (node.is_in_group("damageable")):
		node.take_damage(damage, self);
	
	hide();
	queue_free();
