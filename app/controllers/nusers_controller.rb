class NusersController < ApplicationController
  include Devise::Controllers::Helpers
  
  #define method for render the different layouts
  def homepage
    if current_nuser and current_nuser.role == "admin"
      render "layouts/adminpage"
    elsif current_nuser and current_nuser.role == "merchant"
      render "layouts/merchantpage"
    end
  end
end
