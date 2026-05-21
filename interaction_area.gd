extends Area3D

signal delete_me

func _ready() -> void:
	set_process_unhandled_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		delete_me.emit()



func _on_area_entered(_area: Area3D) -> void:
	set_process_unhandled_input(true)


func _on_area_exited(_area: Area3D) -> void:
	set_process_unhandled_input(false)
