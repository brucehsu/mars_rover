# Mars Rover

## Running

Make sure you have Ruby >= 3.1.0 installed:

```
bundle install
bundle exec ruby main.rb # initiate the driver, you can pipe in test data, see following line
# bundle exec ruby main.rb < test_data.txt | diff test_output.txt -
```

## Testing

```
bundle exec rspec specs/*  --format documentation
```
