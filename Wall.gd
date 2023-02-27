extends Polygon2D

@onready var static_body = $StaticBody2D
@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var collision_shape := CollisionPolygon2D.new();
	collision_shape.polygon = self.polygon;

	static_body.add_child(collision_shape);	
	area_2d.add_child(collision_shape.duplicate());
