extends StaticBody3D

@export var camera_speed := 15

@export var _camera : Node3D
@export var _room_1 : Node3D
@export var _room_2 : Node3D
@export var _room_3 : Node3D
@export var _room_1_camera : Node3D
@export var _room_2_camera : Node3D
@export var _room_3_camera : Node3D

@export var interact : Label
@export var _item_1 : Node3D

var target_position: Vector3
var target_rotation: Vector3

func _ready() -> void:
	interact.visible = false
	target_position = _room_1_camera.position
	target_rotation = _room_1_camera.rotation

func _on_room_1_area_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print("Entered room 1")
		_room_1.visible = true
		target_position = _room_1_camera.position
		target_rotation = _room_1_camera.rotation

func _on_room_2_area_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print("Entered room 2")
		_room_1.visible = false
		target_position = _room_2_camera.position
		target_rotation = _room_2_camera.rotation


func _on_room_3_area_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print("Entered room 3")
		_room_1.visible = false
		target_position = _room_3_camera.position
		target_rotation = _room_3_camera.rotation

func _physics_process(delta: float) -> void:
	_camera.position = _camera.position.lerp(target_position, camera_speed * delta)
	_camera.rotation = _camera.rotation.lerp(target_rotation, camera_speed * delta)


func _on_item_delete_me() -> void:
	remove_child(_item_1)
