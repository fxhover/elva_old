#encoding: utf-8
require 'oj'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    return render_json(true, '欢迎使用')
  end

  private

  def return_403_result(msg = '没有权限')
    render status: 403, json: result(false, msg)
  end

  def result_json(status, data)
    result = {status: status, result: data}
    Oj.dump result, mode: :compat
  end

  def render_json(status, data)
    render status: 200, json: result_json(status, data)
  end
end
