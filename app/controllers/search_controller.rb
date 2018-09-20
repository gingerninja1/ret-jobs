class SearchController < ApplicationController
  
  def search
    @profiles = Profile.all
    if params[:search]
      @profiles = Profile.search(params[:search]).order("created_at DESC")
    else
      @profiles = Profile.all.order('created_at DESC')
    end
  end
  
  def results
    <% if @posts.present? %>
      <%= render @posts %>
    <% else %>
      <p>There are no posts containing the term(s) <%= params[:search] %>.</p>
    <% end %>
  end
  
  private
  
  def search_params
    
  end
  
end