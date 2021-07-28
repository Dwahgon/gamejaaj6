extends Position2D

export(PackedScene) var cena_inimigo: PackedScene

var inimigo: KinematicBody2D

func spawnar() -> void:
	if not cena_inimigo:
		printerr("Erro: ",get_path(), " -> cena_inimigo nao foi setado")
		return

	$Delay.start()


func resetar() -> void:
	if inimigo:
		inimigo.queue_free()

	print(get_path(),":reseto")


func _on_Delay_timeout():
	if not inimigo:
		inimigo = cena_inimigo.instance()
		inimigo.position = position
		call_deferred("add_child", inimigo)
		$Particles2D.emitting = true
	# TODO: Fazer uma animacaozinha/Spawnar uma particula quando o inimigo spawnar

	print(get_path(),":spawno")
