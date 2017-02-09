
class PagesController < ApplicationController
    respond_to :html, :js
    
    $tmpData="Unknown" 

    def index
        @instanceState="<Instance status status>"
        @foo="prva vrednost"
        
    end
    
    
    def instanceState
        $tmpData=Random.rand(1...100)
        render json: $tmpData
    end
    

end



