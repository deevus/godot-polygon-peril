extends CharacterBody2D;

signal hit(health_remaining: int, health_max: int)
signal death()

var Projectile = load("res://projectile.tscn");

var area_2d = Area2D.new();

@export_category("Actor")
@export var color: Color;
@export_range(1, 1000) var health: int = 3;
@export_range(1, 1000) var max_health: int = 0;
@export_range(0, 1000) var speed: int = 500;
@export_range(0, 10000) var gravity: int = 3500;

func _ready():
	if max_health == 0:
		max_health = health

	var polygon_2d := Polygon2D.new();
	polygon_2d.polygon = $CollisionPolygon2D.polygon;
	polygon_2d.rotation = $CollisionPolygon2D.rotation;
	polygon_2d.color = self.color;

	add_child(polygon_2d);

	area_2d.collision_layer = collision_layer;
	area_2d.collision_mask = collision_mask;
	area_2d.collision_priority = collision_priority;
	area_2d.add_child($CollisionPolygon2D.duplicate());
	add_child(area_2d);

func _process(_delta):
	if (health == 0):
		die();

func _physics_process(delta):
	velocity *= delta;
	move_and_slide();

func attack(projectile_position: Vector2, projectile_rotation: float, offset: int = 25):
	var projectile = Projectile.instantiate();
	projectile.position = projectile_position;
	projectile.rotation = projectile_rotation;
	projectile.move_local_x(offset);

	get_node("/root/Main/Level/Projectiles").add_child(projectile);

func take_damage(damage: int, _source: Object):
	health = max(health - damage, 0);
	hit.emit(health, max_health)

func die():
	death.emit()
	queue_free();
