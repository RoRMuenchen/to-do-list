module ApplicationHelper
  def task_due_date_in_words(task)
    time_span = time_ago_in_words(task.due_date)
    if task.due_date > Time.now
      "due in #{time_span}"
    else
      "#{time_span} ago"
    end
  end
end
