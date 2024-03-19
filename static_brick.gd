extends StaticBody2D

@export var destructable: bool = true
@export var hitpoints: int = 0

@onready var polygon_2d = %Polygon2D

var colorGradient: Array[Color] = [
	Color(1, 0, 0),  # Red for value 1
	Color(1, 0.5, 0),  # Orange for value 2
	Color(1, 1, 0),  # Yellow for value 3
	Color(0, 1, 0),  # Green for value 4
	Color(0, 1, 1),  # Cyan for value 5
	Color(0, 0, 1),  # Blue for value 6
	Color(0.5, 0, 1),  # Purple for value 7
	Color(1, 0, 1),  # Magenta for value 8
	Color(1, 0.5, 0.5),  # Light Red for value 9
	Color(1, 1, 1)  # White for value 10
]

func _ready():
	if destructable && hitpoints == 0:
		hitpoints = randi_range(1,9)
	update_color()

func collide(hit: int):
	if !destructable:
		return
	if hitpoints > 0:
		hitpoints -= hit
		update_color()
	else:
		queue_free()

func update_color():
	polygon_2d.set_color(colorGradient[hitpoints])
