class Api::V1::RefreshController < ApiController
   

  def create

    # user = User.find_by(email: params[:user][:email])
    # if user
    user = User.find_by( id:  params['usernameid'])
      if 1 == 1
        render json: { token: JsonWebToken.encode(sub: user.id, role: user.role, username: user.username ),
           refreshToken: JsonWebToken.refr(id: user.id)
        }
         
      else
          
      end
    # else
    #   render json: { errors: "Емайл не зарегистрирован." }
    # end
  end
 
 end