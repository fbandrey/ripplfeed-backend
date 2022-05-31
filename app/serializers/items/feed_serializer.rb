module Items
  class FeedSerializer < ActiveModel::Serializer

    attributes :text, :file_path, :created_at

  end
end
