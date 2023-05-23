class CoordinatorsController < ApplicationController
    def index
        @coordinators = Coordinator.ordered_alphabetically
        
        respond_to do |format|
            format.html
            format.csv { send_data generate_csv(@coordinators), filename: 'data.csv' }
        end
    end
    
    def home  
    end

    def show
        @coordinator = Coordinator.find(params[:id])
    end

    def new
        @coordinator = Coordinator.new
    end

    def create
        @coordinator = Coordinator.new(coordinator_params)
        if @coordinator.save
            redirect_to @coordinator
        else
            render :new
        end
    end

    def edit
        @coordinator = Coordinator.find(params[:id])
    end

    def update
        @coordinator = Coordinator.find(params[:id])
        @coordinator.update(coordinator_params)
    end

    def delete
        @coordinator = Coordinator.find(params[:id])
        @coordinator.destroy
        redirect_to coordinators_path
    end

    private

    def coordinator_params
        params.require(:coordinator).permit(:name, :email, :phone)
    end

    def generate_csv(data)
      require 'csv'
      attributes = %w{ name date_of_birth gender email phone method_of_contact }
      CSV.generate(headers: true) do |csv|
          csv << attributes
          data.each do |coordinator|
              csv << coordinator.attributes.values_at(*attributes)
              coordinator.own_participants.each do |participant|
                  csv << participant.attributes.values_at(*attributes)
              end
          end
      end
    end
end
