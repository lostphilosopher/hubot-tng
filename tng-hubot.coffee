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

  shieldStatus = "down"

  # TNG Diagnostics
  robot.respond /run a level (.*) diagnostic on (.*)/i, (msg) ->

    level             = msg.match[1]
    system            = msg.match[2]
    levelInt          = ~~Number(msg.match[1])
    systemCapitalized = system.charAt(0).toUpperCase() + system.slice(1)

    # Verify that level is an integer between 1 and 5
    if !(String(levelInt) == level && 1 <= levelInt <= 5)
      msg.reply "Bleep blorp! I\'m sorry, I do not recognize level #{level}. Please specify a level between 1 and 5."
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

  # TNG Sheild Status
  robot.respond /shields (.*)/i, (msg) ->

    command = String(msg.match[1])

    if command == 'up'
      shieldStatus = 'up'
      msg.reply "Raising shields!"

    if command == 'down'
      shieldStatus = 'down'
      msg.reply "Dropping the shields."  

    if command == 'status'
      msg.reply "Shields are #{shieldStatus}"

  # TNG Phasers and Photon Torpedoes
  robot.respond /fire (.*) at (.*)/i, (msg) ->

    command           = String(msg.match[1])
    target            = String(msg.match[2])
    targetCapitalized = target.charAt(0).toUpperCase() + target.slice(1)

    fireReport = [
      "It's a miss.",
      "#{targetCapitalized} hit, no damage!",
      "#{targetCapitalized} hit, minor damage to #{target}'s forward hull.",
      "#{targetCapitalized} hit, #{target}'s shields are crippled!",
      "#{targetCapitalized} destroyed!"
    ]

    if command == "phasers" || command == "photon torpedoes" 
      if command == "phasers"
        msg.reply "Firing phasers!"
        msg.reply "Woo-ooo-woo-ooo-woo-ooo!"

      if command == "photon torpedoes"
        msg.reply "Firing photon torpedoes!"
        msg.reply "Phew! Phew!"

      msg.reply msg.random fireReport
