# SmartSeeds
Gem for auto-smart generating the seeds in Rails app. 
It defines type of each column in a model and generates random values for these fields. 

## Usage

For example `Entity` model has `name(String)`, `age(Integer)`, `is_human(Boolean)` attributes.

All you need to do is execute this command:  `SmartSeeds.(Entity)`
```
> SmartSeeds.(Entity)
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "entities" ("id", "name", "age", "is_human", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["id", 369], ["name", "Heil"], ["age", 344], ["is_human", false], ["created_at", 2017-01-15 16:10:50 UTC], ["updated_at", 2017-01-15 16:10:50 UTC]]
   (1.8ms)  commit transaction
 => true 

```
And we've got an object in a database:
```
> Entity.last
  Entity Load (0.2ms)  SELECT  "entities".* FROM "entities" ORDER BY "entities"."id" DESC LIMIT ?  [["LIMIT", 1]]
 => #<Entity id: 1, name: "Heil", age: 344, is_human: false, created_at: "2017-01-15 16:10:50", updated_at: "2017-01-15 16:10:50"> 

```
### Override default values
If you want to override some default values, you can send it as a hash:

```
> SmartSeeds.(Entity, {name: 'Aleah'})
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "entities" ("id", "name", "age", "is_human", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["id", 167], ["name", "Aleah"], ["age", 374], ["is_human", false], ["created_at", 2017-01-15 16:15:15 UTC], ["updated_at", 2017-01-15 16:15:15 UTC]]
   (1.6ms)  commit transaction
 => true 
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'smart_seeds'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install smart_seeds
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## To do
- [ ] Solve a problem with enum(now need to override value manually if model has enums)
- [ ] Supports foreign_keys
- [ ] Skip id, created_at, updated_at