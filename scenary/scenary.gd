extends Area3D

var player
var player2
var selected_player

func _ready():
	player = get_tree().root.get_node("/root/xcom/Player/Player")
	player2 = get_tree().root.get_node("/root/xcom/Player2/Player2")
	
	player.position = Vector3(-1.6, player.position.y, 1.6)

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.move(Vector3(position.x, player.position.y, position.z))
