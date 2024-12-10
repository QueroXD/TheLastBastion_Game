extends Node2D

# Función que se ejecuta al presionar el botón Cerrar
func _on_ButtonCerrar_pressed():
	# Remueve este nodo de la escena principal
	queue_free()

# Conecta la señal del botón Cerrar al método
func _ready():
	# Conectar el botón de cerrar
	$MenuBuild/Cerrar.connect("pressed", Callable(self, "_on_ButtonCerrar_pressed"))
