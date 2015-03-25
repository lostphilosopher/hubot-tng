# Description:
#   TNG Esque Diagnostic messages
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot run a level <level> diagnostic on <system> - hubot pretends to run the diagnostic and gives you a random response
#
# Notes:
#   None
#
# Author:
#   lostphilosopher

module.exports = (robot) ->

  robot.respond /run a level (.*) diagnostic on (.*)/i, (msg) ->

    level             = msg.match[1]
    system            = msg.match[2]
    levelInt          = ~~Number(msg.match[1])
    systemCapitalized = system.charAt(0).toUpperCase() + system.slice(1)

    # Verify that level is an integer between 1 and 5
    if !(String(levelInt) == level && 1 <= levelInt <= 5)
      msg.reply "I\'m sorry, I do not recognize level #{level}. Please specify a level between 1 and 5."
      return

    msg.reply "Running a level #{level} diagnostic on #{system}..."

    # Diagnostic responses of decreasing severity
    diagnostics = [
      [
        "She's gonna blow!", 
        "#{systemCapitalized}'s reactor is overloading!", 
        "All systems are running normally."    
      ],
      [
        "One minute until #{system}'s radiation levels become fatal!", 
        "#{systemCapitalized}'s shields are down by 95%!", 
        "All systems are running normally."      
      ],
      [
        "#{systemCapitalized} appears inoperative.", 
        "#{systemCapitalized}'s shields are down by 50%!", 
        "All systems are running normally."      
      ],
      [
        "There's a plasma residue coating #{system}.",
        "#{systemCapitalized}'s shields are down by 5%.", 
        "All systems are running normally."      
      ],
      [
        "There's a minor neutrino build up on #{system}.", 
        "#{systemCapitalized}'s radiation levels are within safe parameters.", 
        "All systems are running normally."
      ]
    ]

    msg.reply msg.random diagnostics[levelInt - 1]
