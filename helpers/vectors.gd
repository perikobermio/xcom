# helpers/vectors.gd

extends Object

class_name Vectors

static func limitDistance(origin: Vector3, destiny: Vector3, max_move: float) -> Vector3:
	var distance = origin.distance_to(destiny)
	
	if distance > max_move:
		destiny = (destiny - origin).normalized()
		destiny = origin + destiny * max_move
		
	return destiny
