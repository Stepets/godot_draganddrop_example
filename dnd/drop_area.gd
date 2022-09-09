extends Control

func _init():
	anchor_top = 0
	anchor_bottom = 1
	anchor_left = 0
	anchor_right = 1

func can_drop_data(_position, _data):
	return true

func drop_data(position, data):
	var stack = [{node = get_tree().root, position = position}]
	while !stack.empty():
		var s = stack.pop_back()
		var n = s.node
		print(n.get_path())
		var pos = s.position
		if n == self:
			#print("skip drop area")
			continue
		if n is Control:
			if (n.get_rect().size.x < pos.x
				or n.get_rect().size.y < pos.y):
				#print("skip point outside control", n.get_rect(), pos)
				continue
			if (n.has_method('can_drop_data')
				and n.can_drop_data(pos, data.get_content())):
				var d = data.get_content()
				data.remove_child(d)
				data.get_parent().remove_child(data)
				data.queue_free()
				remove_and_skip()
				queue_free()
				#print(n.get_path())
				return n.drop_data(pos, d)
		else:
			#print("skip non ui")
			pass
		for c in n.get_children():
			var cpos = pos - c.get_begin()
			if cpos.x >= 0 and cpos.y >= 0:
				stack.push_back({node = c, position = cpos})
	
	#print('rollback')
	remove_and_skip()
	queue_free()
	data.rollback_drag()
