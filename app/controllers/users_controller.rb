class UsersController < ApplicationController

  before_filter :get_user, :only=>[:index, :new, :edit]
  before_filter :accessible_roles, :only =>[:new, :edit, :show, :update, :create]
  load_and_authorize_resource  :only =>[:show, :new,:destroy,:edit,:update]

  #GET /users
  #GET /users.json
  #GET /users.xml
#--------------------------------------------------------------------------------------------------------
  def index
    @users = User.all
    #User.accessible_by(current_ability,:index)
    respond_to do |format|

      format.json {render :json => @users}
      format.xml {render :xml => @users}
      format.html

    end
  end

  #GET /user/new
  #GET /user/new.json
  #GET /user/new.xml
#--------------------------------------------------------------------------------------------------------
  def new

    respond_to do |format|

      format.json {render :json => @users}
      format.xml {render :xml => @users}
      format.html

    end
  end

  #POST /users
  #POST /users.json
  #POST /users.xml
#--------------------------------------------------------------------------------------------------------
  def create
    @user = User.new(params[:user])

    if @user.save

      respond_to do |format|

        format.json {render :json => @users}
        format.xml {head :ok}
        format.html{redirect_to users_path, notice: "User successfully created!" }

      end
    else

      respond_to do |format|

        format.json {render :text => "Could not create user"}
        format.xml {head :ok}
        format.html {redirect_to :Action=> :new, :status => :unprocessable_entity}

      end

    end

  end


  #GET /users/:id
  #GET /users/:id.json
  #GET /users/:id.xml
#--------------------------------------------------------------------------------------------------------
  def show
    @user = User.find(params[:id])

    respond_to do |format|

      format.json {render :json =>@user}
      format.xml {render :xml => @user}
      format.html #show.html.haml

    end
  end

  #GET /users/:id/edit
  #GET /users/:id/edit.xml
  #GET /users/:id/edit.json
#--------------------------------------------------------------------------------------------------------
  def edit
    respond_to do |format|

      format.json {render :json =>@user}
      format.xml {render :xml => @user}
      format.html #edit.html.haml

    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  #DELETE /users/:id
  #DELETE /users/:id.xml
  #DELETE /users/:id.json
#--------------------------------------------------------------------------------------------------------
  def destroy
    @user.destroy

    respond_to do |format|

      format.json {render text: "Successfully removed user"}
      format.xml {head :ok}
      format.html  {redirect_to users_path, notice:"Successfully removed user"}

    end
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json,:xml,:html)
  end

  #PUT /users/:id
  #PUT /users/:id.json
  #PUT /users/:id.xml
#--------------------------------------------------------------------------------------------------------
  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p)}
    else
      @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end

    respond_to do |format|
      if @user.errors[:base].empty? and @user.update_attributes(params[:user])
        format.json {render :json => @user, :status => 200}
        format.xml {head :ok}
        format.html {redirect_to action: :index, notice: "User successfully updated!"}
      else
        format.json {render :text => "Could not update user", :status=>:unprocessable_entity }
        format.xml {head :ok}
        format.html {redirect action: :edit, :status => :unprocessable_entity }
      end
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json,:xml,:html)
  end

  def accessible_roles
          @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  def get_user
         @current_user = current_user
  end


end