module InitiativesHelper

  def list_portfolios(initiative_id)
    #get the portfolios the user has access to
    i_exists=Initiative.exists?(initiative_id)

    i=nil
    if i_exists  then
       i=Initiative.find(initiative_id)
       portfolios=Portfolio.list_by_user_based_on_phase(session[:user_id],i.phase_id)
    else
      portfolios=Portfolio.list_by_user(session[:user_id])
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

  def display_portfolios(initiative)
    retval=""
    initiative.portfolios.each do |p|
       retval+=", #{p.title}"
    end
    retval
  end
end
