extends Node2D

export var FireVisible= true

signal character_die_with_fire

func _ready():
	$Sprite.visible = FireVisible


func _on_StaticBody2D_body_entered(body):
	emit_signal("character_die_with_fire")
