require 'csv'

module Import
  extend ActiveSupport::Concern

  def bulk_insert(file)
    objects = []
    CSV.foreach(file.path, headers: true) do | row |
      object = row.to_hash.slice(*updatable_attributes)
      object['created_at'] = Time.now
      object['updated_at'] = Time.now
      objects << object
    end
    insert_all(objects)
  end

  def updatable_attributes
    raise 'updatable_attributes not implemet'
  end
end
