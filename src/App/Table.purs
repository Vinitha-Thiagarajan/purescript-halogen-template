module App.Table where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE

type State
  = { count :: Int }

data Action
  = Increment | Decrement | MultiplyBy2 | DivideBy2 

component :: forall q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState: \_ -> { count: 0 }
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }

render :: forall cs m. State -> H.ComponentHTML Action cs m
render state =

  {-HH.table_
    [HH.thead_
      HH.tr_
       HH.th_
          [HH.text $ "firstname"]
    ]-}
 {-} HH.div_
    [ HH.h1_[HH.text $ "AddressBook"]]-}

  HH.div_
    [ HH.h1_[HH.text $ "AddressBook"],
    
    HH.table_[HH.tr_[HH.th_[HH.text $ "FirstName"],HH.th_[HH.text $ "LastName"],HH.th_[HH.text $ "Age"]],HH.tr_[HH.td_[HH.text $ "Vinitha"],HH.td_[HH.text $ "Thiagarajan"],HH.td_[HH.text $ "21"]],HH.tr_[HH.td_[HH.text $ "Pooja"],HH.td_[HH.text $ "Ram"],HH.td_[HH.text $ "26"]]],
    HH.p_
        [ HH.text $ "You clicked " <> show state.count <> " times" ]
    , HH.button
        [ HE.onClick \_ -> Increment ]
        [ HH.text "Increment" ]
    ,HH.button
        [ HE.onClick \_ -> Decrement ]
        [ HH.text "Decrement" ]
    ,HH.button
        [ HE.onClick \_ -> MultiplyBy2 ]
        [ HH.text "MultiplyBy2" ]
    ,HH.button
        [ HE.onClick \_ -> DivideBy2 ]
        [ HH.text "DivideBy2" ],
   HH.table_
      [HH.tr_
        [HH.th_[HH.text $ "FirstName"],
         HH.th_[HH.text $ "LastName"],
         HH.th_[HH.text $ "Age"]],
       HH.tr_
        [HH.td_[HH.text $ "Vinitha"],
         HH.td_[HH.text $ "Thiagarajan"],
         HH.td_[HH.text $ "21"]],
       HH.tr_
        [HH.td_[HH.text $ "Pooja"],
         HH.td_[HH.text $ "Ram"],
         HH.td_[HH.text $ "22"]],
       HH.tr_
        [HH.td_[HH.text $ "Viswesh"],
         HH.td_[HH.text $ "Thiagarajan"],
         HH.td_[HH.text $ "26"]],
       HH.tr_
        [HH.td_[HH.text $ "Preethi"],
         HH.td_[HH.text $ "Tamilvendhan"],
         HH.td_[HH.text $ "22"]],
       HH.tr_
        [HH.td_[HH.text $ "Archana"],
         HH.td_[HH.text $ "Diwakar"],
         HH.td_[HH.text $ "21"]]]
    ]

 {-HH.table_ 
    [HH.tr_
      [HH.th_
        [HH.text $ "Firstname"]],
      [HH.th_
        [HH.text $ "Lastname"]],
      [HH.th_
        [HH.text $ "Age"]]],
    [HH.tr_
      [HH.td_
        [HH.text $ "Vinitha"]],
      [HH.td_
        [HH.text $ "Thiagarajan"]],
      [HH.td_
        [HH.text $ "21"]]]


    [HH.table_
    [HH.tr_
    [HH.th_[HH.text $ "firstname"],[HH.text $ "lastname"],[HH.text $"age"]]]]-}
    {-HH.p_
        [ HH.text $ "You clicked " <> show state.count <> " times" ]
    , HH.button
        [ HE.onClick \_ -> Increment ]
        [ HH.text "Click me" ]
    ,HH.button
        [ HE.onClick \_ -> Increment ]
        [ HH.text "Show" ]
    ,HH.button
        [ HE.onClick \_ -> Increment ]
        [ HH.text "Update" ]
    ,HH.button
        [ HE.onClick \_ -> Increment ]
        [ HH.text "Delete" ]
    ]-}
handleAction :: forall cs o m. Action → H.HalogenM State Action cs o m Unit
handleAction = case _ of
  Increment -> H.modify_ \st -> st { count = st.count + 1 }
  Decrement -> H.modify_ \st -> st { count = st.count - 1}
  MultiplyBy2 -> H.modify_ \st -> st {count = st.count * 2}
  DivideBy2 -> H.modify_ \st -> st {count = st.count / 2}
  

