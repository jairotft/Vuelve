extends KinematicBody2D
export var isvisible = true
export var disabled = false
export var anti_ground = true
export var distancia = 100
var numero_de_textos = 0
var numdetext = 0
export var texto1 = ""
export var texto2 = ""
export var texto3 = ""
export var texto4 = ""
export var texto5 = ""
export var texto6 = ""
export var texto7 = ""
export var texto8 = ""
export var texto9 = ""
export var texto10 = ""
export var stopcharacter = true
var opened = false
var texttoset = ""
var nextmode = false
var onetime = false
var raycastcount = 0
export var autodestroy = false
export var autoground = true
const UP = Vector2(0,-1)
signal end_dialog
signal start_dialog
export var interactoffset = Vector2()

func _ready():
	if not autoground:
		$CollisionShape2D.queue_free()
	if OS.get_name() == "Android":
			$textbox/enter/Labelmovil.visible = true
			$textbox/enter/Labelpc.visible = false
	if !isvisible:
		$Sprite2.visible = false
		$Sprite.visible = false
	procestextnumber()

func _process(delta):
	if $RayCast2D.enabled:
		$RayCast2D.force_raycast_update()
		if $RayCast2D.is_colliding() and anti_ground:
			position.y -= 64
		else:
			raycastcount +=1
			if raycastcount > 10:
				$RayCast2D.enabled = false
	else:
		if autoground:
			move_and_slide(Vector2(0,50000),UP)
			$CollisionShape2D.queue_free()
			autoground = false
	
	if not numero_de_textos == 0 and not disabled:
		if (global_position+interactoffset).distance_to(global.posicionplayer) < distancia and Input.is_action_just_pressed("ui_accept"):
			if numdetext < numero_de_textos+1:
				if numdetext == 0:
					emit_signal("start_dialog")
				numdetext += 1
				if numdetext == 1:
					settext(texto1)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 2:
					settext(texto2)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 3:
					settext(texto3)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 4:
					settext(texto4)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 5:
					settext(texto5)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 6:
					settext(texto6)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 7:
					settext(texto7)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 8:
					settext(texto8)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 9:
					settext(texto9)
					if stopcharacter:
						global.playercanmove = false
				elif numdetext == 10:
					settext(texto10)
					if stopcharacter:
						global.playercanmove = false
			if numdetext == numero_de_textos+1:
				emit_signal("end_dialog")
				if autodestroy:
					queue_free()
				numdetext = 0
				settext("")
				if stopcharacter:
						global.playercanmove = true
			
		if (global_position+interactoffset).distance_to(global.posicionplayer) < distancia:
			if !onetime:
				settext("Press Enter")
				checkenter()
				onetime = true
		elif onetime:
			numdetext = 0
			if opened == true:
				settext("")
			onetime = false
			global.playercanmove = true
		
func settext(texto):
	texttoset = texto
	if not texttoset == "":
		nextmode = true
	else:
		nextmode = false
	if opened:
		$AnimationPlayer.current_animation = "close"
	else:
		$textbox/Label.text = texttoset
		$AnimationPlayer.current_animation = "open"
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "close":
		opened = false
		if nextmode == true:
			$textbox/Label.text = texttoset
			$AnimationPlayer.current_animation = "open"
		checkenter()
	if anim_name == "open":
		opened = true


func procestextnumber():
	numero_de_textos = 0
	if not texto1 == "":
		numero_de_textos +=1
	if not texto2 == "":
		numero_de_textos +=1
	if not texto3 == "":
		numero_de_textos +=1
	if not texto4 == "":
		numero_de_textos +=1
	if not texto5 == "":
		numero_de_textos +=1
	if not texto6 == "":
		numero_de_textos +=1
	if not texto7 == "":
		numero_de_textos +=1
	if not texto8 == "":
		numero_de_textos +=1
	if not texto9 == "":
		numero_de_textos +=1
	if not texto10 == "":
		numero_de_textos +=1
		
func checkenter():
	if $textbox/Label.text == "Press Enter":
		$textbox/textbox3.visible = false
		$textbox/textbox2.visible = false
		$textbox/Label.visible = false
		$textbox/enter.visible = true
	else:
		$textbox/textbox3.visible = true
		$textbox/textbox2.visible = true
		$textbox/Label.visible = true
		$textbox/enter.visible = false

func _on_TouchScreenButton_pressed():
	Input.action_press("ui_accept")
func _on_TouchScreenButton_released():
	Input.action_release("ui_accept")
	
func enable():
	disabled = false

