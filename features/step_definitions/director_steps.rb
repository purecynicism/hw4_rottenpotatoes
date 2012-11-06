# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /I move to the edit page for "(.+)"$/ do |movie|
 click_link(movie)
 click_link("Edit")
end

When /I put in "Director" with "([A-Za-z ]+)"$/ do |value|
  fill_in("movie_director", :with=>value)
end

When /I press "([A-Za-z]+)"/ do |link|
  click_button(link)
end

Then /the director of "([a-zA-Z]+)" should be "([A-Za-z ]+)"/ do |movie,director|
  if page.respond_to? :should
    page.should have_content("Director: #{director}")
  else
    assert page.have_content?("Director: #{director}")
  end
end

When /I move to the details page for "(.+)"$/ do |movie|
 click_link(movie)
end


When /I click the link "(Find Movies With Same Director)"/ do |link|
  click_link(link)
end

Then /I am at the Similar Movies page for "([A-Za-z ]+)"/ do |movie|
  if page.respond_to? :should
    page.should have_content(movie)
  else
    assert page.have_content?(movie)
  end
end

Then /I should (not )*see the movie "([A-Za-z0-9\- ]+)"/ do |visible, movie|
 if not visible then
  begin
if page.respond_to? :should
    page.should have_content(movie)
  else
    assert page.have_content?(movie)
  end
  end
else
begin
    if page.respond_to? :should
    page.should have_no_content(movie)

  else
    assert page.have_no_content?(movie)
  end

end
end
end
