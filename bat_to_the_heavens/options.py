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

  default = option_clear_game

class FizziesForGoal(Range):
  """
  The number of Fizzy Ice Cream items needed to complete the Goal state when the option "option_clear_game_with_fizzies"
  is enabled. Range between 0 and 20.
  """
  default = 15
  range_start = 0
  range_end = 20

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

class DeathLinkThreshold(Range):
  """
  How many deaths it takes to actually trigger a DeathLink to be sent from you. This setting only matters when DeathLink is enabled.
  """
  default = 5
  range_start = 1
  range_end = 20

BTTHOptionGroups = [
    OptionGroup("Archipelago Options", [
        Goal,
        FizziesForGoal,
        CheckpointSanity,
        FixStartingBatPosition,
        DeathLink,
        DeathLinkThreshold
    ]),
]

@dataclass
class BTTHOptions(PerGameCommonOptions):
  goal: Goal
  fizziesforgoal: FizziesForGoal
  checkpointsanity: CheckpointSanity
  fixstartingbatposition: FixStartingBatPosition
  deathlink: DeathLink
  deathlinkthreshold: DeathLinkThreshold