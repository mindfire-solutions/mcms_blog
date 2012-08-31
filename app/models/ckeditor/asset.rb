class Ckeditor::Asset < ActiveRecord::Base
	set_table_name  'mcms_assets'
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip
end

