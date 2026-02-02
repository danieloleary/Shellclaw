# 🏯 COBRACLAW DOJO ARCHITECTURE

# @qmd:category=documentation
# @qmd:priority=high

---

## Dojo Terminology Mapping

| Old Term | Dojo Term | Description |
|----------|-----------|-------------|
| Agent | **Student / Champion** | The AI entity being trained |
| Controller | **Sensei** | The guiding system |
| Skills | **Katas** | Practice routines, learned behaviors |
| Tools | **Weapons** | Available capabilities |
| Memory | **Scrolls** | Knowledge persistence |
| Config | **Creed** | The dojo rules |
| Server | **Dojo** | The training ground |
| Client | **Warrior** | The user interface |
| Session | **Training Session** | Active interaction period |
| Prompt | **Sutras** | Guiding instructions |
| Response | **Strikes** | Outputs, actions taken |
| Error | **Defeat** | Something went wrong |
| Success | **Victory** | Goal achieved |

---

## Directory Structure

```
cobraclaw/
├── katas/           ← Skills renamed to Katas
│   └── [kata-name]/
├── dojo/            ← Server files
├── scrolls/         ← Memory/persistence
├── creed.yaml       ← Configuration
├── weapons/         ← Tools
└── ralph.sh         ← Training loop script
```

---

## Core Components

### The Sensei (Controller)
The Sensei guides the Student through their training. It:
- Evaluates Student performance
- Assigns Katas to practice
- Provides feedback (merciless or gentle)
- Maintains the Creed

### The Student (Agent)
The Student is the AI being trained. It:
- Receives Sutras (prompts)
- Executes Katas (skills)
- Records victories and defeats
- Evolves through practice

### The Creed (Config)
```yaml
dojo_name: "CobraClaw Dojo"
sensei_mode: "Kreese"  # Kreese | Lawrence | Silver
student:
  name: "CobraClaw"
  level: 1
kata_path: "./katas"
```

---

## Training Philosophy

1. **Strike First** - Act, don't hesitate
2. **Strike Hard** - Give maximum effort
3. **No Mercy** - Perfection is the only标准
4. **Eagle Balance** - Attack and defend with equal skill
5. **Fear Does Not Exist** - In this dojo

---

**🥋 COBRACLAW DOJO 🦀🥋**

# @qmd:tags=architecture,dojo,terminology,cobraclaw
# @qmd:version=1.0
