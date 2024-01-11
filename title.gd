extends ColorRect

@onready var start_text = $PressStart
	
func _on_fader_timeout():
	start_text.visible = !start_text.visible
