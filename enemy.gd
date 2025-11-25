class_name Enemy
extends CharacterBody2D


@export var MyBullet: PackedScene
var right_gun: Marker2D
var left_gun: Marker2D
var health_controller: LivingUnit

func _ready():
	left_gun = $LeftGun
	right_gun = $RightGun
	health_controller = $HealthController


func hit(damage):
	$HealthController.hit(damage)


func shoot(gun):
	var bullet := MyBullet.instantiate() as Bullet
	bullet.position = gun.global_position
	get_tree().current_scene.add_child(bullet)

func _on_shot_cooldown_timeout():
	shoot(left_gun)
	shoot(right_gun)
	$ShotColdown.start()


func _on_health_controller_get_sprite():
	$HealthController.set_sprite($Sprite)


func _on_health_controller_kill_parent():
	queue_free()
