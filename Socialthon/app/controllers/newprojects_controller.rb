class NewprojectsController < ApplicationController
  def index
    @newproject_education=[]
    @newproject_health=[]
    @newproject_poverty=[]
    @newproject_artsandculture=[]
    @newproject_business=[]
    @newproject_foodsecurity=[]

  	@newprojects=current_user.newprojects
    
    @newprojects.each do |newproject|
      if newproject.education==true 
          @newproject_education<<newproject
      end

      if newproject.health==true
          @newproject_health<<newproject
      end

      if newproject.poverty==true
        @newproject_poverty<<newproject 
      end

      if newproject.artsandculture==true
        @newproject_artsandculture<<newproject 
      end

      if newproject.business==true
        @newproject_business<<newproject 
      end

      if newproject.foodsecurity==true
        @newproject_foodsecurity<<newproject 
      end   
    end
  end


  def show
  	@newproject=Newproject.find params[:id]
  
  	if !@newproject.public? && @newproject.user != current_user
			redirect_to :root, alert: "You cannot access that board"
		end
 	  #@hashtags=@newproject.hashtags 
  end

  def create
  	@newproject=current_user.newprojects.create(newproject_params)
  	@newproject.user_id=current_user.id 

  	#@hashtags = @newproject.category.scan(/#\w+/).flatten
  	#hashs=Hashtag.all

  	#@hashtags.each do |hash|
		#if(Hashtag.find_by categorytext: hash)
			#@hashtag = Hashtag.find_by categorytext: hash
		#else
			#@hashtag = Hashtag.create(categorytext: hash)
		#end			
			#@newproject.hashtags << @hashtag
		#end

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
  	#@hashtags=[]
  	#@hashtags = @newproject.category.scan(/#\w+/).flatten
  	#hashs=Hashtag.all

  	#@hashtags.each do |hash|
		#if(Hashtag.find_by categorytext: hash)
			#@hashtag = Hashtag.find_by categorytext: hash
		#else
			#@hashtag = Hashtag.create(categorytext: hash)
		#end			
			#@newproject.hashtags << @hashtag
		#end
  end

  def update
  	@newproject=current_user.newprojects.find params[:id]
  	#@hashtags=@newproject.hashtags

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

  def publicproject
    @publicprojects=[]
    @newprojects=Newproject.all
    @newprojects.each do |project|
      if project.public==true 
        @publicprojects<<project
      end
    end
    @publicproject_education=[]
    @publicproject_health=[]
    @publicproject_poverty=[]
    @publicproject_artsandculture=[]
    @publicproject_business=[]
    @publicproject_foodsecurity=[]
    @publicprojects.each do |publicproject|
      if publicproject.education==true
        @publicproject_education<<publicproject
      end

      if publicproject.health==true
        @publicproject_health<<publicproject
      end

       if publicproject.poverty==true
        @publicproject_poverty<<publicproject
      end

      if publicproject.artsandculture==true
        @publicproject_artsandculture<<publicproject
      end

      if publicproject.business==true
        @publicproject_business<<publicproject
      end

      if publicproject.foodsecurity==true
        @publicproject_foodsecurity<<publicproject
      end
    end

  end

  def privateproject
    @privateprojects=[]
    @newprojects=current_user.projects

    @newprojects.each do |newproject|
      if newproject.public==false
        @privateprojects<<newproject 
      end
    end

    @privateproject_education=[]
    @privateproject_health=[]
    @privateproject_poverty=[]
    @privateproject_artsandculture=[]
    @privateproject_business=[]
    @privateproject_foodsecurity=[]

    @privateprojects.each do |privateproject|
      if privateproject.education==true
        @privateproject_education<<privateproject
      end

      if privateproject.health==true
        @privateproject_health<<privateproject
      end

       if privateproject.poverty==true
        @privateproject_poverty<<privateproject
      end

      if privateproject.artsandculture==true
        @privateproject_artsandculture<<privateproject
      end

      if privateproject.business==true
        @privateproject_business<<privateproject
      end

      if privateproject.foodsecurity==true
        @privateproject_foodsecurity<<privateproject
      end
    end

  end

  def team
    @newproject=Newproject.new
  end



  private
	def newproject_params
			params.require(:newproject).permit(:creator,:title, :category, :description, :public, :individual, :email, :education, :health, :poverty, :artsandculture, :business,:foodsecuritym, :url, :member1, :member2, :member3, :member4, :member5, :team)

	end


end
