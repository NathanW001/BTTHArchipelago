from BaseClasses import Entrance, Region
from worlds.AutoWorld import World
from typing import Dict, Optional, Callable

from . import names
from . import locations
from .rules import get_location_logic_mapping

class BTTHRegion(Region):
    game = "Bat to the Heavens"

def create_regions(world: World) -> None:
    # all possible locations
    mola_town_locations = locations.mola_town_locations
    belwheat_valley_locations = locations.belwheat_valley_locations
    gc_warehouse_locations = locations.gc_warehouse_locations
    entrance_ruins_locations = locations.entrance_ruins_locations
    goldcherry_factory_locations = locations.goldcherry_factory_locations
    cliff_face_locations = locations.cliff_face_locations
    forest_cavern_locations = locations.forest_cavern_locations
    eroded_beach_locations = locations.eroded_beach_locations
    port_naga_locations = locations.port_naga_locations
    basin_21_locations = locations.basin_21_locations
    pastel_strata_locations = locations.pastel_strata_locations
    astral_tower_locations = locations.astral_tower_locations
    precipice_bridge_locations = locations.precipice_bridge_locations
    terminus_locations = locations.terminus_locations
    heavens_channel_locations = locations.heavens_channel_locations
    jalta_dregs_locations = locations.jalta_dregs_locations
    creacher_cave_locations = locations.creacher_cave_locations
    terminal_station_locations = locations.terminal_station_locations
    abandoned_district_locations = locations.abandoned_district_locations
    power_room_locations = locations.power_room_locations
    villiths_drain_locations = locations.villiths_drain_locations
    false_field_locations = locations.false_field_locations
    plateau_underside_locations = locations.plateau_underside_locations
    satellite_ranch_locations = locations.satellite_ranch_locations
    sand_hell_locations = locations.sand_hell_locations
    warp_room_locations = locations.warp_room_locations
    drain_room_locations = locations.drain_room_locations
    ediface_roots_locations = locations.ediface_roots_locations
    third_cistern_locations = locations.third_cistern_locations

    if world.options.checkpointsanity:
        mola_town_locations = {**mola_town_locations, **locations.mola_town_checkpoint_locations}
        belwheat_valley_locations = {**belwheat_valley_locations, **locations.belwheat_valley_checkpoint_locations}
        gc_warehouse_locations = {**gc_warehouse_locations, **locations.gc_warehouse_checkpoint_locations}
        entrance_ruins_locations = {**entrance_ruins_locations, **locations.entrance_ruins_checkpoint_locations}
        goldcherry_factory_locations = {**goldcherry_factory_locations, **locations.goldcherry_factory_checkpoint_locations}
        cliff_face_locations = {**cliff_face_locations, **locations.cliff_face_checkpoint_locations}
        forest_cavern_locations = {**forest_cavern_locations, **locations.forest_cavern_checkpoint_locations}
        eroded_beach_locations = {**eroded_beach_locations, **locations.eroded_beach_checkpoint_locations}
        port_naga_locations = {**port_naga_locations, **locations.port_naga_checkpoint_locations}
        basin_21_locations = {**basin_21_locations, **locations.basin_21_checkpoint_locations}
        pastel_strata_locations = {**pastel_strata_locations, **locations.pastel_strata_checkpoint_locations}
        astral_tower_locations = {**astral_tower_locations, **locations.astral_tower_checkpoint_locations}
        precipice_bridge_locations = {**precipice_bridge_locations, **locations.precipice_bridge_checkpoint_locations}
        terminus_locations = {**terminus_locations, **locations.terminus_checkpoint_locations}
        heavens_channel_locations = {**heavens_channel_locations, **locations.heavens_channel_checkpoint_locations}
        jalta_dregs_locations = {**jalta_dregs_locations, **locations.jalta_dregs_checkpoint_locations}
        creacher_cave_locations = {**creacher_cave_locations, **locations.creacher_cave_checkpoint_locations}
        terminal_station_locations = {**terminal_station_locations, **locations.terminal_station_checkpoint_locations}
        abandoned_district_locations = {**abandoned_district_locations, **locations.abandoned_district_checkpoint_locations}
        power_room_locations = {**power_room_locations, **locations.power_room_checkpoint_locations}
        villiths_drain_locations = {**villiths_drain_locations, **locations.villiths_drain_checkpoint_locations}
        false_field_locations = {**false_field_locations, **locations.false_field_checkpoint_locations}
        plateau_underside_locations = {**plateau_underside_locations, **locations.plateau_underside_checkpoint_locations}
        satellite_ranch_locations = {**satellite_ranch_locations, **locations.satellite_ranch_checkpoint_locations}
        sand_hell_locations = {**sand_hell_locations, **locations.sand_hell_checkpoint_locations}
        warp_room_locations = {**warp_room_locations, **locations.warp_room_checkpoint_locations}
        drain_room_locations = {**drain_room_locations, **locations.drain_room_checkpoint_locations}
        ediface_roots_locations = {**ediface_roots_locations, **locations.ediface_roots_checkpoint_locations}
        third_cistern_locations = {**third_cistern_locations, **locations.third_cistern_checkpoint_locations}

    menu_region = create_region(world, "Menu", None)
    mola_town_region = create_region(world, names.mola_town, mola_town_locations)
    belwheat_valley_region = create_region(world, names.belwheat_valley, belwheat_valley_locations)
    gc_warehouse_region = create_region(world, names.gc_warehouse, gc_warehouse_locations)
    entrance_ruins_region = create_region(world, names.entrance_ruins, entrance_ruins_locations)
    goldcherry_factory_region = create_region(world, names.goldcherry_factory, goldcherry_factory_locations)
    cliff_face_region = create_region(world, names.cliff_face, cliff_face_locations)
    forest_cavern_region = create_region(world, names.forest_cavern, forest_cavern_locations)
    eroded_beach_region = create_region(world, names.eroded_beach, eroded_beach_locations)
    port_naga_region = create_region(world, names.port_naga, port_naga_locations)
    basin_21_region = create_region(world, names.basin_21, basin_21_locations)
    pastel_strata_region = create_region(world, names.pastel_strata, pastel_strata_locations)
    astral_tower_region = create_region(world, names.astral_tower, astral_tower_locations)
    precipice_bridge_region = create_region(world, names.precipice_bridge, precipice_bridge_locations)
    terminus_region = create_region(world, names.terminus, terminus_locations)
    heavens_channel_region = create_region(world, names.heavens_channel, heavens_channel_locations)
    jalta_dregs_region = create_region(world, names.jalta_dregs, jalta_dregs_locations)
    creacher_cave_region = create_region(world, names.creacher_cave, creacher_cave_locations)
    terminal_station_region = create_region(world, names.terminal_station, terminal_station_locations)
    abandoned_district_region = create_region(world, names.abandoned_district, abandoned_district_locations)
    power_room_region = create_region(world, names.power_room, power_room_locations)
    villiths_drain_region = create_region(world, names.villiths_drain, villiths_drain_locations)
    false_field_region = create_region(world, names.false_field, false_field_locations)
    plateau_underside_region = create_region(world, names.plateau_underside, plateau_underside_locations)
    satellite_ranch_region = create_region(world, names.satellite_ranch, satellite_ranch_locations)
    sand_hell_region = create_region(world, names.sand_hell, sand_hell_locations)
    warp_room_region = create_region(world, names.warp_room, warp_room_locations)
    drain_room_region = create_region(world, names.drain_room, drain_room_locations)
    ediface_roots_region = create_region(world, names.ediface_roots, ediface_roots_locations)
    third_cistern_region = create_region(world, names.third_cistern, third_cistern_locations)

    world.multiworld.regions += [
        menu_region,
        mola_town_region,
        belwheat_valley_region,
        gc_warehouse_region,
        entrance_ruins_region,
        goldcherry_factory_region,
        cliff_face_region,
        forest_cavern_region,
        eroded_beach_region,
        port_naga_region,
        basin_21_region,
        pastel_strata_region,
        astral_tower_region,
        precipice_bridge_region,
        terminus_region,
        heavens_channel_region,
        jalta_dregs_region,
        creacher_cave_region,
        terminal_station_region,
        abandoned_district_region,
        power_room_region,
        villiths_drain_region,
        false_field_region,
        plateau_underside_region,
        satellite_ranch_region,
        sand_hell_region,
        warp_room_region,
        drain_room_region,
        ediface_roots_region,
        third_cistern_region,
    ]


def connect_regions(world: World) -> None:
    region_names: Dict[str, int] = {}

    # As a note, I'm assuming that for each area after you recieve the knowledge on how to do the Ball and Wavedash,
    # it's a requirement. While this might not be the case, I haven't personally rigerously tested it yet so I'm just
    # going to assume it's needed.

    # Helper Lambdas
    has_a_normal_bat = lambda state: ( # TODO: check if every area is beatable with the phant bat
        (state.has(names.default_bat, world.player) or
         state.has(names.angel_bat, world.player) or
         state.has(names.fizzy_bat, world.player) or
         state.has(names.power_bat, world.player) or
         state.has(names.pink_bat, world.player))
    )

    connect(world, world.player, region_names, "Menu", names.mola_town)

    # Connections from Mola Town
    mola_town_to_jalta_dregs = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.mola_town, names.jalta_dregs, mola_town_to_jalta_dregs)
    mola_town_to_sand_hell = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.jump_block, world.player) and
         state.has(names.master_key, world.player))
    )
    connect(world, world.player, region_names, names.mola_town, names.sand_hell, mola_town_to_sand_hell)
    mola_town_to_warp_room = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.mola_town, names.warp_room, mola_town_to_warp_room)
    # Since the default bat is technically located in Belwheat Valley, we need the condition to be None to
    # prevent softlocks when fixing the bat's location
    connect(world, world.player, region_names, names.mola_town, names.belwheat_valley, None) 

    # Connections from Belwheat Valley
    belwheat_valley_to_gc_warehouse = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player))
    )
    connect(world, world.player, region_names, names.belwheat_valley, names.gc_warehouse, belwheat_valley_to_gc_warehouse)

    # Connections from GC Warehouse
    gc_warehouse_to_entrance_ruins = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player))
    )
    connect(world, world.player, region_names, names.gc_warehouse, names.entrance_ruins, gc_warehouse_to_entrance_ruins)

    # Connections from Entrance Ruin
    entrance_ruins_to_gc_factory = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.entrance_ruins, names.goldcherry_factory, entrance_ruins_to_gc_factory)
    entrance_ruins_to_port_naga = lambda state: ( # Can ride the train from here to Port Naga
        (has_a_normal_bat(state) and
         state.has(names.train_ticket, world.player) and
         state.has(names.master_key, world.player))
    )
    connect(world, world.player, region_names, names.entrance_ruins, names.port_naga, entrance_ruins_to_port_naga)

    # Connections from Goldcherry Factory
    gc_factory_to_cliff_face = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.goldcherry_factory, names.cliff_face, gc_factory_to_cliff_face)
    gc_factory_to_forest_cavern = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.goldcherry_factory, names.forest_cavern, gc_factory_to_forest_cavern)
    # TODO: there is a way to go to ediface from the bottom of gc factory, unsure if it's one way?

    # Connections from Cliff Face
    cliff_face_to_forest_cavern = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.cliff_face, names.forest_cavern, cliff_face_to_forest_cavern)

    # Connections from Forest Cavern
    forest_cavern_to_eroded_beach = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.forest_cavern, names.eroded_beach, forest_cavern_to_eroded_beach)

    # Connections from Eroded Beach
    eroded_beach_to_port_naga = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.eroded_beach, names.port_naga, eroded_beach_to_port_naga)

    # Connections from Port Naga
    port_naga_to_basin_21 = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player))
    )
    connect(world, world.player, region_names, names.port_naga, names.basin_21, port_naga_to_basin_21)

    # Connections from Basin 21
    basin_21_to_pastel_strata = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.basin_21, names.pastel_strata, basin_21_to_pastel_strata)
    basin_21_to_abandoned_district = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player))
    )
    connect(world, world.player, region_names, names.basin_21, names.abandoned_district, basin_21_to_abandoned_district)

    # Connections from Pastel Strata
    pastel_strata_to_astral_tower = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player))
    )
    connect(world, world.player, region_names, names.pastel_strata, names.astral_tower, pastel_strata_to_astral_tower)
    pastel_strata_to_creacher_cave = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.pastel_strata, names.creacher_cave, pastel_strata_to_creacher_cave)

    # Connections from Astral Tower
    astral_tower_to_precipice_bridge = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player))
    )
    connect(world, world.player, region_names, names.astral_tower, names.precipice_bridge, astral_tower_to_precipice_bridge)

    # Connections from Precipice Bridge
    precipice_bridge_to_terminus = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player) and
         state.has(names.charge_block, world.player))
    )
    connect(world, world.player, region_names, names.precipice_bridge, names.terminus, precipice_bridge_to_terminus)
    precipice_bridge_to_villiths_drain = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.precipice_bridge, names.villiths_drain, precipice_bridge_to_villiths_drain)
    precipice_bridge_to_satellite_ranch = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.precipice_bridge, names.satellite_ranch, precipice_bridge_to_satellite_ranch)
    precipice_bridge_to_abandoned_district = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player))
    )
    connect(world, world.player, region_names, names.precipice_bridge, names.abandoned_district, precipice_bridge_to_abandoned_district)

    # Connections from Terminus
    terminus_to_terminal_station = lambda state: (
        has_a_normal_bat(state)
    )
    connect(world, world.player, region_names, names.terminus, names.terminal_station, terminus_to_terminal_station)
    terminus_to_heavens_channel = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player) and
         state.has(names.charge_block, world.player) and
         state.has(names.super_jump_block, world.player))
    )
    connect(world, world.player, region_names, names.terminus, names.heavens_channel, terminus_to_heavens_channel)

    # Connections from Heaven's Channel
    # None

    # Connections from Jalta Dregs
    jalta_dregs_to_ediface_roots = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.roller_blades, world.player))
    )
    connect(world, world.player, region_names, names.jalta_dregs, names.ediface_roots, jalta_dregs_to_ediface_roots)

    # Connections from Creacher Cave
    # None

    # Connections from Terminal Station
    # None
    # TODO: I know you can get here with the train tickets, but I'm unsure at what point in the game and it's
    # TODO: more of a one way trip, so I'm just omitting in and keeping the entrance to be from Terminus

    # Connections from Abandoned District
    abandoned_district_to_power_room = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.charge_block, world.player))
    )
    connect(world, world.player, region_names, names.abandoned_district, names.power_room, abandoned_district_to_power_room)

    # Connections from Power Room
    # None

    # Conncetions from Villith's Drain
    villiths_drain_to_false_field = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player) and
         state.has(names.charge_block, world.player) and
         state.has(names.super_jump_block, world.player) and
         state.has(names.float_block, world.player))
    )
    connect(world, world.player, region_names, names.villiths_drain, names.false_field, villiths_drain_to_false_field)
    villiths_drain_to_drain_room = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.villiths_drain, names.drain_room, villiths_drain_to_drain_room)

    # Connections from False Field
    false_field_to_plateau_underside = lambda state: (
        (has_a_normal_bat(state))
    )
    connect(world, world.player, region_names, names.false_field, names.plateau_underside, false_field_to_plateau_underside)

    # Conncetions from Plateau Underside
    # None

    # Connections from Satellite Ranch
    # None

    # Connections from Sand Hell
    # None

    # Conncetions from Warp Room
    # None

    # Connections from Drain Room
    # None

    # Connections from Ediface Roots
    ediface_roots_to_third_cistern = lambda state: (
        (has_a_normal_bat(state) and
         state.has(names.yellow_fence, world.player) and
         state.has(names.jump_block, world.player) and
         state.has(names.momentum_launcher, world.player) and
         state.has(names.vector_block, world.player) and
         state.has(names.charge_block, world.player) and
         state.has(names.super_jump_block, world.player) and
         state.has(names.float_block, world.player) and
         state.has(names.roller_blades, world.player)
         )
    )
    connect(world, world.player, region_names, names.ediface_roots, names.third_cistern, ediface_roots_to_third_cistern)

    # Connections from Third Cistern
    # None



def create_region(world: World, name: str, location_checks=None):
    ret = BTTHRegion(name, world.player, world.multiworld)
    location_rules = get_location_logic_mapping(world)
    if location_checks:
        for loc_name, loc_id in location_checks.items():
            location = locations.BTTHLocation(world.player, loc_name, loc_id, ret)
            ret.locations.append(location)
            if loc_name in location_rules:
                world.set_rule(location, location_rules[loc_name])

    return ret

def connect(world: World, player: int, used_names: Dict[str, int], source: str, target: str, rule: Optional[Callable] = None):
    source_region = world.multiworld.get_region(source, player)
    target_region = world.multiworld.get_region(target, player)

    if target not in used_names:
        used_names[target] = 1
        name = target
    else:
        used_names[target] += 1
        name = target + (' ' * used_names[target])

    connection = Entrance(player, name, source_region)

    if rule:
        connection.access_rule = rule

    source_region.exits.append(connection)
    connection.connect(target_region)