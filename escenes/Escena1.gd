extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocitat = 300
var velocitat_angular = 90
var direccio = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2.ZERO
	#position += Vector2(3,0) #Fa que el objecte es mogui
	#rotation_degrees += 2 #Fa rotar el objecte sobre si mateix
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou adalt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mou abaix"):
		direccio += Vector2.DOWN
	position += direccio.normalized() * velocitat * delta
	
	if position.x >= 1040:
		position.x = 1039
	if position.x <= 0:
		position.x = 1
	if position.y >= 600:
		position.y = 599
	if position.y <= 0:
		position.y = -1
	
func _on_Personatge_area_entered(area:Area2D):
	if area.is_in_group("final"):
		modulate = Color(1, 0, 0)
	if area.is_in_group("inici"):
		modulate = Color(3, 0.4, 0.1)
	area.modulate = Color (0, 1, 0)
	
func _on_Personatge_area_exited(area:Area2D):
	modulate = Color(1, 1, 1)
	area.modulate = Color (1, 1, 1)
