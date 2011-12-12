module PhasesHelper

  def display_process_scope(process)
    if !process.nil?
      "For the Portfolio Process #{link_to process.title,portfolio_process_path(process)}".html_safe
    end
  end
end
