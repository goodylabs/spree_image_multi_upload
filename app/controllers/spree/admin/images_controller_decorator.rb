Spree::Admin::ImagesController.class_eval do

  def create_multiple
    params[:image][:attachment].each do |attachment_object|
      image = Spree::Image.new
      image.attachment = attachment_object
      image.viewable_id = params[:image][:viewable_id]
      image.type = 'Spree::Image'
      image.viewable_type = 'Spree::Variant' 
      image.save      
    end
    redirect_to admin_product_images_url(@product)
  end

  

  def new_actions
    [:new, :create, :multi_upload]
  end
end
