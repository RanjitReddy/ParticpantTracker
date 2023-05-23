class RegistryParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :registry

  scope :sort_by_coordinator, -> { order('coordinator_email') }

  def find_coordinator
    Coordinator.where(:email => self.coordinator_email)
  end

end
