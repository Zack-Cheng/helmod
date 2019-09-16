require "selector.AbstractSelector"
-------------------------------------------------------------------------------
-- Class to build technology selector
--
-- @module TechnologySelector
-- @extends #AbstractSelector
--

TechnologySelector = newclass(AbstractSelector)

-------------------------------------------------------------------------------
-- After initialization
--
-- @function [parent=#TechnologySelector] afterInit
--
function TechnologySelector:afterInit()
  self.disable_option = true
end

-------------------------------------------------------------------------------
-- Return caption
--
-- @function [parent=#TechnologySelector] getCaption
--
-- @param #Controller parent parent controller
--
function TechnologySelector:getCaption(parent)
  return {"helmod_selector-panel.technology-title"}
end

-------------------------------------------------------------------------------
-- Get prototype
--
-- @function [parent=#TechnologySelector] getPrototype
--
-- @param element
-- @param type
--
-- @return #table
--
function TechnologySelector:getPrototype(element, type)
  return Technology(element, type)
end

-------------------------------------------------------------------------------
-- Update groups
--
-- @function [parent=#TechnologySelector] updateGroups
--
-- @param #LuaEvent event
--
function TechnologySelector:updateGroups(event)
  Logging:trace(self.classname, "updateGroups()", event)

  local list_products = {}
  local list_ingredients = {}

  for key, technology in pairs(Player.getTechnologies()) do
    self:appendGroups(technology, "technology", list_products, list_ingredients)
  end

  Cache.setData(self.classname, "list_products", list_products)
  Cache.setData(self.classname, "list_ingredients", list_ingredients)
end

-------------------------------------------------------------------------------
-- Build prototype tooltip
--
-- @function [parent=#TechnologySelector] buildPrototypeTooltip
--
-- @param #LuaPrototype prototype
--
function TechnologySelector:buildPrototypeTooltip(prototype)
  Logging:trace(self.classname, "buildPrototypeTooltip(prototype)", prototype)
  return ElementGui.getTooltipTechnology(prototype)
end

-------------------------------------------------------------------------------
-- Build prototype icon
--
-- @function [parent=#TechnologySelector] buildPrototypeIcon
--
function TechnologySelector:buildPrototypeIcon(guiElement, prototype, tooltip)
  Logging:trace(self.classname, "buildPrototypeIcon(guiElement, prototype, tooltip:", guiElement, prototype, tooltip)
  ElementGui.addGuiButtonSelectSprite(guiElement, self.classname.."=element-select=ID=technology=", "technology", prototype.name, prototype.name, tooltip)
end





