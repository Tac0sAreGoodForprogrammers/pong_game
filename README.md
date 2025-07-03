## 🐍 Snake Game in Assembly

A bare-metal Snake game written entirely in x86 Assembly. No OS, just BIOS calls and raw metal. Runs directly from boot — because why not turn the MBR into a playground?

---

### ✅ Current Progress

- [x] Created `bootloader.asm` for initial boot logic.
- [x] Wrote `Makefile` to build and run using NASM + QEMU.
- [x] Initialized `snake_logic.asm` (currently empty but full of ambition).

---

### 🔧 TODO

- [ ] Implement core snake logic: movement, input, collisions.
- [ ] Improve `bootloader.asm`: better structure, maybe VGA mode.
- [ ] Add rendering code (pixel-based).
- [ ] Text-based menu
- [ ] Handle user input (arrow keys via BIOS interrupt 16h).
- [ ] Win/Lose state (or just let the snake eat itself forever).

---

### ⚙️ Planned Features

- Bootable `.img` that runs Snake instantly on real or virtual hardware.
- Classic 80x25 text-mode snake (at first).
- 🐛 Retro vibes. BIOS-driven madness.

---

### 📦 How to Build

```bash
make        # build bootloader.img
```
then run using any virtualization software 
