# QuestionsQueue

4. Questions Edit
5. Questions Delete
    - Update Show with the delete link

6. Bonus: Create Users Show with index of specific user questions
    - link to questions show
    - possible refactor to partial for Questions Index

# QuestionsQueue

This project asks you to build views for a questions forum.

## Learning Goals
By the end of this project, you should be able to
* Build Rails views for `index`, `show`, `new`, `edit`, and `delete` 
    - Display class instance attirbutes as values of HTML elements
    - Use a hidden field to set a form's method and actoin
    - Use `form` and `input` HTML elements

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

After you have gone thorugh this initial setup take some time to review the 
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

3. Update the `questions_controller.rb` `index` action to render the `:index` 
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
`questions_controller.rb` `index` action, the `show` action has an instance
varible of `@question`. Utilize this to build out your `show.html.erb`

1. Create an `h2` of the question's `subject`
2. Create a `p` of the question's `body`
3. Add a `label` for `Author` to a `p` of the username for the user who asked 
    the question. (Hint: use the question's associations)
4. Add a link back to the `index.html.erb`
5. Update the `questions_controller.rb` `show` action to render the `:show` view
6. Return to your `index.html.erb` and add a link to a questions' show page
7. Create a `_question.html.erb` partial to dry up the duplicate question code
    in your `show.html.erb` and `index.html.erb`

Once you have completed the above call an instructor over for a code review.

## The New Question Form

Create a view of `new.html.erb` in `app/views/questions`. With this view you 
will be making an HTML `form` that accepts user input for a questions `subject`
and `body`. Upon submission of this form the `questions_controller.rb` action of
`create` will be invoked and should add the submitted question to the database.

1. Create an `h2` of `Ask a Question`
2. Create an html `form` element
    - Set the action equal to the Rails URL Helper method for the route 
      associated with the `questions_controller.rb` `create` action
    - Set the method to `POST`
3. Create a `label` and `input` for `Subject:` and `Body:`
    - Set the name of each input to follow the expected parameter format
        - See `questions_params` in the `questions_controller.rb` file
        - ex: `name="questions[subject]"`
    - Set the value of each input to the corresponding values of the placeholder
      `@question` instance variable created in the `questions_controller` `new` 
      action
4. Add a submit `button` with the value of `Ask Question`
5. Update the `questions_controller.rb` `new` action to render the `:new` view
6. In `application.html.erb`, below the heading in the body add an `a` to the 
    `new` view
7. Visit `localhost:3000` and test out your new form. Upon submission you should
   be redirected to the show page of your submitted question. 

## Edit an existing question

Create a view of `edit.html.erb`