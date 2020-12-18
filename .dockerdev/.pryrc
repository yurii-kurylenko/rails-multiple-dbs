# frozen_string_literal: true

require "awesome_print"
AwesomePrint.pry!

if ENV["HISTFILE"]
  hist_dir = ENV["HISTFILE"].sub(/\/[^\/]+$/, "")
  Pry.config.history.should_save = true
  Pry.config.history.file = File.join(hist_dir, ".pry_history")
end
