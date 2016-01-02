module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def render_hireable_pretty(bool)
		if bool
			return '<button type="button" class="btn btn-oval btn-success btn-xs">Hireable</button>'
		end
		return '<button type="button" class="btn btn-oval btn-default btn-xs">Not Hireable</button>'
  end
end
