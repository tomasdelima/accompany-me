class Api::FrontController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sign_in_user
    begin
      user = User.find_or_create_by!(email: params[:email], facebook_id: params[:facebookId])
      sign_in(user)
      render json: [:contacts, :friends, :all_activities, :all_accompaniments, :all_experiences, :all_learnings].reduce({}) {|m, f| m[f] = user.send(f); m}
    rescue
      render json: false
    end
  end
end
