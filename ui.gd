extends Control

@onready var build_scene = preload("res://Build.tscn")
@onready var libro_scene = preload("res://NotasDiarias.tscn")

var build_instance: Node2D
var book_instance: Node2D

# Método que se ejecuta cuando se presiona el botón "Construction"
func _on_Construction_pressed():
	$Menu/Construction.disabled = true
	build_instance = build_scene.instantiate()
	add_child(build_instance)
	build_instance.connect("tree_exited", Callable(self, "_on_build_scene_closed"))

# Método que se ejecuta cuando se presiona el botón "Book"
func _on_Book_pressed():
	$Menu/Book.disabled = true
	book_instance = libro_scene.instantiate()
	add_child(book_instance)
	book_instance.connect("tree_exited", Callable(self, "_on_book_scene_closed"))

# Método que se ejecuta cuando se cierra la escena Build
func _on_build_scene_closed():
	$Menu/Construction.disabled = false

# Método que se ejecuta cuando se cierra la escena NotasDiarias
func _on_book_scene_closed():
	$Menu/Book.disabled = false

# Conexión de la señal al presionar los botones
@onready var button_construction = $Menu/Construction
@onready var button_book = $Menu/Book

func _ready():
	# Verifica si el botón "Construction" se ha cargado correctamente
	if button_construction:
		button_construction.connect("pressed", Callable(self, "_on_Construction_pressed"))
	else:
		print("No se pudo encontrar el botón 'Construction'")
	
	# Verifica si el botón "Book" se ha cargado correctamente
	if button_book:
		button_book.connect("pressed", Callable(self, "_on_Book_pressed"))
	else:
		print("No se pudo encontrar el botón 'Book'")
