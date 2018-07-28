ActiveRecord::Schema.define(version: 20180724211552) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

end
