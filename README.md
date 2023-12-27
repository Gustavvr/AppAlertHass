This is a HammerSpoon (https://www.hammerspoon.org/) Spoon ( an app for HammerSpoon) That will send MAc app states to Home Assistant (https://www.home-assistant.io/).  Thanks to Brendan M. for suggestion the idea that he wanted the background light to change when a Zoom meeting was happening.  I liked this idea and wanted a TPlink light bulb to turn blue to let family know not to disterb me as I was in a meeting.

* Install hammerspoon. Follow set up here: https://www.hammerspoon.org/go/
  * Usinging Termina cd into: cd ~/.hammerspoon/Spoons/
  * run: git clone git@github.com:Gustavvr/AppAlertHass.spoon.git
  * Get a long lived token from Home Assistant. More Details are below
  * you should now have a hamerspoon icon in your Mac's title bar. Click "Open Config"
  * Add:
hs.loadSpoon('AppAlertHass')
-- Leave below unset to send all app states
-- spoon.AppAlertHass.appWatch  = "zoom.us"
-- spoon.AppAlertHass.debug     = true
spoon.AppAlertHass.URL          = 'http://homeassistant.local:8123/api/events/hs_app_event'
spoon.AppAlertHass.bearer_token = ""
spoon.AppAlertHass:start()
* save the above
* clcik the hammerspoon icon in the title bar again and click "Reload Config" 


---
Getting a long lived Access Token from Home Assistant
Login via web once authenticated click you name in the far bottom left of the screen.
When you profile shows up scroll all the way to the bottom and there will be a section "Long-lived access tokens" click "Long-lived access tokens" give it any name. I woudl suggest somethign like hammerspoon so you know what it is being used for.  Copy the token value inbetween the quotes for spoon.AppAlertHass.bearer_token = "" in the above directions
