class ApplicationController < ActionController::Base
    Pagy::DEFAULT[:items] = 9
    include Pagy::Backend
    require "pagy/extras/bootstrap"
end
