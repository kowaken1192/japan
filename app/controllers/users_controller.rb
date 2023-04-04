class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
 
    def index
      @users = User.all
    
    end
  
    def new
    @user = User.new
   
    
  
    end
  
    def create
    @user = User.new(params.require(:user).permit(:title, :start_date, :end_date,:all_day , :schedule))
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users
    else
      render :new, status: :unprocessable_entity
     end
   end
    

  
    def show
      @user = User.find_by(id: params[:id])
      if @user.nil?
        flash[:error] = "ユーザーが見つかりませんでした"
        redirect_to users_path
      end
    end
    def edit
      @user = User.find(params[:id])
    end
    def update
      @user = User.find(params[:id])
      if @user.update(params.require(:user).permit(:title,:start_date,:end_date,:all_day,:schedule))
      flash[:notice] = "あなたは「#{@user.id}」」の情報を更新しました"
      redirect_to :users
      else
        render = "edit"
      end
      def destroy
        @user.destroy
       
        respond_to do |format|
          format.html { redirect_to @project, notice: "ユーザーを削除しました.", status: :see_other }
          format.json { head :no_content }
          if @user.update(params.require(:user).permit(:title,:start_date,:end_date,:all_day,:schedule))
          
        
        end
      end
      unless @user.nil?
        @user.destroy
      end
      
   
  
    end
  end 
    
  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "ユーザーを削除しました." }
      format.json { head :no_content }
      
    
    end
  end


  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:title, :start_date, :end_date, :all_day, :schedule)
    end
end 
def sign_up_process
  user = User.new(user_params)
  p user.title
  p user.email
  p user.password
  p user.valid?
  p user.errors.messages
  user.errors.messages.each do |key, messages|
    p key
    messages.each do |message|
      p message
    end
  end
end


