class McmsBlogGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  
  # @Params     : None
  # @Returns    : None
  # @Purpose    : To Copy asset_manager from engine to app
  def copy_asset_manager

    #copy file lib/asset_manager.rb to app/lib/asset_manager.rb if it doesn't exists
    copy_file "asset_manager.rb", "lib/asset_manager.rb" unless File.exists?(File.join(destination_root, 'lib', 'asset_manager.rb'))


  end
  
  # @Params     : None
  # @Returns    : None
  # @Purpose    : To Copy initializer from engine to app
  def copy_initializer

    #copy file lib/asset_manager.rb to app/lib/asset_manager.rb if it doesn't exists
    copy_file "ckeditor.rb", "config/initializers/ckeditor.rb" unless File.exists?(File.join(destination_root, 'config/initializers', 'ckeditor.rb'))


  end

  # @Params     : None
  # @Returns    : None
  # @Purpose    : To Copy all the migrations from db/migrate of engine to db/migrate of application
  def add_migrations

    say "copying migrations......."

    # running command line command to copy engine's migration file
    rake("mcms_blog_engine:install:migrations")

  end # end method
  
  # @Params     : None
  # @Returns    : None
  # @Purpose    : To append seeds data from engine to app's seeds.rb
  def append_seed_data

      # create file db/seeds.rb to parent app if not exists
      create_file "db/seeds.rb" unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))

      # append data to app's seeds.rb
      append_file 'db/seeds.rb', :verbose => true do

        <<-EOH

        McmsBlog::Engine.load_seed

        EOH

      end # end block

  end # end method
  
end
