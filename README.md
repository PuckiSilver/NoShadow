# **NoShadow**
Just a simple shader to remove actionbar and title shadow

## **Overview**
By setting the **text color** to `#4e5c24` (78, 92, 36) the shadow of the text will no longer show.

This **restores the behavior** of old minecraft versions and allows you to, for example, [create custom GUIs](https://www.youtube.com/watch?v=EL2X6ppZSCQ).

The **only text that is modified** by this shader is text in the `actionbar`, `title` or `subtitle`.

## **Usage**
A command could look like this:
```mcfunction
title @s actionbar [{"text":"This text has shadow ","color":"white"},{"text":"but this text does not :D","color":"#4e5c24"}]
```

Feel free to take the [shader file](assets/minecraft/shaders/core/rendertype_text.vsh) and drop it into **your resource pack**.

[**Credit** is not needed](LICENSE) but always appreciated.

---
Check me out on other platforms:

[<img src="https://docs.modrinth.com/img/logo.svg" height="40" width="40"/>](https://modrinth.com/user/PuckiSilver)
[<img src="https://www.planetminecraft.com/images/layout/favicon-64.png" height="40" width="40"/>](https://www.planetminecraft.com/member/puckisilver)
