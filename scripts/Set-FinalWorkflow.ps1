Import-Function Edit-Item

function Set-FinalWorkflow {
    param (
        [Parameter(Mandatory=$true)][Sitecore.Data.Items.Item]$Item
    )
    
    $workflowField = [Sitecore.FieldIDs]::Workflow
    $workflow = Get-Item ($Item[$workflowField])
    if (-not $workflow) {
        return $false
    }

    $finalState = $workflow.Children | ? { $_["Final"] -eq "1" } | select -First 1
    if (-not $finalState) {
        return $false
    }
    
    $stateField = [Sitecore.FieldIDs]::WorkflowState
    Edit-Item $Item {
        $Item[$stateField] = $finalState.ID.ToString()
    }
}