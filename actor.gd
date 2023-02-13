extends CharacterBody2D;

var Projectile = load("res://projectile.tscn");

@export_category("Actor")
@export var color: Color;
@export_range(1, 1000) var health: int = 3;
@export_range(0, 1000) var speed: int = 500;
@export_range(0, 10000) var gravity: int = 3500;

# Called when the node enters the scene tree for the first time.
func _ready():
	var polygon_2d := Polygon2D.new();
	polygon_2d.polygon = $CollisionPolygon2D.polygon;
	polygon_2d.rotation = $CollisionPolygon2D.rotation;
	polygon_2d.color = self.color;

	add_child(polygon_2d);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (health == 0):
		die();

func _physics_process(delta):
	velocity *= delta;
	move_and_slide();

func attack(projectile_position: Vector2, projectile_rotation: float, offset: int = 15):
	var projectile = Projectile.instantiate();
	projectile.position = projectile_position;
	projectile.rotation = projectile_rotation;
	projectile.move_local_x(offset);

	get_node("/root/Level/Projectiles").add_child(projectile);

func take_damage(damage: int, _source: Object):
	health = max(health - damage, 0);

func die():
	hide();
	queue_free();
