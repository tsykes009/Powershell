function Start-MSEdge {

    [CmdLetBinding()]
    Param (
        [Parameter(Position = 0)]
        [string]$url
    )

    begin {
        
        Invoke-ChromeBookmarkSync

    }

    process {
        
        & 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' $url

    }

    end {}

}