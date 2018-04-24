class PagesController < ApplicationController


  def hello
  # Rails will redirect to app/views/pages(controllers's name)/hello(action's name).html.erb atuomatically,
  # so we don't need below two lines anymore:
    # render plain: "<h1>你好，世界！</h1>"
    # puts "---- 你好 ----"

  render json: params
  end
end
