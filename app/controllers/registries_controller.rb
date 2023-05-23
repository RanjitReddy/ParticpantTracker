class RegistriesController < ApplicationController
    
    def add_coordinator
        @registry = Registry.find(params[:id])
        @registry_coordinator = RegistryCoordinator.new
    end

    def index
        @registries = Registry.all
    end

    def show
        @registry = Registry.find(params[:id])
        @coordinators = Coordinator.all
    end

    def new
        @registry = Registry.new
        @registry_coordinator = RegistryCoordinator.new
    end

    def create
      @registry = Registry.new(registry_params)
      if @registry.save
          coordinator_id = params[:registry][:registry_coordinator][:coordinator_id]
          registry_id = @registry.id
          @registry_coordinator = RegistryCoordinator.new(coordinator_id: coordinator_id, registry_id: registry_id)
          @registry_coordinator.save
          redirect_to @registry
      else
        render :new
      end
    end

    def edit
        @registry = Registry.find(params[:id])
    end

    def update
        @registry = Registry.find(params[:id])
        if @registry.update(registry_params)
            redirect_to registry_path
        # else
            # render: edit
        end
    end

    private

    def registry_params
        params.require(:registry).permit(:name, :location, :status)
    end

end
