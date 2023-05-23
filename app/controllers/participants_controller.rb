class ParticipantsController < ApplicationController
    def index
        @participants = Participant.ordered_alphabetically
    end

    def add_registry
        @participant = Participant.find(params[:id])
    end

    def show
        @participant = Participant.find(params[:id])
    end

    def new
        @participant = Participant.new
    end

    def create
        @participant = Participant.new(participant_params)
        if @participant.save
          redirect_to participant_path(@participant)
        else
          render :new
        end
    end

    def edit
        @participant = Participant.find(params[:id])
    end

    def update
        @participant = Participant.find(params[:id])
        @participant.update(participant_params)
        redirect_to participant_path
    end

    private

    def participant_params
        params.require(:participant).permit(:name, :gender, :date_of_birth, :phone, :email, :method_of_contact)
    end

end
