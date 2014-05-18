-module(movies_api_movies_controller, [Req]).
-compile(export_all).

index('GET', []) ->
  Movies = boss_db:find(movie, []),
  {json, [{movies, Movies}]}.

create('POST', []) ->
  Title = Req:post_param("movie[title]"),
  Description = Req:post_param("movie[description]"),
  NewMovie = movie:new(id, Title, Description),
  {ok, SavedMovie} = NewMovie:save(),
  {redirect, '/'}.

%% pdate('PUT', [id]) ->
  %%ovie_id = integer_to_list(Req:post_param("id")),
  %%inal_id = string:concat("movie-", Movie_id),
  %%ovie = boss_db:find(movie, [{id, 'equals',Final_id}])
  %%pdatedMovie = movie:new(id, Title, Description),
  %%ok, SavedMovie} = UpdatedMovie:save(),
  %%{json, [{movie, SavedMovie}]}.

update('PUT', [Id]) ->
  {output, "No content yet"}.
