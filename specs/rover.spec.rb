require_relative '../rover'

RSpec.describe MarsRover do
    context 'movement' do 
        it "moves 4 towards north from (2, 1) and ended up at (2, 5)" do
            rover = MarsRover.new(2, 1, Direction::NORTH, 4, 8)
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 2
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 3
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 4
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 5
            })
        end

        it "runs a clockwise circle from (2, 1) and ended up at (2, 1)" do
            rover = MarsRover.new(2, 1, Direction::NORTH, 4, 8)
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 2
            })
            rover.rotate_right
            rover.forward
            expect(rover.coordinate).to eq({
                x: 3,
                y: 2
            })
            rover.rotate_right
            rover.forward
            expect(rover.coordinate).to eq({
                x: 3,
                y: 1
            })
            rover.rotate_right
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 1
            })
        end

        it "runs a counter-clockwise circle from (2, 1) and ended up at (2, 1)" do
            rover = MarsRover.new(2, 1, Direction::NORTH, 4, 8)
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 2
            })
            rover.rotate_left
            rover.forward
            expect(rover.coordinate).to eq({
                x: 1,
                y: 2
            })
            rover.rotate_left
            rover.forward
            expect(rover.coordinate).to eq({
                x: 1,
                y: 1
            })
            rover.rotate_left
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 1
            })
        end

        it "heads south from (2, 2), then heads south, and ended up at (2, 1)" do
            rover = MarsRover.new(2, 2, Direction::NORTH, 4, 8)
            rover.rotate_left
            rover.rotate_left
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 1
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 0
            })
            rover.rotate_right
            rover.rotate_right
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 1
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 2
            })
        end
    end

    context 'signal lost' do 
        it "returns last known location if went off valid grid (x < 0)" do
            rover = MarsRover.new(2, 2, Direction::WEST, 4, 8)
            rover.forward
            rover.forward
            expect(rover.lost?).to eq(false)
            expect(rover.coordinate).to eq({
                x: 0,
                y: 2
            })
            rover.forward
            expect(rover.lost?).to eq(true)
            expect(rover.coordinate).to eq({
                x: 0,
                y: 2
            })
        end

        it "returns last known location if went off valid grid (x > m)" do
            rover = MarsRover.new(2, 2, Direction::EAST, 4, 8)
            rover.forward
            rover.forward
            expect(rover.lost?).to eq(false)
            expect(rover.coordinate).to eq({
                x: 4,
                y: 2
            })
            rover.forward
            expect(rover.lost?).to eq(true)
            expect(rover.coordinate).to eq({
                x: 4,
                y: 2
            })
        end

        it "returns last known location if went off valid grid (y < 0)" do
            rover = MarsRover.new(2, 2, Direction::SOUTH, 4, 8)
            rover.forward
            rover.forward
            expect(rover.lost?).to eq(false)
            expect(rover.coordinate).to eq({
                x: 2,
                y: 0
            })
            rover.forward
            expect(rover.lost?).to eq(true)
            expect(rover.coordinate).to eq({
                x: 2,
                y: 0
            })
        end

        it "returns last known location if went off valid grid (y > n)" do
            rover = MarsRover.new(2, 2, Direction::NORTH, 4, 4)
            rover.forward
            rover.forward
            expect(rover.lost?).to eq(false)
            expect(rover.coordinate).to eq({
                x: 2,
                y: 4
            })
            rover.forward
            expect(rover.lost?).to eq(true)
            expect(rover.coordinate).to eq({
                x: 2,
                y: 4
            })
        end
    end
  end
  