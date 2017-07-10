# coding: utf-8

# A deep inspiration for AI.
#
# by Martin Bagge / brother <brother@bsnet.se>
#
# License: WTFPL

require 'open-uri'

class InspiroRbot < Plugin

   def inspire(m, params)
     if !params[:user]
       params[:user] = m.sourcenick
     end
     uname = params[:user]

     url = open("http://inspirobot.me/api?generate=true").read()
     if url.length
       url.strip!
       outstring = uname + ": " + url
       if uname != m.sourcenick
         outstring += "hälsningar från " + m.sourcenick
       else
         outstring += "<3"
       end
       @bot.say(m.channel, outstring)
     else
       @bot.say("brother", "inspirobot failed...")
     end
   end

end

trg = InspiroRbot.new
trg.map "inspire", :action => "inspire"
trg.map "inspire :user", :action => "inspire"
