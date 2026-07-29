from typing import ClassVar, Optional

from . import names
from .items import BTTHItem, lookup_name_to_id
from .locations import BTTHLocation, lookup_location_to_id, all_locations
from .options import BTTHOptions, BTTHOptionGroups

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
    location_name_to_id = None #TODO
    # location_name_groups = None #TODO
    web =  BTTHWebWorld()

    def __init__(self, multiworld: MultiWorld, player: int):
        super().__init__(multiworld, player)

    def create_regions(self) -> None:
        pass

    def create_item(self, name: str, force_non_progression: bool=False) -> Item:
        pass

    def get_filler_item_name(self) -> str:
        return self.multiworld.random.choice(["Nothing"]) #TODO add filler