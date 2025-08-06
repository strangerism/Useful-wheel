

function CreateBuildFolders {
    
    New-Item -Path "build" -ItemType Directory | Out-Null

    New-Item -Path "build/Useful Wheel" -ItemType Directory | Out-Null
    
}

function BuildMod {

    $target = "build/Useful Wheel"
    Copy-Item -Recurse -Force -Path ".\Main\gamedata" -Destination $target -Exclude .bak
}

CreateBuildFolders
BuildMod

$compress = @{
    Path = "build/Useful Wheel/gamedata" 
    CompressionLevel = "Fastest"
    DestinationPath = "release/Useful Wheel.zip"
}
Compress-Archive @compress -Force

Remove-Item -Force -Recurse -Path "./build"