# Summary

This web API is developed by using Ruby on Rails and PostgreSQL database.

## Install Ruby on Rails and PostgreSQL ##
In this assignment, I use Ruby version 2.4.0 and Rails version 5.0.3

So you will need to setup Ruby on Rails environment and PostgreSQL database depending on your version of operating system as described in the link below.

https://gorails.com/setup/ubuntu/16.04#ruby

*Note: You don't need to setup PostgreSQL with username and password!!


Once you have set the environment.
```
Check your setup in terminal

ruby -v

rails -v
```


## Assignment installation ##
Clone the project and get into api-assigment directory.

```
bundle install

rails db:create

rails db:migrate

rails server
```

Run 'http://localhost:3000' on web browser
Then, you are good to go.


## API document ##
You can list all the routes by typing 'rails routes' in terminal.

| Task | Endpoint | Example |
| :--- | :--- | :--- |
| View all items in the list | GET '/todos' (For HTML)<br>GET '/todos.json' (For JSON) | http://localhost:3000/todos<br>http://localhost:3000/todos.json |
| View a single task in the list | GET '/todos/:id' (For HTML)<br>GET '/todos/:id.json' (For JSON) | http://localhost:3000/todos/1<br>http://localhost:3000/todos/1.json |
| Add a task to the list | POST '/todos' | http://localhost:3000/todos<br><br>JSON object<br>{ subject: "Test Subject", content: "Test Content", status: "pending" } |
| Edit existing task<br>Set the task status | PUT '/todos/:id' (For HTML)<br>PUT '/todos/:id.json' (For JSON)<br>PATCH '/todos/:id' (For HTML)<br>PATCH '/todos/:id.json' (For JSON) | subject cannot be modified to be empty, so as status |
| Delete a task from the list | DELETE '/todos/:id' | It will not delete if there is no task ID in the list |