ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :project_name, :start_date, :end_date, :status, :phase, :category
  #
  # or
  #
  # permit_params do
  #   permitted = [:project_name, :start_date, :end_date, :status, :phase, :category]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
index do
  selectable_column
      id_column
      column :project_name
      column :start_date
      column :end_date
      column :status
      column :phase
      column :category
    actions 
end
end
