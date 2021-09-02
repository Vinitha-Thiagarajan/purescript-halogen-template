
module App.Temp where

import Prelude

import Ace.EditSession (addGutterDecoration)
import Control.Alternative (empty)
import Data.Const (Const)
import Data.List (List(..))
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
import Math (ln10)
import Web.HTML.Event.PopStateEvent (state)
import Web.HTML.HTMLAnchorElement (rel)
import Web.HTML.HTMLBaseElement (href)
import Web.HTML.HTMLTableElement (border)

data Action = Update | Delete | SetfirstName String | Create | SetlastName String | SetAge String


type Entry =
  { firstName  :: String,
   lastName :: String,
    age :: String
  }
  
type AddressBook = List Entry

type State
  = { 
    firstName :: String,
    lastName :: String,
    age :: String,
    listOfEntry :: AddressBook
     }

    
createEntryNew :: String -> String -> String -> Entry
createEntryNew fn ln a = {
   firstName: fn,
   lastName : ln,
   age : a
  }   

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

component :: forall q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }


initialState :: forall input. input -> State
initialState _ = { firstName: "" , lastName: "", age:"", listOfEntry : empty}

render :: forall m. State -> H.ComponentHTML Action () m
render st =
  HH.div_ 
    [ 
      HH.h1_[HH.text "AddressBook"],
      HH.p_
      [HH.text $ "Your data" <> st.firstName ],
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
        [
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
  Update -> H.modify_ \st -> st {firstName = st.firstName }  
  Delete -> H.modify_ \st -> st { firstName = st.firstName}                                    
  SetfirstName firstName -> do
    H.modify_ _ { firstName = firstName }
  SetlastName lastName -> do
    H.modify_ _ { lastName = lastName }
  SetAge age-> do
    H.modify_ _ { age = age }
  Create-> do
    firstName <- H.gets _.firstName
    lastName <- H.gets _.lastName
    age <- H.gets _.age
    listEntry <- H.gets _.listOfEntry
    let newEntry = createEntryNew $ firstName lastName age
    let insert = insertEntry $ newEntry listEntry
    H.modify_ _ { listOfEntry = insert }
                      
          
