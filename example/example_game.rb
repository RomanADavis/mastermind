# /example/example_game.rb
require_relative "../lib/mastermind.rb"

puts "What's you're name?"
name = gets.chomp
player = Mastermind::Player.new({name: name, role: "breaker"})
Mastermind::Game.new(player).play