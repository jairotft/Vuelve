extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _do_when_character_died():
	$Player.global_position = global.checkpoint


func _do_when_character_hit_checkpoint():
	if global.checkpointID == 'PRIMERO':
		$luciernagaanim.play("activado")
		$luciernaga/CollisionShape2D/Area2D.queue_free()
		$PRIMERO.queue_free()
		
	if global.checkpointID == 'SEGUNDO':
		$luciernaga/CollisionShape2D/Area2D.queue_free()
		$MAPA1.visible = false
		$MAPA2.visible = true
		$SEGUNDO.queue_free()
		
	if global.checkpointID == 'TERCERO':
		$MAPA2.visible = false
		$MAPA3.visible = true
		
	
	if global.checkpointID == 'CUARTO':
		$TERCERO.queue_free()
