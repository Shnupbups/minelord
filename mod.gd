extends Reference

func load(modloader: Reference, mod_info, tree: SceneTree):
    modloader.add_mod_symbol("res://minelord/symbols/creeper.gd")
    modloader.add_mod_symbol("res://minelord/symbols/charged_creeper.gd")