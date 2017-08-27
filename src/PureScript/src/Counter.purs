module Counter where

import Prelude hiding (div)

import Control.Monad.Eff (Eff)
import Pux (CoreEffects, EffModel, start)
import React (ReactClass)
import Pux.DOM.Events (onClick)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToReact)
import Text.Smolder.HTML (button, div, span)
import Text.Smolder.Markup (text, (#!))

type State = {
  count :: Int
}

data Event = Increment | Decrement

foldp :: ∀ fx. Event -> State -> EffModel State Event fx
foldp Increment state = { state: state { count = state.count + 1 }, effects: [] }
foldp Decrement state = { state: state { count = state.count - 1 }, effects: [] }

view :: State -> HTML Event
view state =
  div do
    button #! onClick (const Increment) $ text "Increment"
    span $ text (show state.count)
    button #! onClick (const Decrement) $ text "Decrement"

toReact :: ∀ props fx. State -> Eff (CoreEffects fx) (ReactClass props)
toReact state = do
  app <- start
    { initialState: state
    , view
    , foldp
    , inputs: []
    }

  renderToReact app.markup app.input
