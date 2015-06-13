
GitHub repos counting by language
----

Count how many repos of langauge X on GitHub.

API:

```
https://api.github.com/search/repositories?q=language:Cirru
```

Doing retry to keep under GitHub's limits.

### Usage

```
npm i
gulp html
webpack-dev-server --hot
```

View console of `index.html`.

Results are in `window.collection`.