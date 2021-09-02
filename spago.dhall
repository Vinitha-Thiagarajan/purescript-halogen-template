{ name = "halogen-project"
, dependencies =
  [ "ace"
  , "affjax"
  , "console"
  , "effect"
  , "halogen"
  , "psci-support"
  , "random"
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
