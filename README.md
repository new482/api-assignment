# Summary

This web API is developed by using Ruby on Rails and PostgreSQL database.

Any questions or troubles in setting up the web api, please feel free to contact me.

Email/Google Hangout: new482@gmail.com

Tel: 084 499 5291

## Install Ruby on Rails and PostgreSQL ##
In this assignment, I use Ruby version 2.4.0 and Rails version 5.0.3

So you will need to setup Ruby on Rails environment and PostgreSQL database depending on your version of operating system as described in the link below.

https://gorails.com/setup/ubuntu/16.04#ruby

*Note: You don't need to setup PostgreSQL with username and password!!


Once you have set the environment. 
Check your setup in terminal.

```
ruby -v

rails -v
```


## Assignment installation ##
Clone the project and get into api-assignment directory.

```
bundle install

rails db:create

rails db:migrate

rails server
```

Run 'http://localhost:3000' on web browser. 
Then, you are good to go.


## API document ##
You can list all the routes by typing 'rails routes' in terminal.

| Task | Endpoint | Example |
| :--- | :--- | :--- |
| View all items in the list | __GET__ '/todos' (_For HTML_)<br>__GET__ '/todos.json' (_For JSON_) | http://localhost:3000/todos<br>http://localhost:3000/todos.json |
| View a single task in the list | __GET__ '/todos/:id' (_For HTML_)<br>__GET__ '/todos/:id.json' (_For JSON_) | http://localhost:3000/todos/1<br>http://localhost:3000/todos/1.json |
| Add a task to the list | __POST__ '/todos' | http://localhost:3000/todos<br><br>JSON object<br>{ subject: "Test Subject", content: "Test Content", status: "pending" } |
| Edit existing task<br>Set the task status | __PUT__ '/todos/:id' (_For HTML_)<br>__PUT__ '/todos/:id.json' (_For JSON_)<br>__PATCH__ '/todos/:id' (_For HTML_)<br>__PATCH__ '/todos/:id.json' (_For JSON_) | http://localhost:3000/todos/1<br>http://localhost:3000/todos/1.json<br><br>Subject cannot be modified to be empty, so as status |
| Delete a task from the list | __DELETE__ '/todos/:id' (_For HTML_)<br>__DELETE__ '/todos/:id.json' (_For JSON_) | http://localhost:3000/todos/1<br>http://localhost:3000/todos/1.json<br><br>It will not delete if there is no task ID in the list |


## Test API ##
### Run the test case ###

Go to api-assignment directory.

```
rails test
```

You should see no failure in all the 13 test cases.

### Test with Postman ###
You can simply use Postman application to test this web api.

## Side Note ##
If you have experienced in console/command line hanging, please type this in terminal.

```
bin/spring stop
```

This is known issue on version of Spring gem.