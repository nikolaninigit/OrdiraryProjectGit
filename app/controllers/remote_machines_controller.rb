require "./config/environment"

class RemoteMachinesController < ApplicationController
    respond_to :html, :js
    
    $machineState="Unknown"
    $searchId=""
    
    def index
        if(params.has_key?(:id))
            $searchId=params['id']
        else
            $searchId=""
        end
    end
    
    def instanceState
        
        $numberOfRecords=RemoteMachine.all.count;
            if($numberOfRecords==0)
                $machineState="Unknown"
            else
                if $searchId == ""
                    $machineState=RemoteMachine.first.instanceState
                else
                    $numberWithId=RemoteMachine.where(instanceId: $searchId).count
                    if $numberWithId==1
                        $tmpElem=RemoteMachine.where(instanceId: $searchId).take
                        $machineState=$tmpElem.instanceState
                    else
                        $machineState="Unknown"
                    end
                end
            end

        render text: $machineState
    end
    
    
end
