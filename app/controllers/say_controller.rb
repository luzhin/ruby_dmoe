class SayController < ApplicationController
  def hello
    @name = "Иннокентий"
    @len = @name.length
  end
end
