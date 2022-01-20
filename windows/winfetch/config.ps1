# ===== WINFETCH CONFIGURATION =====

# Set the version of Windows to derive the logo from.
$logo = "Windows 7"

# Configure which disks are shown
$ShowDisks = @("C:")

# Configure which package managers are shown
# disabling unused ones will improve speed
$ShowPkgs = @("scoop", "choco")

# Remove the '#' from any of the lines in
# the following to **enable** their output.

@(
    "title"
    "dashes"
    "os"
    "computer"
    "uptime"
    "resolution"
    "terminal"
    "cpu"
    "gpu"
    "memory"
    "disk"
    "battery"
    "local_ip"
    "blank"
    "colorbar"
)
