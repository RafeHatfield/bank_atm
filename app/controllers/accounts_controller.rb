class AccountsController < ApplicationController
  def show
    header_info = { 'token' => session[:token] }
    @response = HTTParty.get("#{ENV['API_URL']}accounts/show", headers: header_info)

    if @response.code == 401
      flash[:error] = 'Invalid Token'
      redirect_to new_session_path
    end
  end

  def withdraw
    header_info = { 'token' => session[:token] }
    # byebug
    response = HTTParty.put("#{ENV['API_URL']}accounts/withdraw/#{params[:accounts][:amount]}", headers: header_info)
    if response.code == 200
      flash[:success] = 'Transaction successful'
    elsif response.code == 401
      flash[:error] = 'Invalid Token'
      redirect_to new_session_path
    else
      flash[:error] = response.parsed_response['transaction_status']
    end
    redirect_to '/accounts/show'
  end
end
