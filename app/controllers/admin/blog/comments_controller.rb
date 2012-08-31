=begin
	@Name: Admin Blog Comments controller
	@Purpose:  Creating , modifying, deleting blog comments for the cms
	@Created date: 08-06-2012
	@Modified Date: 12-06-2012
  @Company  : Mindfire Solutions
=end
class Admin::Blog::CommentsController < ApplicationController

  #prepending before filter for authenticating user via devise
	prepend_before_filter :authenticate_user!  

  #use of cancan to load authorized resource
  load_and_authorize_resource :class => "BlogComment"

  #before filter for loading assets
  before_filter :load_assets
  
  #Assigning a layout admin for admin side controller
  layout '/mcms/main_layout'
  
  #Crudify method used for a normal crud methods by crudify gem
  #It creates new, create, edit, update, delete, show methods for blog comment
  crudify :blog_comment,
          :title_attribute => :name,
          :order => 'published_at DESC'

  #showing all comments where state are nil
  def index
    @blog_comments = BlogComment.unmoderated
    render :action => 'index'
  end

  #approving comments if there is a request to approve comment
  #showing all approved comments when params[:id] is not present
  def approved
    unless params[:id].present?
      @blog_comments = BlogComment.approved
      render :action => 'index'
    else
      @blog_comment = BlogComment.find(params[:id])
      @blog_comment.approve!
      flash[:notice] = t('admin.blog.comments.approved', :author => @blog_comment.name)
      redirect_to :action => params[:return_to] || 'index'
    end
  end

  #rejecting comments if there is a request to reject comment
  #showing all rejected comments when params[:id] is not present
  def rejected
    unless params[:id].present?
      @blog_comments = BlogComment.rejected
      render :action => 'index'
    else
      @blog_comment = BlogComment.find(params[:id])
      @blog_comment.reject!
      flash[:notice] = t('admin.blog.comments.rejected', :author => @blog_comment.name)
      redirect_to :action => params[:return_to] || 'index'
    end
  end

  protected           #protected methods start here

  #Initializing assets array for this controller
  def load_assets
    AssetManager.include_css [:blog_global, :submenu]
  end

end
