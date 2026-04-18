-- Data.Aviary.Birds
starling :: (a -> b -> c) -> (a -> b) -> a -> c
starling f g x = f x (g x)
  
-- lc 3783
mirrorDistance = abs . starling (-) (read . reverse . show)
