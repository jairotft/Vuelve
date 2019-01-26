extends Node2D
var posicionplayer = Vector2()
var playercanmove = false
var transition_scenetogo = ""

func vineta(texto):
	$vineta/Label.text = texto
	$animationvineta.current_animation = "vineta"
	
func transition(scene):
	transition_scenetogo = scene
	$animationtransition.current_animation = "transition_in"
func _on_animationtransition_animation_finished(anim_name):
	if anim_name == "transition_in":
		$animationtransition.current_animation = "transition_out"
		if not transition_scenetogo == "":
			get_tree().change_scene(transition_scenetogo)
		
