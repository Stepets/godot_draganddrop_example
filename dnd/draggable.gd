extends CenterContainer

const DropArea := preload("res://dnd/drop_area.gd")

var sc : PackedScene

func _init(n : Node, scene : PackedScene):
	self.sc = scene
	add_child(n)

func get_content():
	return get_child(0)

func get_drag_data(_pos):
	get_tree().root.add_child(DropArea.new())
	var preview = sc.instance()
	set_drag_preview(preview)
	preview.init_from(get_content())
	self.hide()
	return self

func rollback_drag():
	self.show()
