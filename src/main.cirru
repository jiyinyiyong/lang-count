
= window.collection $ object

var
  langs $ require :./langs
  getLink $ \ (lang)
    return $ + :https://api.github.com/search/repositories?q=language:
      , lang
  makeReq $ \ (others)
    if (is others.length 0) $ do
      console.log collection
      return 0

    var
      lang $ . others 0
      link $ getLink lang
      req $ new XMLHttpRequest

    = req.onload $ \ (res)
      var
        data $ JSON.parse req.responseText
        count data.total_count
      if (? count)
        do
          = (. collection lang) data.total_count
          console.log lang data.total_count
          setTimeout
            \ ()
              makeReq $ others.slice 1
            , 4000
        do
          setTimeout
            \ ()
              makeReq others
            , 10000
    req.open :GET link
    req.send

makeReq langs

= window.onbeforeunload $ \ ()
  if (confirm :sure?)
    do $ return true
    do $ return false
