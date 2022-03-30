extends KinematicBody2D

var velocitat_base = 200
var direccio = Vector2.DOWN

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -300

var num_salt = 0

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
		
	if Input.is_action_just_pressed("mou adalt"):
		if num_salt == 2:
			num_salt = 1
			velocitat.y = velocitat_salt 
		if num_salt == 1:
			num_salt = 0
			velocitat.y = velocitat_salt 
		if num_salt == 0:
			pass
		if is_on_floor():
			num_salt = 2
			
		
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
