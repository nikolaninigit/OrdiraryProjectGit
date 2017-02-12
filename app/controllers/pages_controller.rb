
class PagesController < ApplicationController
    respond_to :html, :js
    
    $tmpData="Unknown" 

    def index
        
        if(params.has_key?(:id))
            @id=params['id']
        end
        
        #@s= 'id111'
        #@oneUser=User.where(name: @s).take.bio
    end
    
    
    def instanceState
        $number = Random.rand(0...2)
        $tmpData=User.where(id: $number.to_s).take.name
        
        $numberOfUsers=User.all.count;
        if($numberOfUsers==0)
            $tmpData="nema elemenata"
           else
            $tmpData=User.first.bio
        end
        
        render text: $tmpData
    end
    

end



