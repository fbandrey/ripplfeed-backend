module Items
  class Voice < Base

    validates :text, presence: true

    def file_path
      ['uploads', 'items', 'voice', [id, 'mp3'].join('.')].join('/')
    end

  end
end
