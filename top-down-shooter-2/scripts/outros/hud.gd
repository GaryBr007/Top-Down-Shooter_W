extends CanvasLayer

var time = Global.timer

func _process(_delta: float) -> void:
	$Kills.text = str("Kills: ") + str(Global.killcount)

func _physics_process(delta: float) -> void:
	if Global.timer_contando:
		time += delta
		Global.timer = time
	update_ui()
	
func update_ui():
	var t = float(Global.timer)
	var formatted_time = "%.2f" % t
	$Tempo.text = formatted_time
	
