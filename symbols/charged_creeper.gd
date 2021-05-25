extends "res://modloader/ModSymbol.gd"

func init(modloader: Reference, params):
	self.modloader = modloader

	self.id = "charged_creeper"
	self.value = 5
	self.values = [1]
	self.rarity = "very_rare"
	self.groups = ["organism"]

	self.texture = load_texture("res://minelord/symbols/charged_creeper.png")
	add_sfx_redirect("midas_bomb")
	
	self.name = "Charged Creeper"
	self.description = "<color_E14A68>Destroys<end> itself and all symbols in a small radius if adjacent to <group_human> or <last_human>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.groups.has("human"):
			symbol.add_effect(effect().animate("shake").set_destroyed())
			for j in adjacent:
				if j.type == "empty":
					continue
				symbol.add_effect_for_symbol(j, effect().set_destroyed())
			break