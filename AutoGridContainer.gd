tool
extends GridContainer

func _ready():
	if get_child_count() == 0:
		return
	init()

func add_child(n : Node, d : bool = false):
	.add_child(n,d)
	if get_child_count() == 1:
		init()

func init():
	var child_size = get_child(0).rect_size
	var old_column_amount = columns
	var new_column_amount = floor(self.rect_size.x / child_size.x)
	if new_column_amount != old_column_amount:
		columns = new_column_amount


