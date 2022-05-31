module Users
  class DashboardSerializer < ActiveModel::Serializer

    attributes :full_name, :nick_name, :feed

    def full_name
      [object.first_name, object.last_name].compact.join(' ')
    end

    def feed
      object.items.order('RANDOM()').limit(10).map(&:file_path)
    end

  end
end
