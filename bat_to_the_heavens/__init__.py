from typing import ClassVar, Optional, Dict

from Utils import visualize_regions

from . import names
from .items import BTTHItem, lookup_name_to_id, item_table, filler_table, bat_table, collectable_table, equipment_table, world_block_table, trap_table
from .locations import BTTHLocation, lookup_location_to_id, all_locations, checkpoint_loctations
from .options import BTTHOptions, BTTHOptionGroups
from .regions import create_region, create_regions, connect_regions

import settings
from BaseClasses import Item, ItemClassification, MultiWorld, Tutorial
from worlds.AutoWorld import World, WebWorld

class BTTHSettings(settings.Group):
    pass


class BTTHWebWorld(WebWorld):
    rich_text_options_doc = True
    theme = "grassFlowers"
    bug_report_page = "https://github.com/NathanW001/BTTHArchipelago/issues"
    tutorials = [
        Tutorial(
            "Multiworld Setup Guide",
            "A guide to setting up the Bat to the Heavens randomizer connected to an Archipelago Multiworld",
            "English",
            "setup_en.md",
            "setup/en",
            ["Wonton"]
        )
    ]

    option_groups = BTTHOptionGroups

class BTTHWorld(World):
    """
    Can't run or jump? But with a bat, you can surpass any obstacle! Climb to the heavens, learn techniques, and discover secrets across the valley in this challenging puzzle - execution - momentum game! (from the Steam page)
    """
    game = "Bat to the Heavens"
    authors = ["Wonton"]
    settings_key = "btth_settings"
    settings = ClassVar[BTTHSettings]
    options_dataclass = BTTHOptions
    options: BTTHOptions
    item_name_to_id = lookup_name_to_id
    # item_name_groups = None #TODO
    location_name_to_id = lookup_location_to_id
    # location_name_groups = None #TODO
    web =  BTTHWebWorld()

    def __init__(self, multiworld: MultiWorld, player: int):
        super().__init__(multiworld, player)

    def create_regions(self) -> None:
        create_regions(self)
        connect_regions(self)

        total_locations = len(all_locations)
        if not self.options.checkpointsanity:
            total_locations -= len(checkpoint_loctations)

        itempool = []
        item_names_to_create = \
            [item_name for item_name in bat_table.keys()] + \
            [item_name for item_name in collectable_table.keys() if item_name != names.fizzy_ice_cream and item_name != names.phant] + \
            [names.fizzy_ice_cream for _ in range(20)] + \
            [names.phant for _ in range(7)] + \
            [item_name for item_name in equipment_table.keys()] + \
            [item_name for item_name in world_block_table.keys()]

        for item_name in item_names_to_create:
            itempool.append(self.create_item(item_name))

        # Static Locations

        while len(itempool) < total_locations:
            itempool.append(self.create_item(self.get_filler_item_name()))

        self.multiworld.itempool += itempool

        # TODO: check goal condition and set accordingly
        self.multiworld.completion_condition[self.player] = lambda state: \
            ((state.has(names.default_bat, self.player) or
              state.has(names.angel_bat, self.player) or
              state.has(names.fizzy_bat, self.player) or
              state.has(names.power_bat, self.player) or
              state.has(names.pink_bat, self.player)) and
             (state.has(names.yellow_fence, self.player) and
              state.has(names.jump_block, self.player) and
              state.has(names.momentum_launcher, self.player) and
              state.has(names.vector_block, self.player) and
              state.has(names.charge_block, self.player) and
              state.has(names.super_jump_block, self.player) and
              state.has(names.ball_power, self.player) and
              state.has(names.wave_dash_power, self.player)))

        # visualize_regions(self.get_region("Menu"), "btth.puml")
        

    def create_item(self, name: str, force_non_progression: bool=False) -> Item:
        data = item_table[name]
        classification = ItemClassification.filler

        if force_non_progression:
            pass
        elif data.progression:
            classification = ItemClassification.progression

        if data.useful:
            classification = classification | ItemClassification.useful

        created_item = BTTHItem(name, classification, data.code, self.player)

        return created_item

    def get_filler_item_name(self) -> str:
        return self.multiworld.random.choice(list(filler_table.keys()))

    def fill_slot_data(self) -> Dict[str, any]:
        return {
            "goal": self.options.goal.value,
            "checkpointsanity": self.options.checkpointsanity.value,
            "ranomizestartingbat": self.options.ranomizestartingbat.value,
            "randomizeball": self.options.randomizeball.value,
            "randomizewavedash": self.options.randomizewavedash.value,
            "deathlink": self.options.deathlink.value
        }