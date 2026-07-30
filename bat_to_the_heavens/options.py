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

class RandomizeStartingBat(Toggle): # TODO: maybe retool to force early rather than randomize
  """
  Randomizes the Starting Bat and disables the ability to recieve the Pink Bat from getting softlocked.
  """
  display_name = "Randomize Starting Bat"

class RandomizeBall(Toggle):
  """
  Randomizes the ability to turn into a ball.
  """
  display_name = "Randomize Ball"

class RandomizeWaveDash(Toggle):
  """
  Randomizes the ability to wavedash.
  """
  display_name = "Randomize Wave Dash"

BTTHOptionGroups = [
    OptionGroup("Archipelago Options", [
        Goal,
        CheckpointSanity,
        RandomizeStartingBat,
        RandomizeBall,
        RandomizeWaveDash,
        DeathLink
    ]),
]

@dataclass
class BTTHOptions(PerGameCommonOptions):
  goal: Goal
  checkpointsanity: CheckpointSanity
  ranomizestartingbat: RandomizeStartingBat
  randomizeball: RandomizeBall
  randomizewavedash: RandomizeWaveDash
  deathlink: DeathLink