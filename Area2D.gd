extends Area2D

var gap = 30 * GLOBAL.sceneScaleCoef
var distance
var heightDifference
var hint

# shows a player what button to press
func createHint():
	hint = Label.new()
	hint.text = "D"
	hint.rect_position = Vector2(0, -scale.y * GLOBAL.sceneScaleCoef * 200)
	hint.rect_scale = Vector2(2 * GLOBAL.sceneScaleCoef, 2 * GLOBAL.sceneScaleCoef)
	add_child(hint)

# shows or hides the button you need to press to climb	
func showHideHint():
	if distance < gap && heightDifference < gap * 1.5:
		get_child(1).visible = true
	else:
		get_child(1).visible = false

# initial stuff		
func _ready():
	createHint()

# check if a player can hide in this very shelter
func checkHidingAbility():
	if abs(GLOBAL.playerCoordinates.x - position.x) < gap &&\
	abs(GLOBAL.playerCoordinates.y - position.y) < gap * 2:
		GLOBAL.shelterCounter += 1

# kinda main function
func _physics_process(delta):
	distance = abs(position.x - GLOBAL.playerCoordinates.x)
	heightDifference = abs(position.y - GLOBAL.playerCoordinates.y)
	
	checkHidingAbility()
	showHideHint()