CONFIG = YML2OS.new(Rails.root.join('config', 'config.yml')).os.send(Rails.env)
