
module App.Crud where

import Prelude

import Data.Const (Const)
import Data.Profunctor.Choice (left)
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML (td_, th_)
import Halogen.HTML as HH
import Halogen.HTML.Elements.Keyed (table_)
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties (InputType(..), href, id_, src, type_, value) as HP
import Halogen.VDom.Driver (runUI)
import Web.HTML.Event.PopStateEvent (state)
import Web.HTML.HTMLAnchorElement (rel)
import Web.HTML.HTMLBaseElement (href)
import Web.HTML.HTMLTableElement (border)
import Web.Event.Event (Event)
import Web.Event.Event as Event

data Action = Update | Delete | SetfirstName String | Create | SetlastName String | SetAge String
type State
  = { 
    firstName :: String,
      lastName :: String,
      age :: String
     }


component :: forall q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }


initialState :: forall input. input -> State
initialState _ = { firstName: "",lastName :"",age:"" }

render :: forall m. State -> H.ComponentHTML Action () m
render st =
  
  HH.div_ 
    [ --HH.head_[HH.link [rel [HH.text $ "stylesheet" ] , href[HH.text $ "styles.css"]]],
      HH.h1_[HH.text "AddressBook"],
      HH.p_
      [HH.text $ "Your data" <> st.firstName <> " " <> st.lastName <>" "<> st.age ],
      HH.table_[
                HH.tr_  [HH.td_  [ HH.text "FirstName" ],
                         HH.td_  [ HH.input
                                 [ HP.value st.firstName,
                                   HE.onValueInput \str -> SetfirstName str]]],
                HH.tr_  [HH.td_  [ HH.text "LastName" ],
                         HH.td_  [ HH.input
                                 [ HP.value st.lastName,
                                   HE.onValueInput \str -> SetlastName str]]],
                HH.tr_  [HH.td_  [ HH.text "Age" ],
                         HH.td_  [ HH.input
                                 [ HP.value st.age,
                                   HE.onValueInput \str -> SetAge str]]],
                HH.tr_  [ HH.td_[HH.button
                  [HE.onClick \_ -> Create]
                  [HH.text "create"]]]],
      HH.table_
      [HH.tr_
        [HH.th_[HH.text "FirstName"],
         HH.th_[HH.text "LastName"],
         HH.th_[HH.text "Age"],
         HH.th_[HH.text "Action"]],
       HH.tr_
        [
         HH.td_[HH.text "Vinitha"],
         HH.td_[HH.text "Thiagarajan"],
         HH.td_[HH.text "21"],
         HH.td_[HH.button
                  [HE.onClick \_ -> Update]
                  [HH.text "update"],
                HH.button
                  [HE.onClick \_ -> Delete]
                  [HH.text "delete"]]],
       HH.tr_
        [HH.td_[HH.text "Pooja"],
         HH.td_[HH.text "Ram"],
         HH.td_[HH.text "22"],
         HH.td_[HH.button
                  [HE.onClick \_ -> Update]
                  [HH.text "update"],
                HH.button
                  [HE.onClick \_ -> Delete]
                  [HH.text "delete"]]],
       HH.tr_
        [--HP.id_ "1",
         HH.td_[HH.text "Viswesh"],
         HH.td_[HH.text "Thiagarajan"],
         HH.td_[HH.text "26"],
         HH.td_[HH.button
                  [HE.onClick \_ -> Update]
                  [HH.text "update"],
                HH.button
                  [HE.onClick \_ -> Delete]
                  [HH.text "delete"]]],
       HH.tr_
        [HH.td_[HH.text "Preethi"],
         HH.td_[HH.text "Tamilvendhan"],
         HH.td_[HH.text "22"],
         HH.td_[HH.button
                  [HE.onClick \_ -> Update]
                  [HH.text "update"],
                HH.button
                  [HE.onClick \_ -> Delete]
                  [HH.text "delete"]]],
       HH.tr_
        [HH.td_[HH.text "Archana"],
         HH.td_[HH.text "Diwakar"],
         HH.td_[HH.text "21"],
         HH.td_[HH.button
                  [HE.onClick \_ -> Update]
                  [HH.text "update"],
                HH.button
                  [HE.onClick \_ -> Delete]
                  [HH.text "delete"]]]
      ]
    ]
         

handleAction :: forall cs o m. Action → H.HalogenM State Action cs o m Unit
handleAction = case _ of
  Update -> H.modify_ \st -> st {firstName = st.firstName,lastName = st.lastName, age = st.age }  
  Delete -> H.modify_ \st -> st { firstName = st.firstName,lastName = st.lastName, age = st.age}                                    
  SetfirstName firstName -> do
    H.modify_ _ { firstName = firstName }

  SetlastName lastName -> do
    H.modify_ _ { lastName = lastName }

  SetAge age -> do
    H.modify_ _ { age = age }

  Create-> do
    firstName <- H.gets _.firstName
    lastName <- H.gets _.lastName
    age <- H.gets _.age
    H.modify_ _ { lastName = firstName}
                      
          
