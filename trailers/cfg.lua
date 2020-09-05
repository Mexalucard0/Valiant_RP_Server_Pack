cfg = {
  debug = true,

  show_blips    = true,
  blip_sprite   = 479,
  blip_color    = 5,
  blip_scale    = 0.7,
  blip_display  = 2,
  blip_short    = true,
  blip_text     = "Trailer Depo",

  show_marker   = true,
  marker_sprite = 30,
  marker_color  = {r = 255, g = 198, b = 26, a = 155},
  
  trailer_models = {
    {
      model           = 'thauler', 
      bone            = 'extra_1', 
      door            = 5, 
      instant_open    = true, 
      max             = 3,
      enter_on_spawn  = true, 
      enter_seat      = -1,
      heading_offset  = 0.0
    },
  },

  job_only = false,
  control_jobs = {
    'police','mechanic'
  },

  garage_locations = {
    vector4(384.80004882813,-1157.6212158203,29.291767120361,270.78433227539),
  },

  max_raycast_length = 3
}

mLibs = exports["meta_libs"]