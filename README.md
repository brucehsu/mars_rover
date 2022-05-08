# Mars Rover

## Attention!

This branch contains an unnecessary optimisation on batching all instructions and update MarsRover's operation logic.
The reason why this is unnecessary, is that if the rover already knews it's going to lose signal, why bother to go beyond signal coverage?

## Running

Make sure you have Ruby >= 3.1.0 installed:

```
bundle install
bundle exec ruby main.rb # initiate the driver, you can pipe in test data, see Testing
```

## Testing

```
bundle exec rspec specs/*  --format documentation
bundle exec ruby main.rb < test_data.txt | diff test_output.txt -
```
