#Lucky Draw webapp
a simple web app for lucky draw

![screenshot](https://raw.githubusercontent.com/amirulabu/luckydraw/master/screenshot.png)

----
## Setup

* Rails 5.0.1
* PostgreSQL

----
## Structure

Model

* User - user that manages the lucky draw; data entry, draw the lucky draw. Have 2 stages, admin and super admin. Admin can CRUD person. Super admin can CRUD person and draw the lucky draw.

* Person - a pool of people that will be drawn and if lucky might win the lucky draw

* Winner - got chosen as a lucky draw winner. will be deleted from Person to ensure no repetitive draws. 

Views

* Model views
* Pages - index and show

Controller

* Most of the controller stuff is in the pages index.
* Lucky draw method using People.all.shuffle.first

----
## What i can improve

* Needs refactoring
* Use turbolinks/ajax
* Use less Models(?) - use Person only, no need Winner


