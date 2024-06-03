extends Area3D

func _ready():
	initialize()

func initialize():
	pass
	#player = get_tree().root.get_node("/root/xcom/Player/Player")
	#player2 = get_tree().root.get_node("/root/xcom/Player2/Player")
	
	#player.position = Vector3(-1.6, player.position.y, 1.6)
	#player2.position = Vector3(1.6, player2.position.y, -1.6)
	
func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		for players in get_tree().get_nodes_in_group("Player") :
			if players.selected == true: 
				players.move(Vector3(position.x, players.position.y, position.z))
