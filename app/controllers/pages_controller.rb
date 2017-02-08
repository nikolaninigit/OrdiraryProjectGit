require 'sneakers' # don't forget to put gem "sneakers" in your Gemfile
require 'sneakers/runner'
require "rubygems"
require "json"



class PagesController < ApplicationController
    respond_to :html, :js
    
    $tmpData="Unknown" 

    def index
        @instanceState="<Instance status status>"
        @foo="prva vrednost"
        
    end
    
    
    def show_options
    end
    
    def hide_options
    end
    
    def download
    end
    
    def instanceState
        $tmpData=Random.rand(1...100)
        render json: $tmpData
    end
    

end



