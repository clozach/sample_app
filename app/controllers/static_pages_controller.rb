class StaticPagesController < ApplicationController
  def home
  	# Rails runs the code here (which is nada), and, absent specific rendering instructions, renders the eponymous view
    # Note: the view is at <controller_name>/<action_name>, i.e., .../sample_app/static_pages/home
  end

  def help
  end

  def about
  end

  def contact
  end
end
