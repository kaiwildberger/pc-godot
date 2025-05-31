extends Node2D
@export var static_vol = 0
@export var music_vol = 0
var stations = [0.3, 0.7]
var songs = []
var zone = 0.05
var selected = 0
var max_vol = 1 # fine tuning volume

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var current = $Dial.spinner_value
