extends StaticBody2D

var soldiers

func _process(delta):
	if soldiers != null:
		for soldier in soldiers:
			if soldier != null:
				self.look_at(soldier.global_position)
				break


func _on_stage_1_soldiers(soldiers):
	self.soldiers = soldiers
