PROPERTIES = {ModeSleep=0, ModeSpoon=0, ModeNightTheme=0, ModeNightStart=0, ModeNightEnd=0}

local mode_sleep = false
local mode_sleep_on = false

local mode_spoon = false
local mode_spoon_on = false

local mode_night_theme = false
local mode_night_theme_on = false

local mode_night_start = 0
local mode_night_end = 0

-- Function to read values from PROPERTIES
function ReadBool (value)
  if (value == "1") or (value == "true") then
    return true
  end
  return false
end

-- Called on skin load
function Initialize()
  -- Variables
  mode_night_theme_on = ReadBool(PROPERTIES.ModeNightTheme)
  mode_sleep_on = ReadBool(PROPERTIES.ModeSleep)
  mode_spoon_on = ReadBool(PROPERTIES.ModeSpoon)

  mode_night_start = tonumber(PROPERTIES.ModeNightStart)
  mode_night_end = tonumber(PROPERTIES.ModeNightEnd)
end

-- Check night hours
function NightHours(time)
  if mode_night_start > mode_night_end then
    if time.hour >= mode_night_start or time.hour <= mode_night_end then
      return true
    end
  elseif mode_night_start < mode_night_end then
    if mode_night_start <= time.hour and time.hour <= mode_night_end then
      return true
    end
  end
  return false
end

-- Called every second
function Update()
  -- Variables
  time = os.date('*t')

  -- Arm rotation
  SKIN:Bang('!SetOption', 'CharMinHand', 'StartAngle', math.rad(-75 + (1.5 * SKIN:GetMeasure('MeterPercentage'):GetValue())))

  -- Night mode theme
  if (mode_night_theme_on) then
    if NightHours(time) then
      if (not mode_night_theme) then
        mode_night_theme = true
        SKIN:Bang('!SetOption', 'PartBase', 'LineColor', '#night_colour_base#')
        SKIN:Bang('!SetOption', 'PartBasePatch', 'SolidColor', '#night_colour_base#')
        
        SKIN:Bang('!SetOption', 'PartBorder', 'LineColor', '#night_colour_border#')
        SKIN:Bang('!SetOption', 'PartBorderPatch', 'SolidColor', '#night_colour_border#')
        
        SKIN:Bang('!SetOption', 'PartArmLine', 'LineColor', '#night_colour_armline#')

        SKIN:Bang('!SetOption', 'TextLabel', 'FontColor', '#night_colour_text#')

        SKIN:Bang('!SetOption', 'PartBarLower', 'LineColor', '#night_colour_bar_lower#')
        SKIN:Bang('!SetOption', 'PartBarMiddle', 'LineColor', '#night_colour_bar_middle#')
        SKIN:Bang('!SetOption', 'PartBarUpper', 'LineColor', '#night_colour_bar_upper#')
      end
    else
      if (mode_night_theme) then
        mode_night_theme = false
        SKIN:Bang('!SetOption', 'PartBase', 'LineColor', '#colour_base#')
        SKIN:Bang('!SetOption', 'PartBasePatch', 'SolidColor', '#colour_base#')
        
        SKIN:Bang('!SetOption', 'PartBorder', 'LineColor', '#colour_border#')
        SKIN:Bang('!SetOption', 'PartBorderPatch', 'SolidColor', '#colour_border#')
        
        SKIN:Bang('!SetOption', 'PartArmLine', 'LineColor', '#colour_armline#')
        
        SKIN:Bang('!SetOption', 'TextLabel', 'FontColor', '#colour_text#')

        SKIN:Bang('!SetOption', 'PartBarLower', 'LineColor', '#colour_bar_lower#')
        SKIN:Bang('!SetOption', 'PartBarMiddle', 'LineColor', '#colour_bar_middle#')
        SKIN:Bang('!SetOption', 'PartBarUpper', 'LineColor', '#colour_bar_upper#')
      end
    end
  end

  -- Sleep mode
  if (mode_sleep_on) then
    if NightHours(time) then
      if (not mode_sleep) then
        mode_sleep = true
        SKIN:Bang('!SetOption', 'CharHead', 'ImageName', '#char_path#/head_sleep.png')
      end
    else
      if (mode_sleep) then
        mode_sleep = false
        SKIN:Bang('!SetOption', 'CharHead', 'ImageName', '#char_path#/head.png')
      end
    end
  end

  -- Spoon mode
  if (mode_spoon_on) then
    if time.hour >= 12 and time.hour <= 13 then
      if (not mode_spoon) then
        mode_spoon = true
        SKIN:Bang('!SetOption', 'CharHourHand', 'ImageName', '#char_path#/hour_hand_spoon.png')
        SKIN:Bang('!SetOption', 'CharMinHand', 'ImageName', '#char_path#/minute_hand_spoon.png')
      end
    else
      if (mode_spoon) then
        mode_spoon = false
        SKIN:Bang('!SetOption', 'CharHourHand', 'ImageName', '#char_path#/hour_hand.png')
        SKIN:Bang('!SetOption', 'CharMinHand', 'ImageName', '#char_path#/minute_hand.png')
      end
    end
  end
end
