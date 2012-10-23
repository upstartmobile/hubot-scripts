# Description:
#   Email from hubot to any address
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot email <user@email.com> -s <subject> -m <message> - Sends email with the <subject> <message> to address <user@email.com>
#
# Author:
#   earlonrails
#
# Additional Requirements
#   unix mail client installed on the system

util = require 'util'
child_process = require 'child_process'
exec = child_process.exec

module.exports = (robot) ->
  emailTime = null
  sendEmail = (addresses, subject, msg) ->
    mailCommand = """echo '#{msg}' | mail -s '#{subject}' '#{addresses}'"""
    exec mailCommand, (error, stdout, stderr) ->
      util.print 'stdout: ' + stdout
      util.print 'stderr: ' + stderr

  robot.respond /email (.*) -s (.*) -m (.*)/i, (msg) ->
    sendEmail msg.match[1], msg.match[2], msg.match[3]
    msg.send "Email Sent"
