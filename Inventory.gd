extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in range(0,9):
		var new_button = TextureButton.new()
		$MainVContainer/Items/ItemGrid.add_child(new_button)
		new_button.texture_normal = load("res://icon.svg")
		new_button.connect("mouse_entered", hovered.bind(new_button))
		new_button.connect("pressed", pressed.bind(new_button))
	$MainVContainer/Items/HeldItem.connect("mouse_entered", hovered.bind($MainVContainer/Items/HeldItem))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hovered(button):
	print("button " + str(button) + " hovered")
	$MainVContainer/Item_Label.text = "item " + str(button)
	$MainVContainer/Description.text = "description for " + str(button)

func pressed(button):
	var index = button.get_index()
	#put new selected item in hand
	button.reparent($MainVContainer/Items)
	#move the held item to the list
	$MainVContainer/Items.get_child(1).reparent($MainVContainer/Items/ItemGrid)
	#put it in its proper place
	$MainVContainer/Items/ItemGrid.move_child($MainVContainer/Items/ItemGrid.get_child($MainVContainer/Items/ItemGrid.get_child_count()-1), index)
