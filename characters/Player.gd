extends KinematicBody2D

export var gravedad = 20
export var velocidad = 60
export var movimiento = Vector2()
var UP = Vector2(0,-1)
export var limite = 10
export var friccion = 1.3
export var salto = 500
var doble_enabled = false
var player_jumped = false


func _physics_process(delta):
	
		
	if Input.is_action_pressed("ui_right"):
		movimiento.x += velocidad
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= velocidad
		
	if Input.is_action_just_pressed("ui_up") and !is_on_floor() and doble_enabled:
		movimiento.y = -(salto/1.2)
		doble_enabled = false
		player_jumped = true
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		movimiento.y = -salto
		player_jumped = true
	
	if is_on_ceiling():
		movimiento.y = salto/4
		
	if not is_on_floor():
		movimiento.y += gravedad
	else:
		if not Input.is_action_just_pressed("ui_up") and player_jumped:
			movimiento.y = 0
			player_jumped = false
		doble_enabled = true
	
	movimiento.x /= friccion
	
	move_and_slide(movimiento,UP)
	
	global.posicionplayer = global_position

