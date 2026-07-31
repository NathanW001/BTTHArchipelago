from typing import Dict, NamedTuple, Set
from BaseClasses import Item
from . import names


class ItemData(NamedTuple):
    code: int
    progression: bool = False
    useful: bool = False
    skip_balancing: bool = False


class BTTHItem(Item):
    game = "Bat to the Heavens"

bat_table = {
    names.default_bat: ItemData(0, True, useful=True),
    names.angel_bat: ItemData(1, True, useful=True),
    names.fizzy_bat: ItemData(2, True, useful=True),
    names.phant_bat: ItemData(3, True, useful=True),
    names.power_bat: ItemData(4, True, useful=True),
    names.pink_bat: ItemData(5, True, useful=True),
}

collectable_table = {
    names.fizzy_ice_cream: ItemData(10000, True),
    names.phant: ItemData(10001, True),
    names.postcard_mola_town: ItemData(10002, False),
    names.postcard_belwheat_valley: ItemData(10003, False),
    names.postcard_gc_warehouse: ItemData(10004, False),
    names.postcard_entrance_ruins: ItemData(10005, False),
    names.postcard_gc_factory: ItemData(10006, False),
    names.postcard_forest_cavern: ItemData(10007, False),
    names.postcard_eroded_beach: ItemData(10008, False),
    names.postcard_port_naga: ItemData(10009, False),
    names.postcard_basin_21: ItemData(10010, False),
    names.postcard_pastel_strata: ItemData(10011, False),
    names.postcard_precipice_bridge: ItemData(10012, False),
    names.postcard_villiths_drain: ItemData(10013, False),
    names.butter_card: ItemData(10014, False),
}

equipment_table = {
    names.logbook: ItemData(20000, False, useful=True),
    names.master_key: ItemData(20001, True),
    names.train_ticket: ItemData(20002, True),
    names.roller_blades: ItemData(20003, True, useful=True),
    names.baseball_cap: ItemData(20004, False, useful=True),
    names.ball_power: ItemData(20005, True, useful=True),
    names.wave_dash_power: ItemData(20006, True, useful=True),
}

world_block_table = {
    names.yellow_fence: ItemData(30000, True, useful=True),
    names.jump_block: ItemData(30001, True, useful=True),
    names.momentum_launcher: ItemData(30002, True, useful=True),
    names.vector_block: ItemData(30003, True, useful=True),
    names.charge_block: ItemData(30004, True, useful=True),
    names.super_jump_block: ItemData(30005, True, useful=True),
    names.float_block : ItemData(30006, True, useful=True),
}

filler_table = {
    names.nothing: ItemData(40000, False),
}

trap_table = {
    names.uppie_strike: ItemData(50000, False),
    names.creacher_jumpscare: ItemData(50001, False),
}

item_table = {
    **bat_table,
    **collectable_table,
    **equipment_table,
    **world_block_table,
    **filler_table,
    # **trap_table,
}

lookup_name_to_id: Dict[str, int] = {item_name: data.code for item_name, data in item_table.items()}
lookup_id_to_name: Dict[int, str] = {data.code: item_name for item_name, data in item_table.items() if data.code}