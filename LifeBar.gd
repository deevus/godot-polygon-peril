extends TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	value = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update(health):
	print(health)
	# TODO (mr): make this dynamic
	# Health = 50
	# value = 100
	value = health * 2
	print(value)
