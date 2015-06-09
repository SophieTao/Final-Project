class PovertiesController < ApplicationController
def index
	@poverties = Poverty.all
end
end