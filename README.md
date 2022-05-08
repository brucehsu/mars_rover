# Mars Rover

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

## Optimising performance

Initial efforts can be found in branch `feature/forward_optimisation`. It still hasn't been merged into main branch for 2 reasons:

1. The optimisation complicates the logic, making it hard to test and verify.
2. Most importantly, it begs the question: if the rover already knew it's going to lose signal in the first, why bother to go beyond signal coverage? We can handle signal loss before it every happened, which changes the given assumption of this project.
