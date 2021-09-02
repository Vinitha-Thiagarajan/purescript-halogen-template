module Main where

import Prelude

--import App.Button as Button
import App.Table as Table
--import App.Elas as Elas
import App.HttpRequest as HttpRequest
--import App.Temp as Temp
--import App.IncDec as IncDec
--import App.LifeCycleEvents as LifeCycleEvents
--import App.New as New
--import App.Timer as Timer
--import App.Try as Try
--import Container.Container as Container
--import Ace.Container as AContainer
import App.Crud as Crud
--import App.Attempt as Attempt
import HtmlComponents.HtmlComponents as HtmlComponents
import Effect (Effect)
--import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.Aff as HA
--import Halogen.Aff.Driver.State (LifecycleHandlers)
import Halogen.VDom.Driver (runUI)
--import Web.HTML.HTMLDocument (body)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  --runUI IncDec.component unit body
  --runUI New.component unit body
  --runUI Button.component unit body
  --runUI HttpRequest.component unit body
  --runUI LifeCycleEvents.component unit body
  --runUI Timer.component unit body
  --runUI Elas.component unit body 
  --runUI Table.component unit body 
  --runUI Try.component unit body 
  --runUI Container.component unit body
  --runUI Container.component unit body
  --runUI HtmlComponents.page unit body
  runUI Crud.component unit body
 -- runUI Temp.component unit body
