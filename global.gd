extends Node2D
var posicionplayer = Vector2()
var playercanmove = false
var transition_scenetogo = ""
var checkpoint = Vector2()
var checkpointID = "inicio"
var transitingsong = false

var pathsongstatic = "res://"
var timesongstatic = 0.0
var timesong = 0.0
var volumentrans = 0
var volumenmin = -30
var volspeedout = 1.2
var volspeedin = 1.2

func _process(delta):
	if Input.is_action_just_pressed("ui_page_up"):
		OS.window_fullscreen = !OS.window_fullscreen 
	if transitingsong:
		if volumentrans > volumenmin:
			volumentrans -= volspeedout
			AudioServer.set_bus_volume_db(1,volumentrans)
		else:
			$songplayer.stop()
			if pathsongstatic != "nothing":
				$songplayer.stream = load (pathsongstatic)
				$songplayer.play()
				$songplayer.seek(timesongstatic)
			transitingsong = false
	else:
		if volumentrans < 0:
			volumentrans += volspeedin
			AudioServer.set_bus_volume_db(1,volumentrans)
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
			
			
func setsong(pathsong):
	pathsongstatic = pathsong
	transitingsong = true

func pausemusic():
	pathsongstatic = "nothing"
	transitingsong = true
