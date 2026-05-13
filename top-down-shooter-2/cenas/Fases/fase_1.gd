extends Node2D

@export var inimigo_cena: PackedScene

func spawn_inimigo():
	var novo_inimigo = inimigo_cena.instantiate()
	
	var rand_posX =randi_range(-1300,1300)
	var rand_posY =randi_range(-1300,1300)
	var posX = %Player.global_position.x + rand_posX
	var posY = %Player.global_position.y + rand_posY
	
	while true:
		if %Player.global_position.distance_to(Vector2(posX,posY))>1300:
			if posY >= -1848 and posY <= 1848:
				if posX >= -2840 and posX <= 2840:
					break
			
		rand_posX =randi_range(-1300,1300)
		rand_posY =randi_range(-1300,1300)
		posX = %Player.global_position.x + rand_posX
		posY = %Player.global_position.y + rand_posY
			
	novo_inimigo.global_position = Vector2(posX,posY)
	
	get_tree().current_scene.add_child(novo_inimigo)
	
	novo_inimigo.jogador = %Player


func _on_timer_timeout() -> void:
	spawn_inimigo()
