extends CharacterBody2D


const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	if %Player:
		mover()
		rotacionar_corpo()
	
	move_and_slide()
	
func mover():
	var direcao_jogador = (%Player.global_position - self.global_position).normalized()
	
	velocity = SPEED * direcao_jogador
	
func rotacionar_corpo():
	look_at(%Player.global_position)
	
func tomar_dano():
	visible = false
	$SomMorte.play()
	await $SomMorte.finished
	self.queue_free()
