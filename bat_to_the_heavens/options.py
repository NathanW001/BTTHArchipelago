from Options import Choice, Toggle, DefaultOnToggle, OptionGroup, PerGameCommonOptions, Range, Toggle, DeathLink
from dataclasses import dataclass

class Goal(Choice):
  """
  The goal required to complete the run in Archipelago.
  clear_game: Clear the game as intended by dunking in Terminus.
  clear_game_with_fizzies: Same as the previous, but you cannot dunk until you have a minimum amount of Fizzy Ice Creams.
  all_checkpoints: Activate every checkpoint to clear the game.
  """
  display_name = "Goal"
  option_clear_game = 0
  option_clear_game_with_fizzies = 1
  option_all_checkpoints = 2

class CheckpointSanity(DefaultOnToggle):
  """
  This includes checkpoints as location checks.
  This adds 82 location checks to the world.
  """
  display_name = "CheckpointSanity"

class FixStartingBatPosition(Toggle):
  """
  Fixes the position of the Default Bat to always be in the same position.
  """
  display_name = "Fix Starting Bat Position"

BTTHOptionGroups = [
    OptionGroup("Archipelago Options", [
        Goal,
        CheckpointSanity,
        FixStartingBatPosition,
        DeathLink
    ]),
]

@dataclass
class BTTHOptions(PerGameCommonOptions):
  goal: Goal
  checkpointsanity: CheckpointSanity
  fixstartingbatposition: FixStartingBatPosition
  deathlink: DeathLink