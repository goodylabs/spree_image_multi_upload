Spree::Admin::ImagesController.class_eval do

  def create_multiple
    images = []
    params[:image][:attachment].each do |attachment_object|
      image = Spree::Image.new
      image.attachment = attachment_object
      image.viewable_id = params[:image][:viewable_id]
      image.type = 'Spree::Image'
      image.viewable_type = 'Spree::Variant' 
      image.save      
      images << image
    end

    files = images.map{ |i| i.to_jq_upload.merge({
        edit_url: edit_admin_product_image_url(i.viewable.product, i),
        delete_url: admin_product_image_url(i.viewable.product , i)
      })
    }

    result = { files: files }

    respond_to do |format|
      format.html { render json: result, content_type: 'text/html', layout: false }
      format.json { render json: result, status: :created }
    end
  end

  

  def new_actions
    [:new, :create, :multi_upload]
  end
end
