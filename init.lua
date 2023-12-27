print('Starting AppAlertHass...')

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "AppAlertHass"
obj.version = "0.1"
obj.author = "Gustav von Roth <gustav@vonRoth.com>"
obj.homepage = "https://github.com/gvonroth/hammerspoon-AppAlertHass"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- Set Defaults
obj.base_URL = 'http://homeassistant.local:8123/api/events/hs_app_event'
obj.bearer_token = 'none'
obj.appWatch = nil 
obj.app_states= {"launching", "launched", "terminated", "hidden", "unhidden", "activated", "deactivated"}
obj.debug = nil 

function obj:AppAlertHass(appName, eventType, appObject)
  if self.debug then
    print("App Name: " .. appName .. " - " .. obj.app_states[eventType+1] .. " - " .. eventType)
    print(self.base_URL)
  end
  if obj.appWatch == nil then
    code, resp, resp_head = hs.http.post(self.base_URL, '{"appName":"'..appName..'", "eventType":"'..obj.app_states[eventType+1]..'", "eventNum":'..eventType..'}', {["Content-Type"] = "application/json", ["Authorization"] = "Bearer "..self.bearer_token })
    if self.debug then
      print("HTTP status code: " .. code)
      print("HTTP response   : " .. resp)
    end
  elseif obj.appWatch == appName then
      code, resp, resp_head = hs.http.post(self.base_URL, '{"appName":"'..appName..'", "eventType":"'..obj.app_states[eventType+1]..'", "eventNum":'..eventType..'}', {["Content-Type"] = "application/json", ["Authorization"] = "Bearer "..self.bearer_token })
      if self.debug then
	print("HTTP status code: " .. code)
        print("HTTP response   : " .. resp)      
      end
  end   
end


function obj:start()
  HTTP_header = { ["Content-Type"]  = "application/json",
                ["Authorization"] =  self.bearer_token,
              }
  appWatcher = hs.application.watcher.new(function(appName, eventType, appObject) self:AppAlertHass(appName, eventType, appObject) end)
  appWatcher:start()
end

return obj
