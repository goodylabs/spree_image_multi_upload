Deface::Override.new(
  :virtual_path => 'spree/admin/images/index',
  insert_after: 'erb:contains("content_for :page_actions do")',
  :text => "<%= button_link_to t('multi_upload.title'), multi_upload_admin_product_images_path(@product), { :id => 'multi_upload_images_link', class: 'btn-warning btn-margined' } %>",
  :name => 'add_images_multi_upload_button'
)
