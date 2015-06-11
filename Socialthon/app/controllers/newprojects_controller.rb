class NewprojectsController < ApplicationController
   before_action :authenticate_user!
 


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
			redirect_to :root, alert: "You cannot access that project!"
		end

  end

  def create
  	@newproject=current_user.newprojects.create(newproject_params)
  	@newproject.user_id=current_user.id 

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
    @newprojects=current_user.newprojects

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
    @teamprojects=[]
    @newprojects=Newproject.all
    @newprojects.each do |project|
      if project.team==true
        @teamprojects<<project
      end
    end
    @teamproject_education=[]
    @teamproject_health=[]
    @teamproject_poverty=[]
    @teamproject_artsandculture=[]
    @teamproject_business=[]
    @teamproject_foodsecurity=[]

    @teamprojects.each do |teamproject|
      if teamproject.education==true
        @teamproject_education<<teamproject
      end

      if teamproject.health==true
        @teamproject_health<<teamproject
      end

       if teamproject.poverty==true
       @teamproject_poverty<<teamproject
      end

      if teamproject.artsandculture==true
        @teamproject_artsandculture<<teamproject
      end

      if teamproject.business==true
        @teamproject_business<<teamproject
      end

      if teamproject.foodsecurity==true
        @teamproject_foodsecurity<<teamproject
      end
    end
  end

  def individual
    @individualprojects=[]
    @newprojects=Newproject.all
    @newprojects.each do |project|
      if project.team==true
        @individualprojects<<project
      end
    end
    @individualproject_education=[]
    @individualproject_health=[]
    @individualproject_poverty=[]
    @individualproject_artsandculture=[]
    @individualproject_business=[]
    @individualproject_foodsecurity=[]

    @individualprojects.each do |individualproject|
      if individualproject.education==true
        @individualproject_education<<individualproject
      end

      if individualproject.health==true
        @individualproject_health<<individualproject
      end

       if individualproject.poverty==true
       @individualproject_poverty<<individualproject
      end

      if individualproject.artsandculture==true
        @individualproject_artsandculture<<individualproject
      end

      if individualproject.business==true
        @individualproject_business<<individualproject
      end

      if individualproject.foodsecurity==true
        @individualproject_foodsecurity<<individualproject
      end
    end
  end

  


  private
	def newproject_params
			params.require(:newproject).permit(:creator,:title, :category, :description, :public, :individual, :email, :education, :health, :poverty, :artsandculture, :business,:foodsecuritym, :url, :member1, :member2, :member3, :member4, :member5, :team)
	end


end
