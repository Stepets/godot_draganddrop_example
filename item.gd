extends VBoxContainer

var idx : int

func init(idx : int):
	self.idx = idx
	$Label.text = str(idx)

func init_from(other):
	init(other.idx)
