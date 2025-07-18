> [!WARNING]
> In minecraft versions 1.21.4 and up, use `shadow_color` instead!
> ```mcfunction
> title @s actionbar [{"text":"This text has shadow "},{"text":"but this text does not :D","shadow_color":0}]
> ```
> The pack is made to still load but it won't remove shadow anymore.

# **NoShadow**
Just a simple shader to remove actionbar and title shadow

## **Overview**
By setting the **text color** to `#4e5c24` (78, 92, 36) the shadow of the text will no longer show.

This **restores the behavior** of old minecraft versions and allows you to, for example, [create custom GUIs](https://www.youtube.com/watch?v=EL2X6ppZSCQ).

The **text that is modified** by this shader is text in the actionbar, subtitle, title, chat, advancement screen and in item names and lore.

## **Usage**
A command could look like this:
```mcfunction
title @s actionbar [{"text":"This text has shadow ","color":"white"},{"text":"but this text does not :D","color":"#4e5c24"}]
```

### **Add to other resource pack**
1. Copy both overlay folders ([`psns_16_24`](psns_16_24) and [`psns_25_42`](psns_25_42)) into your resource pack next to your `assets` folder.
2. Copy the `"overlays"` section from the [`pack.mcmeta`](pack.mcmeta) into your own `pack.mcmeta`.

[**Credit** is not needed](LICENSE) but always appreciated.

---
[![PuckiSilver on GitHub](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/GitHub.png)](https://github.com/PuckiSilver)[![PuckiSilver on modrinth](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/modrinth.png)](https://modrinth.com/user/PuckiSilver)[![PuckiSilver on PlanetMinecraft](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PlanetMinecraft.png)](https://planetminecraft.com/m/PuckiSilver)[![PuckiSilver on PayPal](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PayPal.png)](https://paypal.me/puckisilver)
