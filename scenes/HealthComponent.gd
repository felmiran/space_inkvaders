class_name HealthComponent

extends Node2D

@export var MAX_HEALTH = 10.0
var health : float
# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH
	
func damage(attack : Attack): # TODO attack scene
	health -= attack.attack_damage
	
	if health <= 0.0:
		get_parent().queue_free()  # makes parent node dissapear!
