extends CharacterBody3D

var tween: Tween
var material

var speed = 2.0
var max_move = 1.0
var selected = false
		
func _ready():
	material = $mesh.get_mesh().surface_get_material(0).duplicate()
	$mesh.material_override = material
	add_to_group("Player")
	
func move(destiny):
	#https://www.gotut.net/tweens-in-godot-4/
	if selected == false: return
	
	destiny = Vectors.limitDistance(self.position, destiny, max_move)
	var distance = self.position.distance_to(destiny)
	var duration = distance / speed
	
	tween = create_tween()
	tween.tween_property(self, "position", destiny, duration)

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		selected = !selected
		select()
		
func select():
	if selected == true:
		get_tree().call_group("Player", "clear_selected")
		selected = true
		material.albedo_color = Color(1, 0, 0)
	else:
		material.albedo_color = Color(1, 1, 1)

func clear_selected():
	selected = false
	select()
