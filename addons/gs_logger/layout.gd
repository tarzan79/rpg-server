"""
Class: Layout
    Formats a Log Event for an Appender.
"""
#warning-ignore-all:shadowed_variable
#warning-ignore-all:unused_variable
#warning-ignore-all:unused_argument
extends Reference
class_name Layout

func getHeader():
    return ""


func getFooter():
    return ""


func build(message: Message, format: int):
    return message


func _init():
    pass
