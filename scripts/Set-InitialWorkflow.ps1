Import-Function Edit-Item

function Set-InitialWorkflow {
    param (
        [Parameter(Mandatory=$true)][Sitecore.Data.Items.Item]$Item
    )
    
    $workflowField = [Sitecore.FieldIDs]::Workflow
    $workflow = Get-Item ($Item[$workflowField])
    if (-not $workflow) {
        return $false
    }
    
    $initialState = $workflow["Initial State"]
    $stateField = [Sitecore.FieldIDs]::WorkflowState
    Edit-Item $Item {
        $Item[$stateField] = $initialState
    }
}