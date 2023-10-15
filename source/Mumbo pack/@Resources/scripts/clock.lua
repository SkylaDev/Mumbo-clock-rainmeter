PROPERTIES = {ModeSleep=0, ModeSpoon=0, WidgetSize=0, ModeNightTheme=0, HideNonImportantNumbers=0, ModeNightStart=0, ModeNightEnd=0}

-- Function to read values from PROPERTIES
function read_bool (value)
  if (value == "1") or (value == "true") then
    return true
  end
  return false
end

-- Variables
local numbers = {Num1  = {'Number1',  '1',  0.684, 0.142, false },
                 Num2  = {'Number2',  '2',  0.822, 0.280, false },
                 Num3  = {'Number3',  '3',  0.874, 0.476, true  },
                 Num4  = {'Number4',  '4',  0.822, 0.665, false },
                 Num5  = {'Number5',  '5',  0.684, 0.808, false },
                 Num6  = {'Number6',  '6',  0.488, 0.860, true  },
                 Num7  = {'Number7',  '7',  0.292, 0.808, false },
                 Num8  = {'Number8',  '8',  0.152, 0.664, false },
                 Num9  = {'Number9',  '9',  0.102, 0.476, true  },
                 Num10 = {'Number10', '10', 0.145, 0.280, false },
                 Num11 = {'Number11', '11', 0.288, 0.144, false },
                 Num12 = {'Number12', '12', 0.480, 0.092, true  }}
local hour_lines = {HLine0= {'HLine0',  0.500, 0.150, 0  },
                    HLine1= {'HLine1',  0.662, 0.194, 30 },
                    HLine2= {'HLine2',  0.782, 0.312, 60 },
                    HLine3= {'HLine3',  0.825, 0.475, 90 },
                    HLine4= {'HLine4',  0.782, 0.638, 300},
                    HLine5= {'HLine5',  0.662, 0.756, 330},
                    HLine6= {'HLine6',  0.500, 0.800, 0  },
                    HLine7= {'HLine7',  0.338, 0.756, 30 },
                    HLine8= {'HLine8',  0.218, 0.638, 60 },
                    HLine9= {'HLine9',  0.175, 0.475, 90 },
                    HLine10={'HLine10', 0.218, 0.312, 300},
                    HLine11={'HLine11', 0.338, 0.194, 330},}
local min_lines = {MLine0= {0,  0.5000, 0.1500},
                   MLine1= {1,  0.5350, 0.1520},
                   MLine2= {2,  0.5700, 0.1570},
                   MLine3= {3,  0.6040, 0.1660},
                   MLine4= {4,  0.6370, 0.1790},
                   MLine5= {5,  0.6690, 0.1950},
                   MLine6= {6,  0.6990, 0.2140},
                   MLine7= {7,  0.7260, 0.2370},
                   MLine8= {8,  0.7510, 0.2620},
                   MLine9= {9,  0.7730, 0.2900},
                   MLine10={10, 0.7920, 0.3190},
                   MLine11={11, 0.8080, 0.3500},
                   MLine12={12, 0.8210, 0.3840},
                   MLine13={13, 0.8300, 0.4170},
                   MLine14={14, 0.8360, 0.4520},
                   MLine15={15, 0.8375, 0.4875},
                   MLine16={16, 0.8360, 0.5230},
                   MLine17={17, 0.8300, 0.5580},
                   MLine18={18, 0.8210, 0.5920},
                   MLine19={19, 0.8080, 0.6250},
                   MLine20={20, 0.7920, 0.6560},
                   MLine21={21, 0.7730, 0.6860},
                   MLine22={22, 0.7510, 0.7140},
                   MLine23={23, 0.7260, 0.7390},
                   MLine24={24, 0.6990, 0.7610},
                   MLine25={25, 0.6690, 0.7800},
                   MLine26={26, 0.6370, 0.7960},
                   MLine27={27, 0.6040, 0.8090},
                   MLine28={28, 0.5700, 0.8180},
                   MLine29={29, 0.5350, 0.8240},
                   MLine30={30, 0.5000, 0.8250},
                   MLine31={31, 0.4650, 0.8240},
                   MLine32={32, 0.4300, 0.8180},
                   MLine33={33, 0.3960, 0.8090},
                   MLine34={34, 0.3630, 0.7960},
                   MLine35={35, 0.3310, 0.7800},
                   MLine36={36, 0.3010, 0.7610},
                   MLine37={37, 0.2740, 0.7390},
                   MLine38={38, 0.2490, 0.7140},
                   MLine39={39, 0.2270, 0.6860},
                   MLine40={40, 0.2080, 0.6560},
                   MLine41={41, 0.1920, 0.6250},
                   MLine42={42, 0.1790, 0.5920},
                   MLine43={43, 0.1700, 0.5580},
                   MLine44={44, 0.1640, 0.5230},
                   MLine45={45, 0.1625, 0.4875},
                   MLine46={46, 0.1640, 0.4520},
                   MLine47={47, 0.1700, 0.4170},
                   MLine48={48, 0.1790, 0.3840},
                   MLine49={49, 0.1920, 0.3500},
                   MLine50={50, 0.2080, 0.3190},
                   MLine51={51, 0.2270, 0.2900},
                   MLine52={52, 0.2490, 0.2620},
                   MLine53={53, 0.2740, 0.2370},
                   MLine54={54, 0.3010, 0.2140},
                   MLine55={55, 0.3310, 0.1950},
                   MLine56={56, 0.3630, 0.1790},
                   MLine57={57, 0.3960, 0.1660},
                   MLine58={58, 0.4300, 0.1570},
                   MLine59={59, 0.4650, 0.1520}}

local mode_sleep = false
local mode_sleep_on = false

local mode_spoon = false
local mode_spoon_on = false

local mode_night_theme = false
local mode_night_theme_on = false

local mode_night_start = 0
local mode_night_end = 0

local rotation_hour = 0
local rotation_min = 0

-- Called on skin load
function Initialize()
  -- Variables
  size = tonumber(PROPERTIES.WidgetSize)
  hide_nonimportant_numbers = read_bool(PROPERTIES.HideNonImportantNumbers)

  mode_night_theme_on = read_bool(PROPERTIES.ModeNightTheme)
  mode_sleep_on = read_bool(PROPERTIES.ModeSleep)
  mode_spoon_on = read_bool(PROPERTIES.ModeSpoon)

  mode_night_start = tonumber(PROPERTIES.ModeNightStart)
  mode_night_end = tonumber(PROPERTIES.ModeNightEnd)

  -- Numbers
  for id, info in pairs(numbers) do
    if (not hide_nonimportant_numbers) or (info[5] == true) then
      SKIN:Bang('!SetOption', info[1], 'MeterStyle', 'NumberTemplate')
      meter = SKIN:GetMeter(info[1])
      SKIN:Bang('!SetOption', info[1], 'Text', info[2])
      meter:SetX((size * info[3]))
      meter:SetY((size * info[4]))
    end
  end

  -- Hour lines
  for id, info in pairs(hour_lines) do
    args = 'Line ' .. (size * info[2]) .. ',' .. (size * info[3]) .. ',' .. (size * info[2]) .. ',' .. (size * (info[3] + 0.05)) .. ' | StrokeWidth ' .. (size * 0.010) .. ' | Stroke Color #colour_hourline# | StrokeStartCap Round | StrokeEndCap Round | Rotate ' .. info[4]
    SKIN:Bang('!SetOption', info[1], 'Shape', args)
    SKIN:Bang('!SetOption', info[1], 'Hidden', '#hide_hourline#')
  end

  -- Min lines
  for id, info in pairs(min_lines) do
    args='Line ' .. (size * info[2]) .. ',' .. (size * info[3]) .. ',' .. (size * info[2]) .. ',' .. (size * (info[3] + 0.025)) .. ' | StrokeWidth ' .. (size * 0.006) .. ' | Stroke Color #colour_minline# | StrokeStartCap Round | StrokeEndCap Round | Rotate ' .. (6 * info[1])
    SKIN:Bang('!SetOption', 'MLine' .. info[1], 'Shape', args)
    SKIN:Bang('!SetOption', 'MLine' .. info[1], 'Hidden', '#hide_minline#')
  end
end

-- Update numbers/hourlines/minlines
function update_parts(numb, hline, mline)
  -- Numbers
  SKIN:Bang('!SetOption', 'NumberTemplate', 'FontColor', numb)

  for id, info in pairs(numbers) do
    SKIN:Bang('!SetOption', info[1], 'MeterStyle', 'NumberTemplate')
  end

  -- Hour lines
  for id, info in pairs(hour_lines) do
    args = 'Line ' .. (size * info[2]) .. ',' .. (size * info[3]) .. ',' .. (size * info[2]) .. ',' .. (size * (info[3] + 0.05)) .. ' | StrokeWidth ' .. (size * 0.010) .. ' | Stroke Color ' .. hline ..' | StrokeStartCap Round | StrokeEndCap Round | Rotate ' .. info[4]
    SKIN:Bang('!SetOption', info[1], 'Shape', args)
  end

  -- Min lines
  for id, info in pairs(min_lines) do
    args='Line ' .. (size * info[2]) .. ',' .. (size * info[3]) .. ',' .. (size * info[2]) .. ',' .. (size * (info[3] + 0.025)) .. ' | StrokeWidth ' .. (size * 0.006) .. ' | Stroke Color ' .. mline ..' | StrokeStartCap Round | StrokeEndCap Round | Rotate ' .. (6 * info[1])
    SKIN:Bang('!SetOption', 'MLine' .. info[1], 'Shape', args)
  end
end

-- Check night hours
function night_hours(time)
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
  rotation_hour = ((360 / 12) * time.hour) + (((360 / 12) / 60) * time.min)
  rotation_min = ((360 / 60) * time.min) + (((360 / 60) / 60) * time.sec)

  SKIN:Bang('!SetOption', 'CharHourHand', 'StartAngle', math.rad(rotation_hour))
  SKIN:Bang('!SetOption', 'CharMinHand', 'StartAngle', math.rad(rotation_min))

  -- Night mode theme
  if (mode_night_theme_on) then
    if night_hours(time) then
      if (not mode_night_theme) then
        mode_night_theme = true
        SKIN:Bang('!SetOption', 'PartBase', 'LineColor', '#night_colour_base#')
        SKIN:Bang('!SetOption', 'PartBasePatch', 'SolidColor', '#night_colour_base#')

        SKIN:Bang('!SetOption', 'PartBorder', 'LineColor', '#night_colour_border#')
        SKIN:Bang('!SetOption', 'PartBorderPatch', 'SolidColor', '#night_colour_border#')

        SKIN:Bang('!SetOption', 'PartHourCircle', 'LineColor', '#night_colour_hourcircle#')
        SKIN:Bang('!SetOption', 'PartMinCircle', 'LineColor', '#night_colour_mincircle#')

        update_parts('#night_colour_numbers#', '#night_colour_hourline#', '#night_colour_minline#')
      end
    else
      if (mode_night_theme) then
        mode_night_theme = false
        SKIN:Bang('!SetOption', 'PartBase', 'LineColor', '#colour_base#')
        SKIN:Bang('!SetOption', 'PartBasePatch', 'SolidColor', '#colour_base#')

        SKIN:Bang('!SetOption', 'PartBorder', 'LineColor', '#colour_border#')
        SKIN:Bang('!SetOption', 'PartBorderPatch', 'SolidColor', '#colour_border#')

        SKIN:Bang('!SetOption', 'PartHourCircle', 'LineColor', '#colour_hourcircle#')
        SKIN:Bang('!SetOption', 'PartMinCircle', 'LineColor', '#colour_mincircle#')

        update_parts('#colour_numbers#', '#colour_hourline#', '#colour_minline#')
      end
    end
  end

  -- Sleep mode
  if (mode_sleep_on) then
    if night_hours(time) then
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
