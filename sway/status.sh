# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %d/%m/%Y %H:%M:%S")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1)

# Returns the battery status.
# battery_status=$(cat /sys/class/power_supply/BAT0/status)

battery_percent=$(acpi | awk 'NR==1{print $4}'| sed 's/\,$//')
battery_time=$(acpi | awk 'NR==1{print substr($5, 1, length($5)-3)}'| sed 's/\,$//')

# Get cpu
cpu=$(ps -A -o pcpu | tail -n+2 | awk '{n += $1}; END{ print "C: " n "%"}')

# Get memory usage
memory_usage=$(free -m | awk 'NR==2{printf "M: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Get disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "D: %d/%dGB (%s)\n", $3,$2,$5}')

# Get wifi
wifi_interface=$(cat /proc/net/wireless | awk 'END { print $1 }' | sed 's/\:$//')
wifi_quality=$(cat /proc/net/wireless | awk 'END { print $3 }' | sed 's/\.$//')
wifi_ip=$(ip -4 addr show $wifi_interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Output statusbar
echo  $uptime_formatted ↑ '|' $linux_version '|' $wifi_interface'('$wifi_ip')' $wifi_quality% '|' $cpu '|' $memory_usage '|' $disk_usage '|' 'B:' $battery_percent $battery_time '|' $date_formatted
