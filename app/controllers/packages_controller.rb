class PackagesController < ApplicationController
  def index
    render json: Package.all
  end

  def show
    package = Package.find_by_name(params[:id])

    if params[:install]
      package.installs += 1
      package.save
    end

    render json: package
  end

  def search
    if params[:name]
      packages = Package.where("name LIKE ?" , "%#{params[:name]}%")
    else
      packages = Package.all
    end

    render json: packages
  end

  def create
    package = Package.new(name: params['name'],
                          url: params['url'])
    if package.save
      render json: package
    else
      render json: { errors: package.errors.full_messages }
    end
  end
end
