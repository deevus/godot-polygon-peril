extends TextureProgressBar

@export var shader_material: ShaderMaterial;

@onready var color_rect = $ColorRect
@onready var label = $Label

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
	color_rect.mouse_entered.connect(_opacity_down)
	color_rect.mouse_exited.connect(_opacity_up)

func set_opacity(opacity: float) -> void:
	shader_material.set_shader_parameter("opacity", opacity)
	label.label_settings.font_color.a = opacity

func get_current_opacity() -> float:
	return shader_material.get_shader_parameter("opacity")

func _opacity_down():
	var tween = create_tween()
	tween.tween_method(set_opacity, get_current_opacity(), 0.1, 0.15)

func _opacity_up():
	var tween = create_tween()
	tween.tween_method(set_opacity, get_current_opacity(), 1.0, 0.15)
