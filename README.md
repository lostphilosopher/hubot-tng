# Star Trek TNG-esque Messages for Hubot

## Usage instructions:
1. Copy `tng-hubot.coffee` into your Hubot's `scripts/` directory.
2. Restart your Hubot: `sudo restart hubot`.
3. Run a Hubot command.

## Supported commands:
- `@hubot: run a level [level: 1-5] diagnostic on [system]`.
-- Hubot will pretend to preform a diagnostic and give you a message based on your system and diagnostic level.
- `@hubot: shields [command: up, down, status]`.
-- Hubot will raise or lower the sheilds, or give you a report of their current status.
- `@hubot: fire [command: phasers, photon torpedoes] at [target]`.
-- Hubot will tell you it fired what you selected, and will give your a message about whether or not it was successful

###Hat tips:
- [Memory Alpha Diagnostic Mode Description](http://en.memory-alpha.org/wiki/Diagnostic_mode)
- [Hubot how to](https://hubot.github.com/docs/)
- [Hubot scripts how to](https://hubot.github.com/docs/scripting/)
- [Coffeescript / JavaScript converter](http://js2.coffee/)
- [rudidude86 for calling these sections "hat tips"](https://github.com/rudidude86)