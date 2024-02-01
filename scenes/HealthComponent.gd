class_name HealthComponent

extends Node2D

@export var MAX_HEALTH: float = 1.0
@export var supress_damage: bool = false

var has_health_remaining: bool = true
var health : float
# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH
	has_health_remaining = true
	
func receive_damage(damage): # TODO attack scene
	health -= damage
	has_health_remaining = health > 0.0
	
	# TODO handle death outside of health component
	if not has_health_remaining: 
		get_parent().queue_free()  # makes parent node dissapear!

func heal(damage):
	pass
