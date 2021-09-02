
module HtmlComponents.HtmlComponents where

import Prelude

import Data.Const (Const)
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties (InputType(..), href, id_, src, type_, value) as HP
import Halogen.VDom.Driver (runUI)

type Action = Unit
type State = Unit


page =
  H.mkComponent { initialState: const unit
                , render: \_ -> render
                , eval: H.mkEval $ H.defaultEval 
                }

render :: forall m. H.ComponentHTML Action () m
render =
  HH.div_ [ HH.h1_ [ HH.text "Common HTML Components in PureScript" ]
          , HH.table_ [ HH.tr_  [ HH.td_  [ HH.text "Label" ]
                                , HH.td_  [ HH.label_ [ HH.text "You are reading a label" ]]
                                ]
                      , HH.tr_  [ HH.td_  [ HH.text "Text Box" ]
                                , HH.td_  [ HH.input [ HP.type_ HP.InputText ] ]
                                ]
                      , HH.tr_  [ HH.td_  [ HH.text "Text Area" ]
                                , HH.td_  [ HH.textarea [ HP.id_ "" ] ]
                                ] 
                      , HH.tr_  [ HH.td_  [ HH.text "Check box" ]
                                , HH.td_  [ HH.input [ HP.type_ HP.InputCheckbox ] ]
                                ]  
                      , HH.tr_  [ HH.td_  [ HH.text "Range" ]
                                , HH.td_  [ HH.input [ HP.type_ HP.InputRange ] ]
                                ] 
                      , HH.tr_  [ HH.td_  [ HH.text "Drop Down List" ]
                                , HH.td_  [ HH.select_  [ HH.option [ HP.value "1" ] [ HH.text "PureScript" ]
                                                        , HH.option [ HP.value "2" ] [ HH.text "Haskell" ] 
                                                        ] 
                                          ]
                                ]
                      , HH.tr_  [ HH.td_  [ HH.text "Button" ]
                                , HH.td_  [ HH.button_  [ HH.text "Press Me" ]
                                          ] 
                                ]
                      , HH.tr_  [ HH.td_  [ HH.text "Submit Button" ]
                                , HH.td_  [ HH.input [ HP.type_ HP.InputSubmit, HP.value "Sumbit!" ] 
                                          ] 
                                ]  
                      , HH.tr_  [ HH.td_  [ HH.text "Image" ]
                                , HH.td_  [ HH.img [ HP.src "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE1Mu3b?ver=5c31" ] 
                                          ] 
                                ]
                      , HH.tr_  [ HH.td_  [ HH.text "Hyperlink" ]
                                , HH.td_  [ HH.a [ HP.href "http://localhost:1234" ] [ HH.text "Click me" ] 
                                          ] 
                                ]                  
                      ]
          ]
