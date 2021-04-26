# Ruby life game
code for test for produce pay

## Prerequisites
Ruby version 2.6.6 is the version used, you can install as system ruby, or with either `rvm, rbenv`

## Setup

1. Clone this repo locally.
2.  install gems with `bundle install`

## Testing

Tests are run using Minitest and can be executed via:

`rake run test`

> ***NOTE:*** No tests have been written at this time :(

## Execution

To execute the code, currently, you will have to open the irb console, and:

1. `require_relative './game.rb'`
2. initialze the game variable, with both the initial state, and the series amount to run for
3. call `.run` on the Game instance
