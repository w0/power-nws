function Get-AlertsActive {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet('Actual', 'Exercise', 'System', 'Test', 'Draft')]
        [String[]]
        $Status,

        [Parameter(AttributeValues)]
        [ValidateSet('Alert', 'Update', 'Cancel')]
        [string[]]
        $MessageType,

        [string[]]
        $EventName,

        [Parameter(AttributeValues)]
        [ParameterType]
        $EventCode,

        [Parameter(AttributeValues)]
        [ValidateSet('Land', 'Marine')]
        [ParameterType]
        $RegionType,
        
        [Parameter(AttributeValues)]
        [ParameterType]
        $Point,
        
        [Parameter(AttributeValues)]
        [ParameterType]
        [ValidateSet('AL','AT','GL','GM','PA','PI')]
        $Region,
        
        [Parameter(AttributeValues)]
        [ParameterType]
        $Area,
        
        [Parameter(AttributeValues)]
        [ParameterType]
        $Zone,
        
        [Parameter(AttributeValues)]
        [ValidateSet('Immediate', 'Expected', 'Future', 'Past', 'Unknown')]
        [ParameterType]
        $Urgency,
        
        [Parameter(AttributeValues)]
        [ValidateSet('Extreme', 'Severe', 'Moderate', 'Minor', 'Unknown')]
        [ParameterType]
        $Severity,
        
        [Parameter(AttributeValues)]
        [ValidateSet('Unknown', 'Unlikely', 'Possible', 'Likely', 'Observed')]
        [ParameterType]
        $Certainty,
        
        [Parameter(AttributeValues)]
        [ParameterType]
        $Limit
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}