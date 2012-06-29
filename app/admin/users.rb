ActiveAdmin.register User do

  index do
    column :username
    column :email
    column :last_sign_in_at
    column :sign_in_count

    default_actions
  end

  form :partial => "form"

  show do

  end
  
end
