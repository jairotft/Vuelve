extends Node2D


export var BichoID = "ID"
signal colicion_con_personaje



func _ready():
	$AnimationPlayer.play("StandFly")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if $CollisionShape2D/AlaIzquierdaOrigen.scale.y == 1:
		$CollisionShape2D/AlaIzquierdaOrigen.scale.y = -1
		$CollisionShape2D/AlaDerechaOrigen.scale.y = -1
	else:
		$CollisionShape2D/AlaIzquierdaOrigen.scale.y = 1
		$CollisionShape2D/AlaDerechaOrigen.scale.y = 1


func _on_Area2D_body_entered(body):
	global.checkpointID = BichoID
	emit_signal("colicion_con_personaje")
