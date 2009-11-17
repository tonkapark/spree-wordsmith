require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController do

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "index action should render index template for rss with xml" do
    get :index, :format => 'rss'
    response.should render_template(:index)
    response.content_type.should == 'application/rss+xml'
    response.should have_tag('title', :text => Spree::Config[:site_name])
  end
  
  it "show action should render show template" do
    get :show, :id => Post.first.to_param
    response.should render_template(:show)
  end
  
  it "show action should not find post when is not active" do
    post = Factory(:post_draft)
    lambda { get :show, :id => post.to_param }.should raise_error(ActiveRecord::RecordNotFound)
  end
  
end
