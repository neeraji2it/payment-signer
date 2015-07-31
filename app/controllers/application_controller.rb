class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!


protected

  ActiveAdmin::ResourceController.class_eval do
    def find_resource
      if resource_class.is_a?(FriendlyId)
        scoped_collection.where(slug: params[:id]).first!
      else
        scoped_collection.where(id: params[:id]).first!
      end
    end
  end

private

  def generated_token
    loop do
      token = SecureRandom.urlsafe_base64(32)
      break token unless Payment.exists?(token: token)
    end
  end
  helper_method :generated_token
end
