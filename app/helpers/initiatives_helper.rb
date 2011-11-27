module InitiativesHelper
  def list_portfolios(initiative_id)
    #get the porfolios the user has access to
     portfolios=Portfolio.list_by_user

    #Create a multiple choice listbox
    retval="<select name=\"initiative[portfolios]\" MULTIPLE SIZE=\"#{portfolios.count()}\">"
    portfolios.each do |p|
      retval+= "<option value=\"#{p.id}\"#{is_selected(initiative_id,p.id}>#{p.title}"
    end
    retval+="</select>"
    retval.html_safe
  end

  private

  def is_selected

  end
end
