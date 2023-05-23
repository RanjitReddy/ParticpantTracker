class RegistryCoordinatorsController < ApplicationController
    
    def add_coordinator
        @registry = Registry.find(params[:id])
        @registry_coordinator = RegistryCoordinator.new
    end
    
    def new
        @registry = Registry.find(params[:id])
        @registry_coordinator = RegistryCoordinator.new
    end

    def create
        @registry_coordinator = RegistryCoordinator.new(registry_coordinator_params)
        coordinator_id = params[:registry_coordinator][:coordinator_id]
        registry_id = params[:registry_coordinator][:registry_id]
        if @registry_coordinator.save
            @registry = Registry.find(registry_id)
            redirect_to registry_path(@registry)
        end
    end

    private

    def registry_coordinator_params
        params.require(:registry_coordinator).permit(:registry_id, :coordinator_id)
    end
end
