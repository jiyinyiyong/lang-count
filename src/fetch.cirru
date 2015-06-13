
var
  github $ require :github
  collection $ object
  langs $ require :./langs

  client $ new github $ object
    :version :3.0.0
    :debug true
    :protocol :https
    :timeout 5000

client.authenticate $ object
  :type :basic
  :username :jiyinyiyong
  :password :tmppassword

var
  getCount $ \ (rest)
    if (is rest.length 0) $ do
      console.log collection
      return 0
    var
      lang $ . rest 0
    console.log :start lang
    client.search.repos
      object
        :q $ + :language: (encodeURIComponent lang)
      \ (err res)
        if (? res)
          do
            console.log lang res.total_count
            = collection.lang res.total_count
          do
            console.log :error lang err
            = collection.lang :-1
        getCount $ rest.slice 1

getCount langs
