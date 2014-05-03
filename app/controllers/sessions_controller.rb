class SessionsController < ApplicationController
  def new
  end

  def create
    header_info = { 'card_number' => params[:account][:card_number], 'pin' => params[:account][:pin] }
    response = HTTParty.post("#{ENV['API_URL']}accounts/authenticate", headers: header_info)

    if response.code == 200
      session[:token] = response.parsed_response['token']
      flash[:success] = response.parsed_response['message']
      redirect_to '/accounts/show'
    else
      flash[:error] = response.parsed_response['message']
      redirect_to new_session_path
    end
  end

  def destroy
    session[:token] = nil
    redirect_to new_session_path
  end
end
