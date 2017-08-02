class Track < ActiveRecord::Base
  include Filterable

default_scope { order("#{self.table_name}.email_address ASC")}
scope :email_address, lambda{|email_address| where('email_address = ?', email_address )}
  

end
