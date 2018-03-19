Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      Fixnum :user_id
      String :title
      String :content
      DateTime :created_at
      DateTime :updated_at
    end
  end
end