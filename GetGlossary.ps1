function Get-Glossary {
    [CmdletBinding()]
    param ()
    
    begin {
        $r = Invoke-WebRequest -Uri 'https://api.weather.gov/glossary' -Headers @{ 'Accept' = 'application/ld+json' }

        if (! ($r.StatusCode -eq 200)) {
            Write-Error 'It Broke fam'
        }

        $Content = [System.Text.Encoding]::Utf8.GetString($r.Content)

        $Glossary = $Content | ConvertFrom-Json | select -ExpandProperty glossary 
    }
    
    process {
        Write-Output $Glossary
    }
    
    end {
        
    }
}