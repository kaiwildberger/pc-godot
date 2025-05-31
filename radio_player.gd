extends Node2D
@export var static_vol = 0
@export var music_vol = 0
var stations = [0.3, 0.7]
var songs = []
var zone = 0.05
var selected = 0
var max_vol = 1 # fine tuning volume

func _ready() -> void:
	songs = [$Caramelldansen, $Andre]
	for i in songs:
		i.play(0) # need to make them loop too
	$Static.play(0)

func _process(_delta: float) -> void:
	var current = $Dial.spinner_value
	for i in len(stations):
		music_vol = 1 - (abs(current - stations[i]) / zone)
		music_vol = max(music_vol, 0)
		songs[i].volume_linear = music_vol * max_vol
	#$"raw label".text = "%s" % music_vol
	#$Caramelldansen.volume_linear = music_vol * max_vol
	$Static.volume_linear = max(static_vol, 1-(music_vol/2)) # ducking???

func _on_static_finished() -> void:
	$Static.play(0)
