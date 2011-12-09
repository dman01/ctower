module PortfoliosHelper

  def display_process(portfolio)
    p=portfolio.portfolio_process
    if p.nil?
        "No process attached"
    else
      p.title
    end
  end

  def show_link_to_new
    if PortfolioProcess.list_by_user(session[:user_id]).count !=0
      link_to("New Portfolio", new_portfolio_path)
    else
      "Need Process"
    end
  end

  def show_link_to_process
    if PortfolioProcess.has_admin_rights(session[:user_id])
      link_to("Portfolio Processes",portfolio_processes_path)
    end
  end
end
