extends TextureProgressBar

func _ready():
	value = 100
	
func update(health):
	print(health)
	# TODO (mr): make this dynamic
	# Health = 50
	# value = 100
	value = health * 2
	print(value)
