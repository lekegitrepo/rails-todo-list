class WelcomeController < ApplicationController
  def index
    @tasks = ['Reading', 'Writing', 'Creating', 'Washing']
  end
end
