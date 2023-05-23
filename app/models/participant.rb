class Participant < ApplicationRecord
  has_many :registry_participants
  has_many :registries, through: :registry_participants

  validates :email,
    :presence => true,
    :uniqueness => {:message => 'Email Address already taken!'}, 
    :format => { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid Email Format' }

  scope :ordered_alphabetically, -> { order(name: :asc)}

  def own_registries
    RegistryParticipant.where(:participant_id => self.id)
  end

  def find_coordinator(registry_id)
    x = RegistryParticipant.where(registry_id: registry_id).where(participant_id: self.id)
    Coordinator.find_by(email: x.first.coordinator_email)
  end
end
