module InitiativesHelper

  def list_portfolios(initiative_id)
    #get the portfolios the user has access to
    portfolios=Portfolio.list_by_user
    i_exists=Initiative.exists?(initiative_id)
    i=nil
    if i_exists  then
       i=Initiative.find(initiative_id)
    end
    retval=""
    portfolios.each do |p|
      sel=""
      if i_exists
        if i.portfolios.where("id=?",p.id).count()!=0 then
          sel="selected"
        end
      end
      retval+= "<option value=\"#{p.id}\"#{sel}>#{p.title}"
    end
    retval.html_safe
  end

end
