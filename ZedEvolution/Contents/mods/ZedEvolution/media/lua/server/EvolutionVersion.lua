ZedEvolution = ZedEvolution or {}

-- Invert the cap if it's default and doesn't make sense with the provided factor.
local function maybeInvert(name, default, new) 
  if SandboxVars.ZedEvolution[name .. 'Limit'] == default 
    and SandboxVars.ZedEvolution.Factor * SandboxVars.ZedEvolution[name] < 0 then 
    SandboxVars.ZedEvolution[name .. 'Limit'] = new
  end
end

-- Calculate caps based on evolution factor being positive / negative.
-- Evolution caps were introduced in v2, so we need to account for them to keep devolution compatible.
local function updateFromV1 ()
  local vars = SandboxVars.ZedEvolution
  maybeInvert('Speed', 1, 3)
  maybeInvert('Strength', 1, 3)
  maybeInvert('Toughness', 1, 3)
  maybeInvert('Transmission', 1, 3)
  maybeInvert('Cognition', 1, 3)
  maybeInvert('Crawl', 7, 1)
  maybeInvert('Memory', 1, 4)
  maybeInvert('Sight', 1, 3)
  maybeInvert('Hearing', 1, 3)
  getSandboxOptions():updateFromLua()
  return 2
end

-- Update the way the moddata / sandboxvars are stored to fit the current version of the mod.
ZedEvolution.updateVersion = {
  v1 = updateFromV1
}
