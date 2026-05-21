extends Node3D

@export var interact : Label

signal delete_me

func _ready() -> void:
	set_process_unhandled_input(false)
	interact.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		delete_me.emit()

func _on_interaction_area_area_entered(_area: Area3D) -> void:
	set_process_unhandled_input(true)
	interact.visible = true
	

func _on_interaction_area_area_exited(_area: Area3D) -> void:
	set_process_unhandled_input(false)
	interact.visible = false
