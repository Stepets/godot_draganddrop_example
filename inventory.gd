extends Node

var equipped_id
var items = []

const ItemScene = preload("res://item.tscn")
const Draggable = preload("res://dnd/draggable.gd")

func _ready():
	for i in range(1, 50):
		var item = ItemScene.instance()
		item.init(i)
		items.append(item)
		item = Draggable.new(item, ItemScene)
		if randf() > 0.5:
			$belt/VBoxContainer/GridContainer.add_child(item)
		else:
			$bag/VBoxContainer/GridContainer.add_child(item)


