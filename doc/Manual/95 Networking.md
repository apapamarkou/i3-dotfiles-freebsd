# 🧾 Working with Networks in Unix Systems

Networking in Linux is built around interfaces, IP addresses, routing, and firewall rules. This chapter covers how to view, configure, and troubleshoot network connections including Wi-Fi (WLAN), local/global IPs, and essential network tools.

---

## 1. Core Networking Concepts

### Network Interface

A **network interface** is how your system connects to a network.

Common types:

* `eth0` / `enp*` → wired Ethernet
* `wlan0` / `wlp*` → Wi-Fi (WLAN)
* `lo` → loopback (localhost)

---

### IP Address Types

* **Local (Private) IP** → used inside your network (e.g., `192.168.x.x`)
* **Global (Public) IP** → visible on the internet

---

### DNS

DNS converts domain names into IP addresses:

* `google.com → 142.250.x.x`

---

## 2. Viewing Network Status

### Show interfaces

```bash id="n1a2bb"
ip a
```

### Show routing table

```bash id="r3c4cc"
ip r
```

### Show hostname and IP

```bash id="h5d6dd"
hostname -I
```

---

## 3. Wi-Fi (WLAN) Management

### Check Wi-Fi devices

```bash id="w1l2ee"
nmcli device
```

---

### Scan available networks

```bash id="s3c4ff"
nmcli device wifi list
```

---

### Connect to Wi-Fi

```bash id="c5n6gg"
nmcli device wifi connect "SSID" password "your_password"
```

---

### Disconnect Wi-Fi

```bash id="d7p8hh"
nmcli device disconnect wlan0
```

---

## 4. IP Address Management

### View IP details

```bash id="i1p2jj"
ip addr show
```

---

### Assign temporary IP (advanced)

```bash id="a3d4kk"
sudo ip addr add 192.168.1.50/24 dev wlan0
```

---

### Restart network interface

```bash id="r5s6ll"
sudo ip link set wlan0 down
sudo ip link set wlan0 up
```

---

## 5. Public IP & Internet Check

### Get public IP

```bash id="p7u8mm"
curl ifconfig.me
```

---

### Test connectivity

```bash id="t9v0nn"
ping google.com
```

Stop with:

* `Ctrl + C`

---

## 6. Network Services (systemd)

### Restart networking

```bash id="n2x3oo"
sudo systemctl restart NetworkManager
```

### Check status

```bash id="s4y5pp"
systemctl status NetworkManager
```

---

## 7. Firewall (firewalld in Fedora)

### Check firewall status

```bash id="f6z7qq"
sudo firewall-cmd --state
```

---

### List rules

```bash id="l8a9rr"
sudo firewall-cmd --list-all
```

---

### Allow service (e.g., SSH)

```bash id="a1b2ss"
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```

---

### Open port

```bash id="o3c4tt"
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

## 8. Network Troubleshooting Tools

### Ping (connectivity test)

```bash id="p5d6uu"
ping 8.8.8.8
```

---

### Trace route

```bash id="t7e8vv"
traceroute google.com
```

---

### Check open ports

```bash id="n9f0ww"
ss -tuln
```

---

### DNS lookup

```bash id="d1g2xx"
dig google.com
```

or:

```bash id="n3h4yy"
nslookup google.com
```

---

## 9. Network Interfaces Deep View

### Full device info

```bash id="i5j6zz"
nmcli device show
```

### Link state

```bash id="l7k8aa"
ip link
```

---

## 10. Routing Basics

### View routing table

```bash id="r9l0bb"
ip route
```

### Add default route (advanced)

```bash id="a2m3cc"
sudo ip route add default via 192.168.1.1
```

---

## 11. SSH (Remote Access)

### Connect to remote system

```bash id="s4n5dd"
ssh user@192.168.1.10
```

---

### Copy files securely

```bash id="c6o7ee"
scp file.txt user@host:/path/
```

---

## 12. Network Manager CLI (nmcli core)

### Show status

```bash id="n8p9ff"
nmcli general status
```

### Enable/disable networking

```bash id="e1q2gg"
nmcli networking on
nmcli networking off
```

---

## ⚠️ 13. Important Safety Concepts

* Disabling firewall can expose system to attacks
* Manual IP changes are temporary unless configured permanently
* Wrong routing rules can break internet access
* Always verify interface name (`wlan0`, `wlp2s0`, etc.)

---

## Mental Model

Think of networking like this:

* Interface = physical connection
* IP = address of your system
* Router = gateway to internet
* DNS = phonebook of the internet
* Firewall = security guard

---

## Core Workflow Summary

```bash id="w1x2hh"
ip a                  # check interfaces
nmcli device wifi     # list Wi-Fi
ping google.com       # test internet
curl ifconfig.me      # public IP
ss -tuln              # open ports
firewall-cmd --list-all
```

---
