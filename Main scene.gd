extends Node2D

var pointTarget
var coloTarget = 1
var colourCap = 1

onready var counter = $counter/Counter

func _process(_delta):
	
	# spawn input
	if Input.is_action_just_pressed("ui_spawn"):
		
		var object = preload("res://Scenes/Object.tscn").instance()
		
		# points
		_pointRandomizer()
		object.pointValue = pointTarget
		counter.score += object.pointValue
		
		# position
		randomize()
		
		var rangeX = Vector2(40,985)
		var targetX =  randi() % int(rangeX[1] - rangeX[0]) + 1 + rangeX[0]
		
		# instance
		_colourVarient()
		object.spawnColour = coloTarget
		$objectPath.add_child(object)
		object.position = Vector2(targetX, -150)

func _colourVarient():
	
	if counter.level > 0:
		colourCap = 2
		
		if counter.level > 2:
			colourCap = 3
			
			if counter.level > 4:
				colourCap = 4
		
		randomize()
		
		var coloRange = colourCap
		coloTarget =  randi() % coloRange
	

func _pointRandomizer():
		randomize()
		
		var valueRange = Vector2(1,6)
		pointTarget =  randi() % int(valueRange[1] - valueRange[0]) + 1 + valueRange[0]

