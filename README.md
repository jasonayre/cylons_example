### Install ZK, and zeromq, Clone and run the examples

```
git clone https://github.com/jasonayre/cylons_demo
```

open 2 new terminal windows/tabs

*Prepare & start the fake user credentials service, identify*
```
cd identify
bundle exec rake db:create && rake db:migrate && rake db:seed
bundle exec cylons start
```

*cd into admin service in other window, launch console and run some commands*

``` ruby
cd static_admin
bundle
RPC=1 bundle exec rails c
```

*Then run some rails console commands on the remote cylons service*
``` ruby
User.all
User.first
u = User.create(:name => "asdasd", :email => "bill@initech.com")
u.name = "blumbergh"
u.save

u = User.create(:name => "asdasd", :email => "asdasd@asdasd.com", :password => "asdasd")
{:error=>"unknown attribute: password"}

u = User.create(:email => "asdasd@asdasd")
puts u.errors
#<ActiveModel::Errors:0x343a4ddd @base=#<User created_at: nil, email: "asdasd@asdasd", id: nil, name: nil, updated_at: nil>, @messages={:name=>["can't be blank", "can't be blank"]}

users = User.search(:name => "blumbergh")
[#<User created_at: "2014-11-04 22:23:10.697000", email: "bill@initech.com", id: 2013, name: "blumbergh", updated_at: "2014-11-04 22:23:25.993000">]

#(when ::Cylons::RemotePagination included into remote model, results will be a will paginate collection)
users.current_page

#dont know why this isnt returning integer thats a bug..
users.current_page
 => page 1
```

*Start Zookeeper, and start each service up with:*
```
bundle exec cylons start
```
