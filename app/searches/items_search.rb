class ItemsSearch < Searchlight::Search

  def base_query
    Items::Base.all
  end

  def search_user_id
    query.joins(:user).where(users: { id: user_id.to_i })
  end

end
