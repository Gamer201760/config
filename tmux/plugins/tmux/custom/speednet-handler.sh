sleeptime="0.5"
iface=$(route get default | grep -i interface | awk '{print $2}')
if [ -z "$iface" ]; then
  iface="en0"
fi
RXB=$(netstat -i -b | grep -m 1 "$iface" | awk '{print $7}')
TXB=$(netstat -i -b | grep -m 1 "$iface" | awk '{print $10}')
sleep "$sleeptime"
RXBN=$(netstat -i -b | grep -m 1 "$iface" | awk '{print $7}')
TXBN=$(netstat -i -b | grep -m 1 "$iface" | awk '{print $10}')
RXDIF=$(echo "$((RXBN - RXB)) / 1024 / ${sleeptime}" | bc)
TXDIF=$(echo "$((TXBN - TXB)) / 1024 / ${sleeptime}" | bc)

if [ "$RXDIF" -gt 1024 ]; then
  RXDIF=$(echo "scale=1;${RXDIF} / 1024" | bc)
  RXDIF_UNIT="M/s"
else
  RXDIF_UNIT="K/s"
fi
if [ "$TXDIF" -gt 1024 ]; then
  TXDIF=$(echo "scale=1;${TXDIF} / 1024" | bc)
  TXDIF_UNIT="M/s"
else
  TXDIF_UNIT="K/s"
fi
printf "⇊ %.1f${RXDIF_UNIT} ⇈ %.1f${TXDIF_UNIT}" "${RXDIF}" "${TXDIF}"
