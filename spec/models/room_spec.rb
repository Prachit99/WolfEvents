# spec/models/room_spec.rb
require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'is not valid without room_loc' do
    room = Room.new(room_cap: 10)
    expect(room).to_not be_valid
  end

  it 'is not valid without room_cap' do
    room = Room.new(room_loc: 'Room A')
    expect(room).to_not be_valid
  end

  # it 'is not valid with a negative room_cap' do
  #   room = Room.new(room_loc: 'Room A', room_cap: -5)
  #   expect(room).to_not be_valid
  # end

  # it 'is not valid with a non-numeric room_cap' do
  #   room = Room.new(room_loc: 'Room A', room_cap: 'abc')
  #   expect(room).to_not be_valid
  # end

  # it 'is not valid with reserved set to nil' do
  #   room = Room.new(room_loc: 'Room A', room_cap: 10, reserved: nil)
  #   expect(room).to_not be_valid
  # end

  it 'is valid with valid attributes' do
    room = Room.new(room_loc: 'Room A', room_cap: 10, reserved: false)
    expect(room).to be_valid
    end
  end