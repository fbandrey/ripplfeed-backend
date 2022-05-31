class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def errors_as_json
    _json = { keys: [], messages: [] }
    self.errors.messages.each_pair do |k, v|
      if k.to_s.casecmp('base').zero?
        _json[:messages].concat [v].flatten
      else
        _json[:keys] << k
        _field_name = self.class.human_attribute_name(k.to_s.sub('.', '/'))
        _json[:messages] << [_field_name, v].join(' ')
      end
    end
    _json[:keys].uniq! && _json[:messages].uniq!
    _json
  end

end
