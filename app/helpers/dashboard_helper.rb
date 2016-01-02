module DashboardHelper

	def render_hireable_pretty(bool)
		if bool
			return '<button type="button" class="btn btn-oval btn-success btn-xs">Yes</button>'
		end
		return '<button type="button" class="btn btn-oval btn-default btn-xs">No</button>'
	end
end
