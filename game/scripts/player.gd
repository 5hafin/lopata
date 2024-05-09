extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var select_dialogue = false


func _physics_process(_delta):
	# Add the gravity.
	
		
	if not is_on_floor():
		velocity.y += gravity * _delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if select_dialogue == true:
		if Input.is_action_just_pressed("ui_select"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialoguestart.dialogue"), "start")
			return



func _on_detection_zone_body_entered(_body):
	
	if _body.has_method("dialogue"):
		select_dialogue = true
		
	pass # Replace with function body.


func _on_detection_zone_body_exited(_body):
	select_dialogue = false
	pass # Replace with function body.
