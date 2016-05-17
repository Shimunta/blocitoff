class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Success!"
    else
      flash[:alert] = "Did not save!"
    end
    redirect_to root_path
  end

  def destroy
    @item = current_user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item was deleted"
    else
      flash.now[:alert] = "Item was not deleted properly"
    end
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end


private
  def item_params
    params.require(:item).permit(:name)
  end
end
