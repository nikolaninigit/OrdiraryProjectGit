class RemoteMachinesController < ApplicationController
    respond_to :html, :js
    
    $machineState="Unknown"
    
    def index
        
    end
    
    def instanceState
        $numberOfRecords=RemoteMachine.all.count;
        if($numberOfRecords==0)
            $machineState="Unknown"
           else
            $machineState=RemoteMachine.first.instanceState
        end
        
        render text: $machineState
    end
    
    
end
