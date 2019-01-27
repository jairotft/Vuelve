extends KinematicBody2D

export var gravedad = 20
export var velocidad = 60
export var movimiento = Vector2()
var UP = Vector2(0,-1)
export var limite = 10
export var friccion = 1.3
export var salto = 500
var doble_enabled = false
var landanim = true
export var activado = true
var jumpsound = preload("res://audio/fx/Sonido salto personaje principal.wav")

func _ready():
	global.checkpoint = global_position

func _physics_process(delta):
	print(movimiento)
	if Input.is_action_pressed("ui_right") and activado:
		movimiento.x += velocidad
		$Sprite.flip_h = true
		$Sprite/ojosizquierda.flip_h = true
	if Input.is_action_pressed("ui_left") and activado:
		movimiento.x -= velocidad
		$Sprite.flip_h = false
		$Sprite/ojosizquierda.flip_h = false
		
	if Input.is_action_just_pressed("ui_up") and activado:
		if is_on_floor():
			movimiento.y = -salto
			$jumpanimations.play("jump")
			$AudioStreamPlayer2D.stream = jumpsound
			$AudioStreamPlayer2D.pitch_scale = 1.3
			$AudioStreamPlayer2D.play()
			print("jump1")
		elif doble_enabled:
			movimiento.y = -(salto/1.2)
			$jumpanimations.play("jump")
			$AudioStreamPlayer2D.stream = jumpsound
			$AudioStreamPlayer2D.pitch_scale = 1.5
			$AudioStreamPlayer2D.play()
			print("jump2")
			doble_enabled = false
	
	if is_on_ceiling():
		movimiento.y = salto/4
		
	if is_on_floor():
		doble_enabled = true
		if landanim:
			$jumpanimations.play("land")
			landanim = false
		if movimiento.y > gravedad:
			movimiento.y = 0
	else:
		landanim = true
		movimiento.y += gravedad
	
	movimiento.x /= friccion
	move_and_slide(movimiento,UP)
	global.posicionplayer = global_position