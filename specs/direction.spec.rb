require_relative '../direction'

RSpec.describe Direction do
    it "rotates counter-clockwise through 4 directions" do
      direction = Direction.new(Direction::WEST)
      expect(direction.facing).to eq(Direction::WEST)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::SOUTH)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::EAST)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::NORTH)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::WEST)
    end

    it "rotates clockwise through 4 directions" do
      direction = Direction.new(Direction::NORTH)
      expect(direction.facing).to eq(Direction::NORTH)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::EAST)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::SOUTH)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::WEST)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::NORTH)
    end

    context "rorate_clockwise with offset" do
      it "rotates from NORTH to NORTH when given offset 8" do
        direction = Direction.new(Direction::NORTH)
        expect(direction.facing).to eq(Direction::NORTH)
        direction.rotate_clockwise(8)
        expect(direction.facing).to eq(Direction::NORTH)
      end

      it "rotates from NORTH to SOUTH when given offset 6" do
        direction = Direction.new(Direction::NORTH)
        expect(direction.facing).to eq(Direction::NORTH)
        direction.rotate_clockwise(6)
        expect(direction.facing).to eq(Direction::SOUTH)
      end

      it "rotates from NORTH to NORTH when given offset -8" do
        direction = Direction.new(Direction::NORTH)
        expect(direction.facing).to eq(Direction::NORTH)
        direction.rotate_clockwise(-8)
        expect(direction.facing).to eq(Direction::NORTH)
      end

      it "rotates from NORTH to SOUTH when given offset -6" do
        direction = Direction.new(Direction::NORTH)
        expect(direction.facing).to eq(Direction::NORTH)
        direction.rotate_clockwise(-6)
        expect(direction.facing).to eq(Direction::SOUTH)
      end
    end
  end
  