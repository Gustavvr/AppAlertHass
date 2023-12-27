This is a HammerSpoon (https://www.hammerspoon.org/) Spoon ( an app for HammerSpoon) That will send MAc app states to Home Assistant (https://www.home-assistant.io/).  Thanks to Brendan M. for suggestion the idea that he wanted the background light to change when a Zoom meeting was happening.  I liked this idea and wanted a TPlink light bulb to turn blue to let family know not to disterb me as I was in a meeting.

* Install hammerspoon. Follow set up here: https://www.hammerspoon.org/go/
  * Usinging Terminal cd into: cd ~/.hammerspoon/Spoons/
  * run: git clone git@github.com:Gustavvr/AppAlertHass.spoon.git
  * Get a long lived token from Home Assistant. More Details are below
  * you should now have a hamerspoon icon in your Mac's title bar. Click "Open Config"
  * Add:
```
hs.loadSpoon('AppAlertHass')
-- Leave below unset to send all app states
-- spoon.AppAlertHass.appWatch  = "zoom.us"
-- spoon.AppAlertHass.debug     = true
spoon.AppAlertHass.URL          = 'http://homeassistant.local:8123/api/events/hs_app_event'
spoon.AppAlertHass.bearer_token = ""
spoon.AppAlertHass:start()
```
* save the above
* clcik the hammerspoon icon in the title bar again and click "Reload Config"

Notes: that -- is a comment in lua. so the above line with -- will not be processed. If the -- is removed from the line with
```
spoon.AppAlertHass.appWatch  = "zoom.us"
```
ONLY zoom event will be sent to Home Assistant.

The even name in Home Assistant will be the the last value on the Right in the URL. In this case _hs_app_event_

Un commenting the debug line `spoon.AppAlertHass.debug = true` will give addition information in the HammerSpoon console.  The Console can be found by clicking the hammerspoon icon in the Mac's title bar and selecting "Console"


---
## Getting a long lived Access Token from Home Assistant
Login via web once authenticated click you name in the far bottom left of the screen.
When you profile shows up scroll all the way to the bottom and there will be a section "Long-lived access tokens" click "Long-lived access tokens" give it any name. I woudl suggest somethign like hammerspoon so you know what it is being used for.  Copy the token value inbetween the quotes for _spoon.AppAlertHass.bearer_token = ""_ in the above directions


