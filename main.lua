local Workspace = game:GetService('Workspace')
local Camera = Workspace.CurrentCamera
local worldToViewportPoint = Camera.worldToViewportPoint


shared.VapeIndependent = true
shared.CustomSaveVape = "name of file to save"
local GuiLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua', true))()


local Combat = GuiLibrary.ObjectsThatCanBeSaved.CombatWindow.Api
local Blatant = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api
local Render = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api
local Utility = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api
local World = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api



Render.CreateOptionsButton({
    Name = 'ItemESP',
    Function = function(callback)
        if callback then
            while callback and task.wait(1) do
                local a = Workspace:getDescendants()
                local items = {}


                --- First Check
                for i = 1, #a do
                    if a[i].Name == 'ItemPickupScript' and a[i].Parent:findFirstChild('ClickDetector') then
                        table.insert(items, a[i].Parent)
                    end
                end


                for i = 1, #items do
                    local BoxOutline = Drawing.new('Square')
                    BoxOutline.Visible = false
                    BoxOutline.Color = Color3.new(1, 1, 1)
                    BoxOutline.Thickness = 3
                    BoxOutline.Transparency = 1
                    BoxOutline.Filled = false





                    local Vector, onScreen = worldToViewportPoint(Camera, items[i].Position)



                    if onScreen then
                        BoxOutline.Size = Vector2.new(1000 / Vector.Z, Vector.Y - (Vector.Y - 1))
                        BoxOutline.Position = Vector2.new(Vector.X - BoxOutline.Size.X / 2, Vector.Y - BoxOutline.Size.Y / 2)
                        BoxOutline.Visible = true
                    else
                        BoxOutline.Visible = false
                    end
                end



                BoxOutline:Destroy()
            end
        end
    end,
    HoverText = 'Apply ESP to Items',
    Default = false
})
