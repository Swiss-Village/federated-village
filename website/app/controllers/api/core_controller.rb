class Api::CoreController < ApplicationController
  def information
    binder = DataLayer::Binders::Information.new

    render :json => binder.build
  end

  def status

  end

  def features

  end
end
