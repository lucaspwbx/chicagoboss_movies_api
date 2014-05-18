-module(movies_api_greeting_controller, [Req]).
-compile(export_all).

hello('GET', []) ->
  {output, "Hello World"}.

movies('GET', []) ->
  Movies = boss_db:find(movies, []),
  {json, [{movies, Movies}]}.
