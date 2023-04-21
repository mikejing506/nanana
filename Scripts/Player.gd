extends Node2D

@export var speed = 300 # 角色移动速度
var screen_size # 界面尺寸

func _ready():
	screen_size = get_viewport_rect().size # 获取界面尺寸
	# hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # 角色移动向量
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed # 移动向量归一，确保移动速度不变
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 30, screen_size.x - 30) # 角色不能移动出界面外
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0 # 移动动画左右方向
