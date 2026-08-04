from typing import Dict, Set
from BaseClasses import Location
from . import names

class BTTHLocation(Location):
    game = "Bat to the Heavens"


# Fizzy Ice Cream Locations
fizzy_ice_cream_locations = {
    names.fizzy_mola_town_1: 1,
	names.fizzy_mola_town_2: 2,
	names.fizzy_belwheat_valley_1: 3,
	names.fizzy_gc_warehouse_1: 4,
	names.fizzy_entrance_ruins_1: 5,
	names.fizzy_entrance_ruins_2: 6,
	names.fizzy_gc_factory_1: 7,
	names.fizzy_gc_factory_2: 8,
	names.fizzy_forest_cavern_1: 9,
	names.fizzy_eroded_beach_1: 10,
	names.fizzy_port_naga_1: 11,
	names.fizzy_port_naga_2: 12,
	names.fizzy_port_naga_3: 13,
	names.fizzy_port_naga_4: 14,
	names.fizzy_basin_21_1: 15,
	names.fizzy_basin_21_2: 16,
	names.fizzy_pastel_strata_1: 17,
	names.fizzy_precipice_bridge_1: 18,
	names.fizzy_precipice_bridge_2: 19,
	names.fizzy_villiths_drain_1: 20,
}

# Postcard Locations
postcard_locations = {
    names.collect_postcard_mola_town: 10000,
	names.collect_postcard_belwheat_valley: 10001,
	names.collect_postcard_gc_warehouse: 10002,
	names.collect_postcard_entrance_ruins: 10003,
	names.collect_postcard_gc_factory: 10004,
	names.collect_postcard_forest_cavern: 10005,
	names.collect_postcard_eroded_beach: 10006,
	names.collect_postcard_port_naga: 10007,
	names.collect_postcard_basin_21: 10008,
	names.collect_postcard_pastel_strata: 10009,
	names.collect_postcard_precipice_bridge: 10010,
	names.collect_postcard_villiths_drain: 10011,
	names.collect_butter_card: 10012,
}

# Phant Locations
phant_locations = {
	names.phant_1: 20000,
	names.phant_2: 20001,
	names.phant_3: 20002,
	names.phant_4: 20003,
	names.phant_5: 20004,
	names.phant_6: 20005,
	names.phant_7: 20006,
}

# Key Item Locations
key_item_locations = {
    names.collect_logbook: 30000,
	names.collect_master_key: 30001,
	names.collect_train_ticket: 30002,
	names.collect_roller_blades: 30003,
	names.collect_baseball_cap: 30004,
}

# Bat Locations
bat_locations = {
    names.collect_default_bat: 40000,
	names.collect_angel_bat: 40001,
	names.collect_fizzy_bat: 40002,
	names.collect_phant_bat: 40003,
	names.collect_power_bat: 40004,
	names.collect_pink_bat: 40005,
}

# Location Visit Locations
location_visit_locations = {
	names.visit_mola_town: 50000,
	names.visit_belwheat_valley: 50001,
	names.visit_gc_warehouse: 50002,
	names.visit_entrance_ruins: 50003,
	names.visit_goldcherry_factory: 50004,
	names.visit_cliff_face: 50005,
	names.visit_forest_cavern: 50006,
	names.visit_eroded_beach: 50007,
	names.visit_port_naga: 50008,
	names.visit_basin_21: 50009,
	names.visit_pastel_strata: 50010,
	names.visit_astral_tower: 50011,
	names.visit_precipice_bridge: 50012,
	names.visit_terminus: 50013,
	names.visit_heavens_channel: 50014,
	names.visit_jalta_dregs: 50015,
	names.visit_creacher_cave: 50016,
	names.visit_terminal_station: 50017,
	names.visit_abandoned_district: 50018,
	names.visit_power_room: 50019,
	names.visit_villiths_drain: 50020,
	names.visit_false_field: 50021,
	names.visit_plateau_underside: 50022,
	names.visit_satellite_ranch: 50023,
	names.visit_sand_hell: 50024,
	names.visit_warp_room: 50025,
	names.visit_drain_room: 50026,
	names.visit_ediface_roots: 50027,
	names.visit_third_cistern: 50028,
}

# Checkpoint Locations
checkpoint_loctations = {
    names.checkpoint_0_mola_town: 60000,
	names.checkpoint_1_mola_town: 60001,
	names.checkpoint_1_belwheat_valley: 60002,
	names.checkpoint_2_belwheat_valley: 60003,
	names.checkpoint_3_belwheat_valley: 60004,
	names.checkpoint_4_belwheat_valley: 60005,
	names.checkpoint_1_gc_warehouse: 60006,
	names.checkpoint_2_gc_warehouse: 60007,
	names.checkpoint_3_gc_warehouse: 60008,
	names.checkpoint_4_gc_warehouse: 60009,
	names.checkpoint_5_gc_warehouse: 60010,
	names.checkpoint_6_gc_warehouse: 60011,
	names.checkpoint_1_entrance_ruins: 60012,
	names.checkpoint_2_entrance_ruins: 60013,
	names.checkpoint_3_entrance_ruins: 60014,
	names.checkpoint_1_gc_factory: 60015,
	names.checkpoint_2_gc_factory: 60016,
	names.checkpoint_3_gc_factory: 60017,
	names.checkpoint_4_gc_factory: 60018,
	names.checkpoint_5_gc_factory: 60019,
	names.checkpoint_6_gc_factory: 60020,
	names.checkpoint_1_forest_cavern: 60021,
	names.checkpoint_2_forest_cavern: 60022,
	names.checkpoint_3_forest_cavern: 60023,
	names.checkpoint_4_forest_cavern: 60024,
	names.checkpoint_5_forest_cavern: 60025,
	names.checkpoint_1_eroded_beach: 60026,
	names.checkpoint_2_eroded_beach: 60027,
	names.checkpoint_3_eroded_beach: 60028,
	names.checkpoint_4_eroded_beach: 60029,
	names.checkpoint_5_eroded_beach: 60030,
	names.checkpoint_6_eroded_beach: 60031,
	names.checkpoint_1_port_naga: 60032,
	names.checkpoint_2_port_naga: 60033,
	names.checkpoint_1_basin_21: 60034,
	names.checkpoint_2_basin_21: 60035,
	names.checkpoint_3_basin_21: 60036,
	names.checkpoint_4_basin_21: 60037,
	names.checkpoint_5_basin_21: 60038,
	names.checkpoint_6_basin_21: 60039,
	names.checkpoint_7_basin_21: 60040,
	names.checkpoint_1_pastel_strata: 60041,
	names.checkpoint_2_pastel_strata: 60042,
	names.checkpoint_3_pastel_strata: 60043,
	names.checkpoint_4_pastel_strata: 60044,
	names.checkpoint_5_pastel_strata: 60045,
	names.checkpoint_6_pastel_strata: 60046,
	names.checkpoint_7_pastel_strata: 60047,
	names.checkpoint_8_pastel_strata: 60048,
	names.checkpoint_9_pastel_strata: 60049,
	names.checkpoint_1_precipice_bridge: 60050,
	names.checkpoint_2_precipice_bridge: 60051,
	names.checkpoint_3_precipice_bridge: 60052,
	names.checkpoint_4_precipice_bridge: 60053,
	names.checkpoint_5_precipice_bridge: 60054,
	names.checkpoint_6_precipice_bridge: 60055,
	names.checkpoint_7_precipice_bridge: 60056,
	names.checkpoint_8_precipice_bridge: 60057,
	names.checkpoint_9_precipice_bridge: 60058,
	names.checkpoint_1_terminus: 60059,
	names.checkpoint_2_terminus: 60060,
	names.checkpoint_1_villiths_drain: 60061,
	names.checkpoint_2_villiths_drain: 60062,
	names.checkpoint_3_villiths_drain: 60063,
	names.checkpoint_4_villiths_drain: 60064,
	names.checkpoint_5_villiths_drain: 60065,
	names.checkpoint_6_villiths_drain: 60066,
	names.checkpoint_7_villiths_drain: 60067,
	names.checkpoint_8_villiths_drain: 60068,
	names.checkpoint_9_villiths_drain: 60069,
	names.checkpoint_10_villiths_drain: 60070,
	names.checkpoint_0_plateau_underside: 60071,
	names.checkpoint_0_ediface_roots: 60072,
	names.checkpoint_1_ediface_roots: 60073,
	names.checkpoint_2_ediface_roots: 60074,
	names.checkpoint_3_ediface_roots: 60075,
	names.checkpoint_4_ediface_roots: 60076,
	names.checkpoint_5_ediface_roots: 60077,
	names.checkpoint_6_ediface_roots: 60078,
	names.checkpoint_7_ediface_roots: 60079,
	names.checkpoint_8_ediface_roots: 60080,
	names.checkpoint_9_ediface_roots: 60081,
}

all_locations = {
    **fizzy_ice_cream_locations,
    **postcard_locations,
    **phant_locations,
    **key_item_locations,
    **bat_locations,
    **location_visit_locations,
    **checkpoint_loctations,
}

# Locations by Region
mola_town_locations = {
    names.fizzy_mola_town_1: 1,
	names.fizzy_mola_town_2: 2,
    names.collect_postcard_mola_town: 10000,
    names.collect_logbook: 30000,
    names.visit_mola_town: 50000,
}
mola_town_checkpoint_locations = {
    names.checkpoint_0_mola_town: 60000,
	names.checkpoint_1_mola_town: 60001,
}
belwheat_valley_locations = {
    names.fizzy_belwheat_valley_1: 3,
    names.collect_postcard_belwheat_valley: 10001,
	names.collect_default_bat: 40000,
    names.visit_belwheat_valley: 50001,
}
belwheat_valley_checkpoint_locations = {
	names.checkpoint_1_belwheat_valley: 60002,
	names.checkpoint_2_belwheat_valley: 60003,
	names.checkpoint_3_belwheat_valley: 60004,
	names.checkpoint_4_belwheat_valley: 60005,
}
gc_warehouse_locations = {
	names.fizzy_gc_warehouse_1: 4,
	names.collect_postcard_gc_warehouse: 10002,
    names.visit_gc_warehouse: 50002,
}
gc_warehouse_checkpoint_locations = {
	names.checkpoint_1_gc_warehouse: 60006,
	names.checkpoint_2_gc_warehouse: 60007,
	names.checkpoint_3_gc_warehouse: 60008,
	names.checkpoint_4_gc_warehouse: 60009,
	names.checkpoint_5_gc_warehouse: 60010,
	names.checkpoint_6_gc_warehouse: 60011,
}
entrance_ruins_locations = {
	names.fizzy_entrance_ruins_1: 5,
	names.fizzy_entrance_ruins_2: 6,
    names.collect_postcard_entrance_ruins: 10003,
    names.visit_entrance_ruins: 50003,
}
entrance_ruins_checkpoint_locations = {
	names.checkpoint_1_entrance_ruins: 60012,
	names.checkpoint_2_entrance_ruins: 60013,
	names.checkpoint_3_entrance_ruins: 60014,
}
goldcherry_factory_locations = {
	names.fizzy_gc_factory_1: 7,
	names.fizzy_gc_factory_2: 8,
    names.collect_postcard_gc_factory: 10004,
	names.collect_master_key: 30001,
	names.collect_train_ticket: 30002,
	names.visit_goldcherry_factory: 50004,
}
goldcherry_factory_checkpoint_locations = {
	names.checkpoint_1_gc_factory: 60015,
	names.checkpoint_2_gc_factory: 60016,
	names.checkpoint_3_gc_factory: 60017,
	names.checkpoint_4_gc_factory: 60018,
	names.checkpoint_5_gc_factory: 60019,
	names.checkpoint_6_gc_factory: 60020,
}
cliff_face_locations = {
    names.phant_1: 20000,
    names.visit_cliff_face: 50005,
}
cliff_face_checkpoint_locations = {
    
}
forest_cavern_locations = {
	names.fizzy_forest_cavern_1: 9,
    names.collect_postcard_forest_cavern: 10005,
    names.visit_forest_cavern: 50006,
}
forest_cavern_checkpoint_locations = {
	names.checkpoint_1_forest_cavern: 60021,
	names.checkpoint_2_forest_cavern: 60022,
	names.checkpoint_3_forest_cavern: 60023,
	names.checkpoint_4_forest_cavern: 60024,
	names.checkpoint_5_forest_cavern: 60025,
}
eroded_beach_locations = {
	names.fizzy_eroded_beach_1: 10,
    names.collect_postcard_eroded_beach: 10006,
	names.phant_2: 20001,
    names.visit_eroded_beach: 50007,
}
eroded_beach_checkpoint_locations = {
	names.checkpoint_1_eroded_beach: 60026,
	names.checkpoint_2_eroded_beach: 60027,
	names.checkpoint_3_eroded_beach: 60028,
	names.checkpoint_4_eroded_beach: 60029,
	names.checkpoint_5_eroded_beach: 60030,
	names.checkpoint_6_eroded_beach: 60031,
}
port_naga_locations = {
    names.fizzy_port_naga_1: 11,
	names.fizzy_port_naga_2: 12,
	names.fizzy_port_naga_3: 13,
	names.fizzy_port_naga_4: 14,
	names.collect_postcard_port_naga: 10007,
    names.collect_fizzy_bat: 40002,
    names.visit_port_naga: 50008,
}
port_naga_checkpoint_locations = {
	names.checkpoint_1_port_naga: 60032,
	names.checkpoint_2_port_naga: 60033,
}
basin_21_locations = {
	names.fizzy_basin_21_1: 15,
	names.fizzy_basin_21_2: 16,
    names.collect_postcard_basin_21: 10008,
	names.phant_3: 20002,
	names.phant_4: 20003,
    names.collect_roller_blades: 30003,
    names.visit_basin_21: 50009,
}
basin_21_checkpoint_locations = {
	names.checkpoint_1_basin_21: 60034,
	names.checkpoint_2_basin_21: 60035,
	names.checkpoint_3_basin_21: 60036,
	names.checkpoint_4_basin_21: 60037,
	names.checkpoint_5_basin_21: 60038,
	names.checkpoint_6_basin_21: 60039,
	names.checkpoint_7_basin_21: 60040,
}
pastel_strata_locations = {
	names.fizzy_pastel_strata_1: 17,
    names.collect_postcard_pastel_strata: 10009,
	names.phant_5: 20004,
    names.collect_phant_bat: 40003,
	names.visit_pastel_strata: 50010,
}
pastel_strata_checkpoint_locations = {
	names.checkpoint_1_pastel_strata: 60041,
	names.checkpoint_2_pastel_strata: 60042,
	names.checkpoint_3_pastel_strata: 60043,
	names.checkpoint_4_pastel_strata: 60044,
	names.checkpoint_5_pastel_strata: 60045,
	names.checkpoint_6_pastel_strata: 60046,
	names.checkpoint_7_pastel_strata: 60047,
	names.checkpoint_8_pastel_strata: 60048,
	names.checkpoint_9_pastel_strata: 60049,
}
astral_tower_locations = {
    names.visit_astral_tower: 50011,
}
astral_tower_checkpoint_locations = {
    
}
precipice_bridge_locations = {
	names.fizzy_precipice_bridge_1: 18,
	names.fizzy_precipice_bridge_2: 19,
    names.collect_postcard_precipice_bridge: 10010,
    names.visit_precipice_bridge: 50012,
}
precipice_bridge_checkpoint_locations = {
	names.checkpoint_1_precipice_bridge: 60050,
	names.checkpoint_2_precipice_bridge: 60051,
	names.checkpoint_3_precipice_bridge: 60052,
	names.checkpoint_4_precipice_bridge: 60053,
	names.checkpoint_5_precipice_bridge: 60054,
	names.checkpoint_6_precipice_bridge: 60055,
	names.checkpoint_7_precipice_bridge: 60056,
	names.checkpoint_8_precipice_bridge: 60057,
	names.checkpoint_9_precipice_bridge: 60058,
}
terminus_locations = {
    names.visit_terminus: 50013,
}
terminus_checkpoint_locations = {
	names.checkpoint_1_terminus: 60059,
	names.checkpoint_2_terminus: 60060,
}
heavens_channel_locations = {
    names.collect_angel_bat: 40001,
    names.visit_heavens_channel: 50014,
}
heavens_channel_checkpoint_locations = {
    
}
jalta_dregs_locations = {
    names.collect_butter_card: 10012,
    names.phant_6: 20005,
	names.phant_7: 20006,
    names.visit_jalta_dregs: 50015,
}
jalta_dregs_checkpoint_locations = {

}
creacher_cave_locations = {
    names.visit_creacher_cave: 50016,
}
creacher_cave_checkpoint_locations = {
    
}
terminal_station_locations = {
    names.visit_terminal_station: 50017,
}
terminal_station_checkpoint_locations = {

}
abandoned_district_locations = {
    names.visit_abandoned_district: 50018,
}
abandoned_district_checkpoint_locations = {
    
}
power_room_locations = {
    names.collect_power_bat: 40004,
    names.visit_power_room: 50019,
}
power_room_checkpoint_locations = {

}
villiths_drain_locations = {
    names.fizzy_villiths_drain_1: 20,
    names.collect_postcard_villiths_drain: 10011,
    names.collect_pink_bat: 40005,
    names.visit_villiths_drain: 50020,
}
villiths_drain_checkpoint_locations = {
	names.checkpoint_1_villiths_drain: 60061,
	names.checkpoint_2_villiths_drain: 60062,
	names.checkpoint_3_villiths_drain: 60063,
	names.checkpoint_4_villiths_drain: 60064,
	names.checkpoint_5_villiths_drain: 60065,
	names.checkpoint_6_villiths_drain: 60066,
	names.checkpoint_7_villiths_drain: 60067,
	names.checkpoint_8_villiths_drain: 60068,
	names.checkpoint_9_villiths_drain: 60069,
	names.checkpoint_10_villiths_drain: 60070,
}
false_field_locations = {
    names.visit_false_field: 50021,
}
false_field_checkpoint_locations = {
    
}
plateau_underside_locations = {
    names.visit_plateau_underside: 50022,
}
plateau_underside_checkpoint_locations = {
	names.checkpoint_0_plateau_underside: 60071,
}
satellite_ranch_locations = {
    names.visit_satellite_ranch: 50023,
}
satellite_ranch_checkpoint_locations = {
    
}
sand_hell_locations = {
	names.visit_sand_hell: 50024,
}
sand_hell_checkpoint_locations = {
	
}
warp_room_locations = {
	names.visit_warp_room: 50025,
}
warp_room_checkpoint_locations = {
    
}
drain_room_locations = {
    names.visit_drain_room: 50026,
}
drain_room_checkpoint_locations = {
    
}
ediface_roots_locations = {
    names.visit_ediface_roots: 50027,
}
ediface_roots_checkpoint_locations = {
	names.checkpoint_0_ediface_roots: 60072,
	names.checkpoint_1_ediface_roots: 60073,
	names.checkpoint_2_ediface_roots: 60074,
	names.checkpoint_3_ediface_roots: 60075,
	names.checkpoint_4_ediface_roots: 60076,
	names.checkpoint_5_ediface_roots: 60077,
	names.checkpoint_6_ediface_roots: 60078,
	names.checkpoint_7_ediface_roots: 60079,
	names.checkpoint_8_ediface_roots: 60080,
	names.checkpoint_9_ediface_roots: 60081,
}
third_cistern_locations = {
    names.collect_baseball_cap: 30004,
    names.visit_third_cistern: 50028,
}
third_cistern_checkpoint_locations = {
    
}

all_locations_by_region = {
	**mola_town_locations, **mola_town_checkpoint_locations,
	**belwheat_valley_locations, **belwheat_valley_checkpoint_locations,
	**gc_warehouse_locations, **gc_warehouse_checkpoint_locations,
	**entrance_ruins_locations, **entrance_ruins_checkpoint_locations,
	**goldcherry_factory_locations, **goldcherry_factory_checkpoint_locations,
	**cliff_face_locations, **cliff_face_checkpoint_locations,
	**forest_cavern_locations, **forest_cavern_checkpoint_locations,
	**eroded_beach_locations, **eroded_beach_checkpoint_locations,
	**port_naga_locations, **port_naga_checkpoint_locations,
	**basin_21_locations, **basin_21_checkpoint_locations,
	**pastel_strata_locations, **pastel_strata_checkpoint_locations,
	**astral_tower_locations, **astral_tower_checkpoint_locations,
	**precipice_bridge_locations, **precipice_bridge_checkpoint_locations,
	**terminus_locations, **terminus_checkpoint_locations,
	**heavens_channel_locations, **heavens_channel_checkpoint_locations,
	**jalta_dregs_locations, **jalta_dregs_checkpoint_locations,
	**creacher_cave_locations, **creacher_cave_checkpoint_locations,
	**terminal_station_locations, **terminal_station_checkpoint_locations,
	**abandoned_district_locations, **abandoned_district_checkpoint_locations,
	**power_room_locations, **power_room_checkpoint_locations,
	**villiths_drain_locations, **villiths_drain_checkpoint_locations,
	**false_field_locations, **false_field_checkpoint_locations,
	**plateau_underside_locations, **plateau_underside_checkpoint_locations,
	**satellite_ranch_locations, **satellite_ranch_checkpoint_locations,
	**sand_hell_locations, **sand_hell_checkpoint_locations,
	**warp_room_locations, **warp_room_checkpoint_locations,
	**drain_room_locations, **drain_room_checkpoint_locations,
	**ediface_roots_locations, **ediface_roots_checkpoint_locations,
	**third_cistern_locations, **third_cistern_checkpoint_locations,
}

assert all_locations == all_locations_by_region

lookup_location_to_id: Dict[str, int] = {location: idx for location, idx in all_locations.items() if idx is not None}
lookup_id_to_location: Dict[int, str] = {idx: location for location, idx in all_locations.items() if idx is not None}