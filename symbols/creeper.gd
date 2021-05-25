extends "res://modloader/ModSymbol.gd"

func init(modloader: Reference, params):
	self.modloader = modloader

	self.id = "creeper"
	self.value = 4
	self.values = [1]
	self.rarity = "rare"
	self.groups = ["organism"]

	self.texture = load_texture("res://minelord/symbols/creeper.png")
	add_sfx_redirect("midas_bomb")
	
	self.name = "Creeper"
	if modloader.mods.has("valgos-content-pack"):
		self.description = "<color_E14A68>Destroys<end> itself and all adjacent symbols if adjacent to <group_human> or <last_human>. Transforms into <icon_charged_creeper> when adjacent to <icon_lightning_bolt>."
	else:
		self.description = "<color_E14A68>Destroys<end> itself and all adjacent symbols if adjacent to <group_human> or <last_human>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.groups.has("human"):
			symbol.add_effect(effect().animate("shake").set_destroyed())
			for j in adjacent:
				if j.type == "empty":
					continue
				symbol.add_effect_for_symbol(j, effect().set_destroyed())
			break
		elif i.type == "lightning_bolt":
			symbol.add_effect(effect().change_type("charged_creeper"))