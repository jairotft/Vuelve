extends Node2D

func _ready():
	$AnimationPlayer.play("inicio")
	global.setsong("res://audio/musica/Musica de Inicio.ogg")
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		_on_Button_button_up()
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit()
func _on_Button_button_up():
	global.transition("res://scenes/Nivel1.tscn")


func _on_Timer_timeout():
	$Label.visible = !$Label.visible 
