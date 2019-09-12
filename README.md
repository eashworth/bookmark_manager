#Bookmark Manager

@@ -25,13 +25,23 @@ Clone this repo and then run

```
bundle
```

### To set up the database:

Connect to 'psql' and create the 'bookmark manager' and 'bookmark_manage_test' databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to each database in 'psql' and run the SQL scripts in the 'db/migrations' folder in the given order.

### To run the BookmarkManager app:

```
rackup -p3000
```

To view bookmarks, navigate to 'localhost:3000/bookmarks'.

### To run tests:

```
rspec
```
### To run linting:
```
rubocop
```




User story 1:

As a user browsing the internet,
I would like to be able to recall the URLs of websites
by viewing a list of bookmarks.

Domain model:
This was my attempt at a domain model for this story:

List class          Bookmark class

        <--stored as--- bookmark
List    <--stored as--- bookmark
        <--stored as--- bookmark

The walkthrough suggests a single-class model, that does not use a list class.
Calling the method .all on the Bookmark class returns a list of all bookmarks.

The full suggested domain model:

Client          Controller            Model             View

  --get request->      -----all---->
                                     Bookmark
/bookmarks        app <-[bookmarks]-       


  <--response---

                    -----------[bookmarks]----------->
                                                    erb bookmarks
                    <--------------html---------------

User visits '/bookmarks'
Browser sends get request to app
Controller asks app for all bookmarks (app asks Bookmark class for Bookmark.all).
Bookmark class retrieves all bookmarks and returns them to controller.
Controller renders array of bookmarks to a webpage
Controller sends webpage as response to user.

So this requires:
  a Controller
  a Bookmark class
  a bookmark view
