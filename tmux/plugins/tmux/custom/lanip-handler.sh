nic="en0"
ipv4s_on_nic=$(ifconfig "${nic}" 2>/dev/null | awk '$1 == "inet" { print $2 }')
for lan_ip in "${ipv4s_on_nic[@]}"; do
  [[ -n "${lan_ip}" ]]
done
[[ -n "${lan_ip}" ]]
echo ${lan_ip}
