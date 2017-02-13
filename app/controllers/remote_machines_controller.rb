class RemoteMachinesController < ApplicationController
    respond_to :html, :js
    
    $machineState="Unknown"
    $machineCode=""
    $tmp="nikola"
    
    def index
        #if(params.has_key?(:id))
        #    $machineCode=params['id']
        #else
        #    $machineCode=""
        #end
    end
    
    def instanceState
        $numberOfRecords=RemoteMachine.all.count;
        if($numberOfRecords==0)
            $machineState="Unknown"
           else
            $machineState=RemoteMachine.first.instanceState
        end
        
        #if($machineCode=="")
         #   $tmp="changedtext"
        #end
        
        render text: $machineState
    end
    
    
end
