class FrontofficeController < ApplicationController
	before_action :authenticate_user!
	layout "frontoffice"
end
