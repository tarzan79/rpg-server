extends Node

var fsm: StateMachine


var direction = Vector2(0,1)
var speed = 150 
var directions = ["right", "bottom-right", "bottom", "bottom-left", "left", "top-left", "top", "top-right"]
export var animation:NodePath = ""
var velocity = Vector2(0, 0)

func enter():
    rset_config("velocity", 4) 
   # exit("nom de la state")

func exit(next_state):
  fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
    if velocity.length() > 0:
        velocity = velocity.normalized()            
        direction = velocity
    else:
        fsm.get_parent().position = fsm.get_parent().pos
    rset("velocity", velocity)
    return delta

func physics_process(delta):
    return delta

func input(event):
#    if event.is_action_pressed("menu"):
#        exit("Menu")
#        return event
    pass
