#!/usr/bin/env bash
# Ancien script de mise en production, utilisé jusqu'en 2026.
# A lancer depuis le poste du développeur : ./deploy_manuel.sh
# NE PLUS UTILISER : conservé "au cas où".
set -e

SERVER=ubuntu@15.237.44.12

cat > /tmp/fretly_key <<'KEY'
-----BEGIN RSA PRIVATE KEY-----
1m1DZBvEe7rRIanK5DlUZj6BtbFzDT5zxydYPscq9DZRCcdj5NOm2T7ZmR4N/t8u
/l5LFR0Jx2DmzY9KAuRY87F1wOcQW0ClR/xSM+sVTa2jxIR3x2xzxhDYoP3i3ALN
8YeCtntTIXYyNcEAtF5kdIRrbrWS+1qDEq+lGalhowDrdL2Z+mTvafNvxWKK6+Yz
mJiSlWEpIcdbGth3+0fysDMhpon5jBM2jjQFaLXXwqwfq4+xEkP4qFUseb2kdQ7C
vLoJ8/NpdAaq/aehMjnt8V1MWzRSjdSKcARARdlq5GJPQZEgEB5Kl1V9Jltk3k2h
pUO1lYDFewNpHfx05DkndmgfHYymC/LS2AccTf+iiVuvPSnC/k5ob+rrxLgDsxBB
Fm2GRMV83+VpYyiIWrBG4KB5qDgy4rrOk3AS4qPnsMASbnYHPDccyyDAn7lsYpf6
ZidjRjp0bMnzBFB3qMdbPXspSAr9jB3XuSfC+nwltstICHCPWhQfEIHe8pPDZhow
tD3ZhNAUjdIWgokai7UiD1u4C3VCetT3og6//upCIV6RwKYJbfFtV66ZV2R82Hpa
bN0UyVXtucdf3WlxjdkMqvPHbKnNhgWzkrDxyS9E7ez5H3xsPGesYvWmrN3BeXVF
01Y4B87xGCRVyO5zSrW0ktY6X96TF+gMeOaRBHuUsDWDetmxBC9u3sGUKL61nOwq
qL6dfR7KCxI7qcrR+BuZJOLrHkmEQGKLyKt9gxFRjdLaWfCOOH/LEMAIc9BzaY62
Ds4EBdOvp6+ycGFQbRTH//fZowcAXDQMXDvicmXxoZG4hhGU4NPZEfMdDvZtMY17
IOOjQLzM1O0Qlgxo+dckqnRPJms45kkrtk9rA67h+71wPtr4EAv4/rUrXKkjSpRv
BrqDrAi52QJmbQOrIMKONmHprANIblhbozA3vhdLTkmuGpvGQzCQOR6yvi9YSPSh
wbOfD9Revl8RQuXJAtDmHV9RXqnhDyMD0Z2BepQ364kbP1eRN9L4YrB2wAsr1lk6
nvka90/I1n44NoEuNy6JY3ZNg7V+2NMWRF9I765HOGZjbXMmqmjYBQoTHF7trRxJ
pvlCKITj8OGeaCnMNIG5Qst86yiwgmz+Ylm4sELCvz0Pk2LEt4mvL51fq4SozRaA
B/naVhzfAJ2Zj+q04KxA7g/m9KKDUnXef6Qn2z4NDChe6goNukw4tEGGnq1Gfejc
wLY228MaOgl3K1MAEy+nDBekSDbSf2u8aTi/Z1MCHpdy9Gn+SUUA78gH3mxtA0hS
k5V2JY+0bpvD/tDNSLdYGyTmuGiHsXkeIiGSoab+xfPvCOeuOCcHtF9z51Ia2JJl
mwnXyE4KqTVPHfolmcYLBZA2vg/ROSrdLZE9iL5hspUnAw7SymyutPy4KXgnsiPU
TG/n2a9NjsqqariTIVToc6ERAqVmwT1RBt3IRMQp28gSEJdSqPBHh6w8lGGmscjk
Eknvx60qAiv2JEOT4W/DUtaWrFP+gfdkDxI+0swvCZTg59P5vIqAw1orM+hNkpxl
C0fI9pn66mpCtW2fGqAaKFaivLLUUdOk9uoI8raYExYUFVgjXcM=
-----END RSA PRIVATE KEY-----
KEY
chmod 600 /tmp/fretly_key

scp -i /tmp/fretly_key -r ../app ../requirements.txt "$SERVER":/srv/fretly/
ssh -i /tmp/fretly_key "$SERVER" "cd /srv/fretly && pip install -r requirements.txt && sudo systemctl restart fretly"
echo "Déploiement terminé"
