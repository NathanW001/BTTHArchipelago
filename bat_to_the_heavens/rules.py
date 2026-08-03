from . import names
from worlds.AutoWorld import World
from typing import Dict, Callable


# This file defines any extra logic rules that pertain to locations in regions that at not normally
# accessible with the base requirements of that region. For example, the Fizzy Ice Cream on the climb
# to Jalta Dregs is still technically within Mola Town, but you shouldn't be expected to get it 
# without fences, jump blocks and momentum launchers.

def get_location_logic_mapping(world: World) -> Dict[str, Callable]:
    location_logic_mapping = {}

    # Helper
    has_a_normal_bat = lambda state: ( # TODO: check if every area is beatable with the phant bat
        (state.has(names.default_bat, world.player) or
         state.has(names.angel_bat, world.player) or
         state.has(names.fizzy_bat, world.player) or
         state.has(names.power_bat, world.player) or
         state.has(names.pink_bat, world.player))
    )

    # Mola Town Locations
    location_logic_mapping[names.fizzy_mola_town_1] = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.jump_block, world.player)) # Jump block needed to get back into Mola Town from the underside
    )

    location_logic_mapping[names.fizzy_mola_town_2] = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player))
    )

    location_logic_mapping[names.collect_postcard_mola_town] = lambda state: ( # I verified myself that fences are not needed for this
        has_a_normal_bat(state)
    )

    location_logic_mapping[names.checkpoint_0_mola_town] = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.jump_block, world.player)) # Jump block needed to get back into Mola Town from the underside
    )

    location_logic_mapping[names.checkpoint_1_mola_town] = lambda state: ( # This is just a copy of mola_town_to_jalta_dregs
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player)) or
        (state.has(names.phant_bat, world.player))
    )

    # Belwheat Valley Locations 
    # Note: since you can make it into Belwheat Valley area trigger the requirement to get here is None, everything else
    # here that isn't the bat will have to require the bat. Nothing here requires yellow fences, there's a steam 
    # achievement for completing the area without using them. I also personally verified that the fizzy doesn't need
    # them either.
    location_logic_mapping[names.fizzy_belwheat_valley_1] = has_a_normal_bat
    location_logic_mapping[names.collect_postcard_belwheat_valley] = has_a_normal_bat
    location_logic_mapping[names.checkpoint_1_belwheat_valley] = has_a_normal_bat
    location_logic_mapping[names.checkpoint_2_belwheat_valley] = has_a_normal_bat
    location_logic_mapping[names.checkpoint_3_belwheat_valley] = has_a_normal_bat
    location_logic_mapping[names.checkpoint_4_belwheat_valley] = has_a_normal_bat

    # Cliff Face Location
    location_logic_mapping[names.phant_1] = lambda state: ( # Key needed to get in the house
        (state.has(names.master_key, world.player))
    )


    # Additional Notes: 
    # - it's possible to progress to Entrance Ruins from GC Warehouse without actually touching a fence.

    return location_logic_mapping