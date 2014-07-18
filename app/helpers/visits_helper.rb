module VisitsHelper
  def delete_visit_link(location, visit)
    link_to 'delete', location_visit_path(location, visit), method: 'delete', confirm: "Are you sure?"
  end
end
