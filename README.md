# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter. This repository is not my original work, but rather, me working throught the pre-release version of the book. Suggestions and issues with the pre-release noted below.

## Issues
### MEAP v8
#### PDF Page 86
* Listing 3.1.6, missing closing p tag (and subsequent mentions of this same form)

#### PDF Page 115
* is gem 'factory_girl', '4.2.0' necessary when gem 'factory_girl-rails', '4.2.1' already on page 114?

#### PDF Page 123
* Factory(:project, name: "TextMate 2") should be FactoryGirl.create(:project, name: "TextMate 2")

#### PDF Page 157
* Imbalanced quotation-marks on commit

#### PDF Page 169
* When generating models/migrations, :string is the default is already covered earlier in the book.

#### PDF Page 171
* user.authentication should be user.authenticate

#### PDF Page 173
* would be nice if a filename was given for the user signup spec. Based on rest of book spec/features/creating_users_spec.rb
* on page 177, it refers to this file as spec/features/signing_up_spec.rb

#### PDF Page 174
* which line in application.html.erb should nav tags go... obvious, but not to everyone.

#### PDF Page 175
* ```rm -rf spec/controllers``` removes projects_controller_spec.rb which is something we want to keep

#### PDF Page 181
* fill_in 'User Name', with: user.name should probably just be name, either that or modify pdf page 183

## Recommendations/Suggestions
* DRY up code by moving all _form.html.erb error messages into a single partial

#### PDF Page 179
* requiring the button to say "Update Profile" may be a little too hard for new users given the partial already specifies <%= f.submit "Sign up" %>
 * Personal opinion is that I think most new users would solve this problem by duplicating the code already in the _form partial.
 * recommended approach, just use <%= f.submit %> in the partial and modify the sign_up spec and the profile spec to use "Create User" and "Update User"
 * fwiw I solved it like this:

 ```ruby
 #users_helper.rb
  def text_for_submit_button
    if params[:action] == ("edit" || "update")
      "Update Profile"
    else
      "Sign up"
    end
  end
 ```
 ```ruby
 # _form.html.erb
 <%= f.submit text_for_submit_button %>
 ```