extends TextureProgressBar

@export var shader_material: ShaderMaterial;

@onready var color_rect = $ColorRect

func _ready():
	_init_material()
	_connect_signals()

	value = 100
	
func update(health):
	print(health)
	# TODO (mr): make this dynamic
	# Health = 50
	# value = 100
	value = health * 2
	print(value)

func _init_material() -> void:
	material = shader_material
	color_rect.material = shader_material

func _connect_signals() -> void:
	color_rect.mouse_entered.connect(_on_mouse_entered)
	color_rect.mouse_exited.connect(_on_mouse_exited)

func set_shader_opacity(opacity: float) -> void:
	shader_material.set_shader_parameter("opacity", opacity)

func _on_mouse_entered():
	var current_opacity = shader_material.get_shader_parameter("opacity")
	var tween = create_tween()
	tween.tween_method(set_shader_opacity, current_opacity, 0.1, 0.15)

func _on_mouse_exited():
	var current_opacity = shader_material.get_shader_parameter("opacity")
	var tween = create_tween()
	tween.tween_method(set_shader_opacity, current_opacity, 1.0, 0.15)
