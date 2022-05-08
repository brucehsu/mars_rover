require_relative '../rover'

RSpec.describe MarsRover do
    context 'movement' do 
        it "moves 4 towards north from (2, 1) and ended up at (2, 5)" do
            rover = MarsRover.new(2, 1, Direction::NORTH)
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
            rover = MarsRover.new(2, 1, Direction::NORTH)
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
            rover = MarsRover.new(2, 1, Direction::NORTH)
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

        it "heads south from (2, 1), then heads south, and ended up at (2, 1)" do
            rover = MarsRover.new(2, 1, Direction::NORTH)
            rover.rotate_left
            rover.rotate_left
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 0
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: -1
            })
            rover.rotate_right
            rover.rotate_right
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 0
            })
            rover.forward
            expect(rover.coordinate).to eq({
                x: 2,
                y: 1
            })
        end
    end
  end
  