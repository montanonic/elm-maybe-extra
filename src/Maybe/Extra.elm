module Maybe.Extra ((?), join, isNothing) where
{-| Convenience functions for Maybe.

@docs (?), join, isNothing
-}

import Maybe (..)

{-| Flipped, infix version of `withDefault`.

    head [] ? 0 == 0
-}
(?) : Maybe a -> a -> a
mx ? x = withDefault x mx



{-| Flattens nested Maybes

    join (Just (Just 1)) == Just 1
    join (Just Nothing)  == Nothing
    join Nothing         == Nothing
-}
join : Maybe (Maybe a) -> Maybe a
join mx =
  case mx of
    Just x -> x
    Nothing -> Nothing


{-| Conveniently check if constructed with `Nothing`.

      isNothing (Just 42) == False
      isNothing (Just []) == False
      isNothing Nothing   == True
-}
isNothing : Maybe a -> Bool
isNothing m =
    case m of
      Nothing -> True
      Just _  -> False
