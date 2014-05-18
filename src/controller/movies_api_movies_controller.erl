-module(movies_api_movies_controller, [Req]).
-compile(export_all).

list('GET', []) ->
  Movies = boss_db:find(movie, []),
  {json, [{movies, Movies}]}.

create('POST', []) ->
  Title = Req:post_param("movie[title]"),
  Description = Req:post_param("movie[description]"),
  NewMovie = movie:new(id, Title, Description),
  {ok, SavedMovie} = NewMovie:save(),
  {redirect, [{action, "list"}]}.
