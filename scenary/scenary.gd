extends Area3D

var cam_speed = 0.06
var floor
var scenary
var cam1

func _ready():
	floor = self.get_parent()
	scenary = floor.get_parent()
	cam1 = scenary.get_node('cam1')
	initialize()

func initialize():
	pass
	
func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 && event.pressed == false: #click
			_on_click(position)
		if event.button_index == 4  && cam1.position.y < 4: #roll up
			cam1.position.y += cam_speed
		if event.button_index == 5 && cam1.position.y > 0.7: #roll down
			cam1.position.y -= cam_speed
			
func _on_click(position):
	for players in get_tree().get_nodes_in_group("Player") :
		if players.selected == true: 
			players.move(Vector3(position.x, players.position.y, position.z))
