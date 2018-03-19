Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :first_name
      String :last_name      
      String :email
      String :password
      DateTime :created_at
      DateTime :updated_at
    end
  end
end