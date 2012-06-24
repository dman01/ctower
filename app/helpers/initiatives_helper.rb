module InitiativesHelper

  def list_portfolios(initiative_id)
    #get the portfolios the user has access to
    i_exists=Initiative.exists?(initiative_id||-1)

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




    def list_phases(initiative)
    #get the phases for the process associated with the portfolio
    phases=initiative.portfolio.portfolio_process.phases
    retval=""
    phases.each do |p|
      sel=""
      if p.id == initiative.phase_id then
        sel="selected"
      end
      retval+= "<option value=\"#{p.id}\"#{sel}>#{p.title}"
    end
    retval.html_safe
    end

  def list_portfolio_phases(portfolio_id)
    #get the phases for the process associated with the portfolio
    phases=Portfolio.find(portfolio_id).portfolio_process.phases
    retval=""
    count=0
    phases.each do |p|
      if count==0
        count=1
        retval+= "<option value=\"#{p.id}\" selected>#{p.title}"
      else
        retval+= "<option value=\"#{p.id}\">#{p.title}"
      end
    end
    retval.html_safe
  end
end
