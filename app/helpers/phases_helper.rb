module PhasesHelper

  def display_process_scope(process)
    if !process.nil?
      "For the Portfolio Process #{process.title}"
    end
  end
end
