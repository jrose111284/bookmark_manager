require_relative '../data_mapper_setup'

class Tag
  include DataMapper::Resource
    property :id, Serial
    property :tags, String
end

#

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!