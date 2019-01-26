extends KinematicBody2D

export var gravedad = 20
export var velocidad = 60
export var movimiento = Vector2()
var UP = Vector2(0,-1)
export var limite = 10
export var friccion = 1.3
export var salto = 500
var doble_enabled = false
var player_jumped = true
var is_flying = true


func _physics_process(delta):
	
		
	if Input.is_action_pressed("ui_right"):
		movimiento.x += velocidad
		$Sprite.flip_h = true
		$Sprite/ojosizquierda.flip_h = true
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= velocidad
		$Sprite.flip_h = false
		$Sprite/ojosizquierda.flip_h = false
		
	if not is_on_floor():
		is_flying = true
	else:
		is_flying = false
		doble_enabled = true
	
	if Input.is_action_just_pressed("ui_up") and !is_on_floor() and doble_enabled:
		movimiento.y = -(salto/1.2)
		doble_enabled = false
		player_jumped = true
		is_flying = true
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		movimiento.y = -salto
		player_jumped = true
		is_flying = true
	
	if is_on_ceiling():
		movimiento.y = salto/4
		
	
		
	if is_flying:
		movimiento.y += gravedad
	else:
		if movimiento.y > 0:
			movimiento.y = 0
	
	movimiento.x /= friccion
	
	move_and_slide(movimiento,UP)
	
	global.posicionplayer = global_position

