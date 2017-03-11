== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## Database設計

## users
**association**
-has_many :messages
-has_many :group_users
-has_many :groups through: :group_users

|culumns  |type   |
|---------|-------|
|id       |integer|
|name     |string |
|email    |text   |
|password |text   |
|group_id |integer|


## messages
**association**
-belongs_to :user
-belongs_to :group

|culumns  |type   |
|---------|-------|
|id       |integer|
|text     |text   |
|image    |text   |
|user_id  |integer|
|group_id |integer|
|timestamp|       |

## groups
**association**
has_many :messages
has_many :group_users
belongs_to :users through: :group_users

|columns  |type   |
|---------|-------|
|id       |integer|
|group_name|string|
|menber   |string |


## group_users
**association**
belongs_to :user
belongs_to :group

|columns  |type   |
|---------|-------|
|id       |integer|
|user_id  |integer|
|group_id |integer|








#users_table
  #association
  -belongs_to :groups
  -has_many :messages
  -has

  #columns
  -id
  -name
  -group_id
  -

#messages_table
  #assosiation
  -belongs_to :users
  -belongs_to :groups


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


































