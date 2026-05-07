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
	var t = int(Global.timer) % 60
	var m = int(int(Global.timer) / 60)
	var formatted_time = str(t) 
	$Tempo.text = str(m) + ":" + str(t)
	
