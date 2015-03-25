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

    level   = msg.match[1]
    system  = msg.match[2]

    msg.reply "Running a level #{level} diagnostic on #{system}..."

    diagnostics = [
        "She\'s gonna blow!", 
        "#{system}\'s shields are down by 50%!", 
        "All systems are running normally"
    ]

    msg.reply msg.random diagnostics