extends CharacterBody2D


const SPEED = 500.0
var direction = Vector2(0,0)
var hp = 100

@export var projetil: PackedScene
@onready var ponta_arma = $EmissorBala

func _physics_process(_delta: float) -> void:
	
	rotacionar_corpo()
	
	mover()
	
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()
		$SomTiro.play()
		
func disparar():
	var nova_bala = projetil.instantiate()
	nova_bala.global_position = ponta_arma.global_position
	nova_bala.direcao = (get_global_mouse_position()-self.global_position).normalized()
	nova_bala.rotation = nova_bala.direcao.angle()
	get_tree().current_scene.add_child(nova_bala)

func mover():
	
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = SPEED * direction
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
func tomar_dano_p():
	hp -= 20
	morrer()
	print("tomou dano")
	
func morrer():
	if hp <= 0:
		get_tree().change_scene_to_file("res://tela_morte.tscn")
