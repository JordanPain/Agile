class PageController < ApplicationController
  def home
  end

  def browse
    page = params[:page]
    limit = 10
    whereString = ""
    whereArray = [whereString]

    if params[:byCity] == "yes"
      @byCity = true
      whereString << "city = ?"
      whereArray << ['Spokane']
      if params[:male] == "yes" or params[:female] == "yes"
        whereString << " AND ("
      end
    end
    if params[:male] == "yes"
      @male = true
      whereString << " gender = 'male'"
      if params[:female] == "yes"
        whereString << " OR"
      end
    end
    if params[:female] == "yes"
      @female = true
      whereString << " gender = 'female'"
    end
    if @byCity == true && (@male == true || @female == true)
      whereString << ")"
    end

    @users = User.all.where(whereArray).page(page).per(limit)
  end

  def match
  end

  def profile
  end

  def support
  end

  def contact_us
  end
end
