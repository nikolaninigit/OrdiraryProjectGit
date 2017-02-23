require "./config/environment"

class RemoteMachinesController < ApplicationController
    respond_to :html, :js
    
    $machineId=""
    $machineState="Unknown"
    $searchId=""
    $returnInfo="Getting information about the instance state..."
    
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
                $returnInfo="DB is empty - no information about any instance"
            else
                if $searchId == ""
                    $machineId=RemoteMachine.first.instanceId
                    $machineState=RemoteMachine.first.instanceState
                    $returnInfo = "Instance bla &lt;"+$machineId+"&gt; is in state "+$machineState
                else
                    if RemoteMachine.where(instanceId: $searchId).count==1
                        $tmpInstance=RemoteMachine.where(instanceId: $searchId).take
                        $machineState=$tmpInstance.instanceState
                        $machineId=$tmpInstance.instanceId
                        $returnInfo = "Instance &lt;"+$machineId+"&gt; is in state "+$machineState
                    else
                        $returnInfo = "Information about instance <"+$searchId+"> is not present in the DB"
                    end
                end
            end

        render text: $returnInfo 
    end
    
    
end
