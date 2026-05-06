extends CharacterBody2D

var hp = 100 
const SPEED = 300.0
var jogador = null


func _physics_process(_delta: float) -> void:
	if jogador:
		mover()
		rotacionar_corpo()
	
	move_and_slide()
	
func mover():
	var direcao_jogador = (jogador.global_position - self.global_position).normalized()
	
	velocity = SPEED * direcao_jogador
	
func rotacionar_corpo():
	look_at(jogador.global_position)
	
func tomar_dano():
	hp -= 25
	$SomMorte.play()
	morrer()
	
func morrer():
	if hp <= 0:
		$SomMorte.play()
		visible = false
		$CollisionShape2D.disabled = true
		await $SomMorte.finished
		self.queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.tomar_dano_p()
