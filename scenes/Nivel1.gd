extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	global.setsong("res://audio/musica/Sonido titilante caida.ogg")



func _do_when_character_died():
	$Player.global_position = global.checkpoint
	if global.checkpointID == "bosskill":
		$Boss/bossanim.play("persecucion")
		$Boss/bossanim.seek(0,true)

func _do_when_character_hit_checkpoint():
	if global.checkpointID == 'PRIMERO':
		$luciernagaanim.play("activado")
		if $luciernaga/CollisionShape2D/Area2D != null:
			$luciernaga/CollisionShape2D/Area2D.queue_free()
		if $PRIMERO != null:
			$PRIMERO.queue_free()
		
	if global.checkpointID == 'SEGUNDO':
		if $luciernaga/CollisionShape2D/Area2D != null:
			$luciernaga/CollisionShape2D/Area2D.queue_free()
		#$MAPA1.visible = false
		$MAPA2.position = Vector2()
		$MAPA2.visible = true
		if $SEGUNDO != null:
			$SEGUNDO.queue_free()
		
	if global.checkpointID == 'TERCERO':
		print("cuarto")
		global.setsong("res://audio/musica/Sonido luciernaga persecucion.ogg")
		$MAPA2.visible = false
		$MAPA2.position = Vector2(10000,0)
		$MAPA3.visible = true
		$MAPA3.position = Vector2()
		$Boss/bossanim.play("persecucion")
		
	
	if global.checkpointID == 'CUARTO':
		if $TERCERO != null:
			$TERCERO.queue_free()


func _on_checkpoint5_touched():
	$finalanim.play("final2")


func _on_finalanim_animation_finished(anim_name):
	global.transition("res://scenes/final.tscn")


func _on_checkpoint_touched():
	$Player.activado = true
