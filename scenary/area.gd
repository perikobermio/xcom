extends Area3D

var player

func _ready():
	player = get_tree().root.get_node("/root/xcom/Player/Player")

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.move(position)
