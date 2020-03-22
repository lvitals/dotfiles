# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)" ↑"

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted="| "$(date "+%a %d/%m/%Y %H:%M:%S")

# Get the Linux version but remove the "-1-ARCH" part
linux_version="| "$(uname -r | cut -d '-' -f1)

# Returns the battery status.
# battery_status=$(cat /sys/class/power_supply/BAT0/status)

battery_percent=$(acpi | awk 'NR==1{print $4}'| sed 's/\,$//')
battery_time=$(acpi | awk 'NR==1{print substr($5, 1, length($5)-3)}'| sed 's/\,$//')

[[ -z "$battery_percent" ]] && battery="" || battery="B: $battery_percent $battery_time"

# Get cpu
cpu="| "$(ps -A -o pcpu | tail -n+2 | awk '{n += $1}; END{ print "C: " n "%"}')

# Get memory usage
memory_usage="| "$(free -m | awk 'NR==2{printf "M: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Get disk usage
disk_usage="| "$(df -h | awk '$NF=="/"{printf "D: %d/%dGB (%s)\n", $3,$2,$5}')

# Get network default
ntw_interface=$(ip route show default | awk '/default/ {print $5}')
ntw_ip=$(ip route show default | awk '/default/ {print $3}')

[[ -z "$ntw_ip" ]] && ntw="| N: down" || ntw="| N: $ntw_interface ($ntw_ip)"

# Output statusbar
echo -e $uptime_formatted $linux_version $ntw $cpu $memory_usage $disk_usage $battery $date_formatted
