class NewprojectsController < ApplicationController
  def index
  	@newprojects=Newproject.all 
  end

  def show
  	@newproject=Newproject.find params[:id]
  
  	if !@newproject.public? && @newproject.user != current_user
			redirect_to :root, alert: "You cannot access that board"
		end
 	@hashtags=@newproject.hashtags 


  end

  def create
  	@newproject=current_user.newprojects.create(newproject_params)
  	@newproject.user_id=current_user.id 
  	@hashtags = @photo.caption.scan(/#\w+/).flatten
  	hashs=Hashtag.all

  	@hashtags.each do |hash|
		if(Hashtag.find_by text: hash)
			@hashtag = Hashtag.find_by text: hash
		else
			@hashtag = Hashtag.create(text: hash)
		end			
			@newproject.hashtags << @hashtag
		end

  	if @newproject.save
  		redirect_to user_newproject_path(current_user, @newproject)
  	else
  		render 'new'
  	end
  	
  end


  def new 
  	@newproject=Newproject.new
  end

  def edit
  	@newproject=Newproject.find params[:id]

  end

  def update

  	@newproject=current_user.newprojects.find params[:id]
		if @newproject.update(newproject_params)
			redirect_to user_newproject_path(current_user, @newproject)
		else
			render 'edit'
		end

  end

  def destroy

  		@newproject=current_user.newprojects.find params[:id]
		@newproject.destroy 

		redirect_to user_newprojects_path(current_user)
  end

  	private
	def newproject_params
			params.require(:newproject).permit(:creator,:title, :category, :description, :public, :individual, :email)
	end


end
