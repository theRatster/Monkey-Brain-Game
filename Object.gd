extends KinematicBody2D

var pointValue = 3
var spawnColour = 1
const gravity = 500

onready var sprite: AnimatedSprite = get_node("Sprite")

func _physics_process(delta):
	sprite.animation = str(spawnColour)
	rotation -= 4 * delta
	position.y += gravity * delta
