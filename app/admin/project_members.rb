ActiveAdmin.register ProjectMember do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :email, :role, :project_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :role, :project_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
index do
  selectable_column
  id_column
  column :name
  column :email
  column :project_id do |p|
    p.project.project_name
  end
end

form do |f|
  inputs 'project_members'do 
    f.input :project do |p|
      p.project.project_name
    end
    f.input :name
    f.input :email
    f.input :role
   
  end
  actions
end

end
