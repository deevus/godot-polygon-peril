extends "res://actor.gd"

@export_category("Projectile")
@export var damage: int = 1;

func _physics_process(delta):
	move_local_x(delta * speed);

	var collision = move_and_collide(velocity);
	if (collision):
		hit(collision.get_collider());

func hit(collider: Object):
	if (collider.has_method("take_damage")):
		collider.take_damage(damage, self);

	hide();
	queue_free();
