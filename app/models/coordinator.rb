class Coordinator < ApplicationRecord
  has_many :registry_coordinators
  has_many :registries, through: :registry_coordinators

  validates :email,
    :presence => true,
    :uniqueness => {:message => 'Email Address already taken!'}, 
    :format => { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid Email Format' }

  scope :ordered_alphabetically, -> { order(name: :asc)}

  def own_registries
    RegistryParticipant.where(:coordinator_email => self.email)
  end

  def own_participants
    participants = []
    self.own_registries.each do |r|
      participants << Participant.find(r.participant_id)
    end

    return participants
  end

  def find_registry_participants
     participants = RegistryParticipant.where( coordinator_email: self.email)
     participant_details = []
     participants.each do |p|
      participant_details << Participant.find(p.participant_id)
     end

     return participant_details
  end

end
