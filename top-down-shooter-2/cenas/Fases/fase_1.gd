extends Node2D

@export var inimigo_cena: PackedScene

func spawn_inimigo():
	var novo_inimigo = inimigo_cena.instantiate()
	
	var rand_posX =randi_range(-1000,1000)
	var rand_posY =randi_range(-1000,1000)
	var posX = %Player.global_position.x + rand_posX
	var posY = %Player.global_position.y + rand_posY
	
	while true:
		if %Player.global_position.distance_to(Vector2(posX,posY))>1000:
			break
		if posY >= 0 and posY <= 5000:
			break
		if posX >= 0 and posX <= 10000:
			break
			
		rand_posX =randi_range(-1000,1000)
		rand_posY =randi_range(-1000,1000)
		posX = %Player.global_position.x + rand_posX
		posY = %Player.global_position.y + rand_posY
			
	novo_inimigo.global_position = Vector2(posX,posY)
	
	get_tree().current_scene.add_child(novo_inimigo)
	
	novo_inimigo.jogador = %Player


func _on_timer_timeout() -> void:
	spawn_inimigo()
