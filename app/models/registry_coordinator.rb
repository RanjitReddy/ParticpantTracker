class RegistryCoordinator < ApplicationRecord
  belongs_to :coordinator
  belongs_to :registry
  accepts_nested_attributes_for :coordinator
end
