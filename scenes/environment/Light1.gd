extends Node2D


export var enable_flicker = false
export var energy = .9
export var color = Color.white

func _ready():
	$Light2D.energy = energy
	$Light2D.color = color
	$Light2D.enabled = true
	if enable_flicker:
		$AP_Light.play("flicker")
