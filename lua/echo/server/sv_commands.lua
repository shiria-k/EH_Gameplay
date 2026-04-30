Echo = Echo or {}

local function CanUseCommand(ply)
    if not IsValid(ply) then return true end
    if Echo.IsAdminAllowed then return Echo.IsAdminAllowed(ply) end
    return ply:IsAdmin() or ply:IsSuperAdmin()
end

concommand.Add("eh_gameplay_reload", function(ply)
    if not CanUseCommand(ply) then return end

    include("echo/sh_config.lua")
    include("echo/sh_utils.lua")

    if Echo.Notify and IsValid(ply) then
        Echo.Notify(ply, "EH Gameplay wurde neu geladen.")
    end
end)
