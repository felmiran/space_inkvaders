class_name AttackComponent

extends Node2D

@export var deal_damage: bool = true
var deal_damage_list = {"default": deal_damage}

@export var attack_damage: float = 1

@export var knockback_force: float = 2

func modify_damage(modifier):
	attack_damage += modifier
	
func add_entity_to_deal_damage_list(object, ok_to_damage: bool):
	"""
	object: thought as a specific instance of an object with a hitbox.
			for example, do not damage trees or allies, but damage the rest.
	"""
	deal_damage_list[object] = ok_to_damage
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
