function Invoke-ChromeBookmarkSync {
    
    [CmdLetBinding()]
    Param ()

    begin {
        
        $chromePath = 'Google\Chrome\User Data\Profile 2\Bookmarks'
        $edgePath = 'Microsoft\Edge\User Data\Default\Bookmarks'

        $chromePathHash = (Get-Item -Path (Join-Path -Path $env:LOCALAPPDATA -ChildPath $chromePath) | Get-FileHash -Algorithm MD5).Hash
        $edgePathHash = (Get-Item -Path (Join-Path -Path $env:LOCALAPPDATA -ChildPath $edgePath) | Get-FileHash -Algorithm MD5).Hash

    }

    process {
        
        if ($chromePathHash -ne $edgePathHash) {

            Copy-Item -Path (Join-Path -Path $env:LOCALAPPDATA -ChildPath $chromePath) -Destination (Join-Path -Path $env:LOCALAPPDATA -ChildPath $edgePath) -Verbose -Force -Confirm:$false
            Write-Host -ForegroundColor Yellow "$chromePathHash Chrome Sync"

        } else {
            
            Write-Host -ForegroundColor Green "$chromePathHash Chrome Equivalent"

        }
        

    }

    end {
        
    }
}