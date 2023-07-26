# QuestionsQueue

This project asks you to build views for a questions forum.

## Learning Goals
By the end of this project, you should be able to
* Build Rails views for `index`, `show`, `new`, `edit`, and `destroy` 
* Display class instance attributes as values of HTML elements
* Use a hidden input to set a form's method
* Use `form` and `input` HTML elements
* Create and use partials

## Getting Started

To get started clone the starter repo from the `Download Project` button below.
To setup your project:
* Ensure the PostgreSQL app is running on your machine.
* Navigate to the repo's root directory and run the following:

```sh
    bundle install
    rails db:create
    rails db:migrate
    rails db:seed
```
This will initialize the database and seed it with sample data that you will be
able to display in your views.

After you have gone through this initial setup take some time to review the 
following files:
* `routes.rb`
* `question.rb`
* `questions_controller.rb`
* `user.rb`
* `users_controller.rb`

To see your sample data open the rails console in the terminal, `rails c`, and
take a look around. Check out `Question.all` and `User.all`

To run the app and see the current `JSON` output of data run `rails s` and visit 
`localhost:3000`
- The app by default is routing to `questions#index`
- try a few of the routes to see what the pages and data currently looks like
    - ex: `localhost:3000/questions/1`
- for a full list of routes run `rails routes`

## The Index View

Start by creating a view of `index.html.erb` in `app/views/questions`. As you 
will have noted from your review of the `questions_controller.rb`, you have 
access to an instance variable of `@questions`. `@questions` has all of the 
question data you need to render an index of all questions.

1. Give your `index.html.erb` an `h2` of `Questions Index`
2. Create an unordered list of questions. Each question should include:
    - An `h3` of the question's `subject`
    - A `p` of the question's body
3. Update the `questions#index` action to render the `:index` 
    view.
    - ex: 
    ```rb
        def index
            @questions = Question.all
            # render json: @questions 
            render :index
        end
    ```

## The Show View

Create a view of `show.html.erb` in `app/views/questions`. Similar to the 
`questions#index` action, the `questions#show` action has an instance
variable of `@question`. Utilize this to build out your `show.html.erb`

1. Create a `h2` of `Question Show Page`
2. Create a container `div` to house the question details:
   - Add a `h3` of the question's `subject`.
   - Add a `p` of the question's `body`.
3. Add a `p` for `Asker:` and list the username for the user who asked 
   the question. (Hint: use the question's associations)
4. Add a link back to the `index.html.erb`
5. Update the `questions#show` action to render the `:show` view
6. Return to `index.html.erb` and add a link to a question's show page
7. Create a `_question.html.erb` partial to dry up the duplicate question detail
   code in your `show.html.erb` and `index.html.erb`

Once you have completed the above call an instructor over for a code review.

## The New Question Form View

Create a view of `new.html.erb` in `app/views/questions`. With this view you 
will be making a HTML `form` that accepts user input for a questions `subject`
and `body`. Upon submission of this form the `questions#create` action will be invoked and should add the submitted question to the database.

1. Create an `h2` of `Ask a Question`.
2. Create a HTML `form` element:
    - Set the action equal to the Rails URL Helper method for the route 
      associated with the `questions#create` action.
    - Set the method to `POST`.
3. Create a `label` and `input` for `Subject:` and `Body:`
    - Set the name of each input to follow the expected parameter format:
        - See `#questions_params` in the `questions_controller.rb` file.
        - ex: `name="questions[subject]"`.
    - Set the value of each input to the corresponding values of the placeholder
      `@question` instance variable created in the `questions#new` 
      action.
4. Add an `input` of type `submit` with the value of `Ask Question`.
5. Update the `questions#new` action to render the `:new` view.
6. In `application.html.erb`, below the heading in the body add an `a` to the 
   `new` view.
7. Visit `localhost:3000/questions/new` and test out your new form. Upon
   submission you should be redirected to the show page of your submitted
   question. 

## The Edit Question Form View

Create a view of `edit.html.erb` in `app/views/questions`. With this form you 
will be creating a way for a user to update the values of an existing question 
(i.e. `subject` and `body`). 

As you have yet to learn the Rails Auth pattern this app does not restrict the 
editability of a question to that of the user who authored the question. As a 
result all questions are currently editable at all times. Next week you will learn how to add these kinds of restrictions.

1. Create a `h2` of `Edit This Question`.
2. Create an HTML `form` element.
    - Set the action equal to the Rails URL Helper method for the route 
      associated with the `questions#update` action.
    - Set the method to `POST` or `GET`.
3. As this form requires a HTML method of `PATCH` and HTML forms can only accept
   methods of `POST` or `GET` you will need to add a hidden input to update the
   method.
   - inside the form add the following HTML hidden input:
   ```HTML
        <input type="hidden" name="_method" value="PATCH" />
   ```
4. Add a `label` and `input` for `Subject:` and `Body:`
    - Make sure the input's values are set to the value of the question being 
      edited. Check the `questions#edit` action to see what instance variable is
      accessible and use that to retrieve the corresponding values.
    - Don't forget to set the name attribute of the inputs with the expected
      parameter format. 
5. Add an `input` of type `submit` with the value of `Edit Question`.
6. Update `questions#edit` to render the `:edit` view.
7. Return to `show.html.erb` and add a link to a question's edit from page above
   the questions index link.
   - NOTE: stacked `a` tags will render side by side as the `a` tag
     is `display: inline` by default. How you might get the links to stack one 
     above the other?
8. Visit `localhost:3000/questions/1/edit` and test out your new edit form. Upon 
   submission you should be redirected to the updated question's show page.

## Deleting a Question

In order to delete a question you will be adding a form to the existing question
`show` page. You will not be making a separate view to delete a question.

This form will be less involved than the `new` and `edit` forms as it is only 
concerned with the removal of a question and therefore does not need inputs for
`Subject` nor `Body`. As long as the form has the correct `@question.id` you 
should be able to successfully remove a question. 

1. At the bottom of your `show.html.erb` view add a HTML `form` element
    - Set the action equal to the Rails URL Helper method for the route 
      associated with the `questions#destroy` action.
    - Set the method to `POST` or `GET`.
2. Similar to the `edit` form, the `delete` form requires a HTML method other 
   than `POST` or `GET`. 
   - Inside the form add a hidden input that sets the form's method to `DELETE`.
3. Add an `input` of type `submit` with the value of `Delete Question`.
4. Visit `localhost:3000` and go to a question show page to test out your new
   delete button.
   - Upon a successful deletion of a question you should be redirected to the  
     question's index page and see that the deleted question is no longer there.

Similar to the editability of a questions all questions can be deleted at any 
time. Again you will learn how to restrict this functionality next week.

Once you have completed the above work call an instructor over for a code 
review.

## BONUS: Create a Users Show with an index of specific user questions
1. Review the work you did to create the question's `show` page and apply the 
   same approach for a user. 
   - The user's `show.html.erb` should live in `app/views/users`.
   - Besure to add an HTML element indicating what page this is and another for
     the user's `username`.
2. Add a `ul` of questions asked by a user. (Hint: think associations).
   - Be sure to add a link for each question to the question's `show` page.
4. Add a link to the questions index.
5. Return to `questions/show.html.erb` and convert the Asker's username to an
   `a` tag that redirects to the user's show page.
3. Once you have the above working consider how you might create an 
   `_index.html.erb` partial to be utilized by both the questions' 
   `index.html.erb` and your new user's `show.html.erb`.
4. Visit `localhost:3000/users/1 and test out your new page!