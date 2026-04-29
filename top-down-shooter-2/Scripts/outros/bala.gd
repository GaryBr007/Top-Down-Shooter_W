extends Area2D

@export var velocidade := 4500
var direcao = Vector2.ZERO

func _process(delta: float) -> void:
	
	position += velocidade * delta * direcao
