## Database設計

## users
**association**
- has_many :messages
- has_many :group_users
- has_many :groups through: :group_users

|culumns  |type   |
|---------|-------|
|password |text   |
|group_id |integer|


## messages
**association**
- belongs_to :user
- belongs_to :group

|culumns  |type   |
|---------|-------|
|text     |text   |
|image    |string |
|user_id  |integer|
|group_id |integer|

## groups
**association**
- has_many :messages
- has_many :group_users
- belongs_to :users through: :group_users

|columns  |type   |
|---------|-------|
|name     |string|


## group_users
**association**
- belongs_to :user
- belongs_to :group

|columns  |type   |
|---------|-------|
|user_id  |integer|
|group_id |integer|

