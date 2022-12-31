module ApplicationHelper

  def andon(condition)
    if condition > 0.95
      'green'
    elsif condition >0.85
      'yellow'
    else
    'red'
    end
  end

end
