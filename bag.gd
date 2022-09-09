extends Control

const Item := preload("res://item.gd")
const ItemScene = preload("res://item.tscn")
const Draggable = preload("res://dnd/draggable.gd")

func can_drop_data(_position, data):
	return data is Item

func drop_data(position, data):
	var tgt_idx := -1
	for i in range($VBoxContainer/GridContainer.get_child_count()):
		var c : Control = $VBoxContainer/GridContainer.get_child(i)
		if c.get_rect().has_point(position):
			tgt_idx = i
			break
	$VBoxContainer/GridContainer.add_child(Draggable.new(data, ItemScene))
	if tgt_idx != -1:
		$VBoxContainer/GridContainer.move_child(data, tgt_idx)
