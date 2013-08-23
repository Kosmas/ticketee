# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter. This repository is not my original work, but rather, me working throught the pre-release version of the book. Suggestions and issues with the pre-release noted below.

## Issues - !!!WORK IN PROGRESS!!!
### MEAP v8
#### PDF Page 7
* The rvm use --default 1.9.3 should be rvm use --default ruby-1.9.3
* Suggestion : Would the use or mention of rvm gemsets be useful? 

```
rvm gemset create rails4_0_0 
rvm gemset use rails4_0_0  
gem install rails -v 4.0.0
```

#### PDF Page 86
* Not huge issue, but Listing 3.1.6, missing closing p tag (and subsequent mentions of this same form)

#### PDF Page 115
* is gem 'factory_girl', '4.2.0' necessary when gem 'factory_girl-rails', '4.2.1' already on page 114? FGR depends on FG according to its gemspec

#### PDF Page 123
* Factory(:project, name: "TextMate 2") should be FactoryGirl.create(:project, name: "TextMate 2")

#### PDF Page 157
* Imbalanced quotation-marks on commit

#### PDF Page 169
* When generating models/migrations, that :string is default when not specified is already covered earlier in the book.

#### PDF Page 171
* user.authentication should be user.authenticate

#### PDF Page 173
* would be nice if a filename was given for the user signup spec. Based on earlier parts of book spec/features/creating_users_spec.rb
* nevermind, later on (page 177), it refers to this file as spec/features/signing_up_spec.rb - but still inconsistent from earlier parts of book

#### PDF Page 174
* which line in application.html.erb should nav tags go... not a biggie.

#### PDF Page 175
* ```rm -rf spec/controllers``` removes projects_controller_spec.rb which is something we added real specs to on page 132

#### PDF Page 181
* fill_in 'User Name', with: user.name should probably just be 'Name', either that or modify page 183

#### PDF Page 185 + 189
* @ticket.user.email (tickets and users may be related, and may be manually set on edit specs for example, but the relationship is never built during the create action in the ticket controller, which obviously causes failures in the following spec)

```ruby
  within "#ticket #author" do
    expect(page).to have_content("Created by sample@example.com")
  end
```

#### PDF Page 187
* as above, 'User Name' does not exist, 'Name' does, same recommendations apply.
* ```within("h2") { expect(page).to have_content("New Ticket") }``` exists in the spec, but the show project page (the page the user would be on after signing in doesn't have this content)

#### PDF Page 188
* Author awknowledges that he forgot to write require_signin! method, and then says to use the following code to implement it, but includes no code. Here's what I wrote:

```ruby
  # application_controller.rb
  private

    def require_signin!
      unless session[:user_id].present?
        flash[:alert] = "You need to sign in or sign up before continuing."
        redirect_to signin_path
      end
    end
```

#### PDF Page 196
* as above, 'User Name' does not exist, 'Name' does, same recommendations apply.

#### PDF Page 204
* Forgets to include the following spec created earlier, or include "..." probably as a result of PDF Page 175, rm -rf issue noted above.

```ruby
  it "displays an error for a missing project" do
    get :show, :id => "not-here"
    expect(response).to redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
```

* Mentions "...Just like with the email_spec helper methods in the previous chapter..." which the reader hasn't created.

#### PDF Page 206
* current_user method called, but not created.


#### PDF Page 225
* talks about user_signed_in? method, but again, not created. Probably AWOL with the current_user method ;)

#### PDF Page 225
* Needs a password_confirmation field on the admin user form to pass. Also, need to use user_password user_password_confirmation to avoid ambiguity.

## Recommendations/Suggestions
* DRY up code by moving all _form.html.erb error messages into a single partial
* Is there a reason why we do ```textmate_2 = FactoryGirl.create(:project, name: "TextMate 2")``` etc... rather than let!?

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

