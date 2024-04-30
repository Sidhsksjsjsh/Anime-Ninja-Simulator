local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("TEST")

local var = {
  event = false,
  funct = false,
  req = {},
  rel = {}
}

T1:Toggle("Trigger Reliable RemoteEvent",false,function(value)
    var.event = value
    while wait() do
      if var.event == false then break end
      game:GetService("ReplicatedStorage")["SrcLib"]["Bridge"]["Index"]["Event"]["Reliable"]:FireServer(unpack(var.rel))
    end
end)

T1:Toggle("Trigger Request RemoteEvent",false,function(value)
    var.funct = value
    while wait() do
      if var.funct == false then break end
      game:GetService("ReplicatedStorage")["SrcLib"]["Bridge"]["Index"]["Event"]["Request"]:FireServer(unpack(var.req))
    end
end)

lib:HookFunction(function(method,self,args)
    if method == "FireServer" and self == "Reliable" then
      var.rel = args
    elseif method == "FireServer" and self == "Request" then
      var.req = args
    end
end)
