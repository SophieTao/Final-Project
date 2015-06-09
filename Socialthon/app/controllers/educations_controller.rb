class EducationsController < ApplicationController
def index
	@educations = Education.all
end
end