# Views Questions

1. Questions Index
2. Questions Show
    - update Index with links to Show pages
    - create questions partial and update Index and Show views to use partial
3. Questions New
4. Questions Edit
5. Questions Delete
    - Update Show with the delete link

6. Bonus: Create Users Show with index of specific user questions
    - link to questions show
    - possible refactor to partial for Questions Index

# Questions App

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

## The Index View

Start by creating a view of `index.html.erb` in `app/views/questions`. As you 
will have noted from your review of the `questions_controller.rb`, you have 
access to an instance variable of `@questions`. `@questions` has all of the 
question data you need to render an index of all questions.

1. Give your index an h1 of `Questions Index`

2. Create an unordered list of questions. Each question should include:
    - An `h1` of the question's `subject`
    - A `p` of the question's body

