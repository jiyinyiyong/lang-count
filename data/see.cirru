
var
  collection $ require :./before-f
  all $ array

for (collection lang count)
  all.push $ array lang count

= all $ all.sort $ \ (a b)
  return $ cond (< (. a 1) (. b 1)) 1 -1

console.log all