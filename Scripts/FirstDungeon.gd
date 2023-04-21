extends Node

@export var player_scene: PackedScene
@export var key_scence: PackedScene

func _ready():
	start_scene()

func start_scene():
	var player = player_scene.instantiate() # 创建玩家实例
	add_child(player)
	player.position = $PlayerStartPosition.position
	
	var key = key_scence.instantiate() #创建钥匙实例
	add_child(key)
	key.position = $KeyStartPosition.position
