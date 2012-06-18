module ApplicationHelper

  #For adding fields dynamically with jquery (from ryanb's railscast)
  def link_to_add_fields(name, f, association, classes = "add_fields")
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "#{classes} btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
  end


  def respond_to_not_found(*types)
    flash[:warning] = t(:msg_asset_not_available, asset)

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.js { render(:update) { |page| page.reload } }
      format.json { render :text => flash[:warning], :status => :not_found }
      format.xml { render :text => flash[:warning], :status => :not_found }
    end
  end

  def get_user
    @current_user = current_user
  end

  def habtm_checkboxes(obj, column, assignment_objects, assignment_object_display_column)
    obj_to_s = obj.class.to_s.split("::").last.underscore
    field_name = "#{obj_to_s}[#{column}][]"

    html = hidden_field_tag(field_name, "")
    assignment_objects.each do |assignment_obj|
      cbx_id = "#{obj_to_s}_#{column}_#{assignment_obj.id}"
      html += check_box_tag field_name, assignment_obj.id, obj.send(column).include?(assignment_obj.id), :id => cbx_id
      html += label_tag cbx_id, h(assignment_obj.send(assignment_object_display_column))
      html += content_tag(:br)
    end
    html
  end
end

