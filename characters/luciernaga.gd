extends KinematicBody2D

export var gravedad = 20
export var velocidad = 60
export var movimiento = Vector2()
var UP = Vector2(0,-1)
export var friccion = 1.3
export var es_estatica = true


func is_enemy_close():
	var distance = position.distance_to(global.posicionplayer)
	print("Distance", distance)
	return distance < 20


func is_enemy_in_left():
	return global.posicionplayer.x < position.x	


func is_enemy_in_right():
	return global.posicionplayer.x > position.x	
	

func is_enemy_in_top():
	return global.posicionplayer.y < position.y
	

func is_enemy_in_botton():
	return global.posicionplayer.y > position.y
	
func _ready():
	$AnimationPlayer.play("StandFly")

func _physics_process(delta):
	if not es_estatica:
		if not is_enemy_close() and is_enemy_in_right():
			movimiento.x += velocidad
			$Sprite.flip_h = true
		if not is_enemy_close() and is_enemy_in_left():
			movimiento.x -= velocidad
			$Sprite.flip_h = false
		
		movimiento.x /= friccion
		
		move_and_slide(movimiento,UP)
