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


## Recommendations/Suggestions
* DRY up code by moving all _form.html.erb error messages into a single partial