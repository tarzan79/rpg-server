extends Node2D


var pos = Vector2(0, 0)
var stat

func _ready():
    rset_config("pos", 4) 
    pass # Replace with function body.



func _process(delta):
    if pos:
        position = pos
    #rset("pos", pos)
