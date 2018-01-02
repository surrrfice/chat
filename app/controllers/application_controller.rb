class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper#SessionsHelperをすべてのコントローラーから呼び出し可能。
end
