# Gravity Lab

![Gravity Lab running in Roblox](./Captura%20de%20tela%202026-09-23%20101925.png)

Gravity Lab is my first study project in **Luau** and **Roblox Studio**. The goal is to turn a simple physics concept into an interactive simulation while learning the fundamentals of Roblox development.

The prototype simulates free fall and lets the player compare three gravitational accelerations:

- Earth: 9.81
- Moon: 1.62
- Mars: 3.71

During the simulation, the interface displays the selected celestial body, gravity, elapsed time, height and velocity in real time.

## What I practiced

This project was built as an introductory learning exercise. Its focus is the programming and physics logic rather than visual polish.

Concepts explored include:

- Luau variables, functions and conditionals
- numerical time-stepping for free fall
- frame-independent updates using `deltaTime`
- `RunService.Heartbeat`
- Roblox GUI elements
- client/server separation
- communication with `RemoteEvent`
- basic simulation state management

## Physics

The simulation updates velocity from gravitational acceleration and then uses velocity to update vertical position:

```text
velocity = velocity - gravity * deltaTime
height   = height + velocity * deltaTime
```

This is a simple numerical integration approach intended for learning and visualization rather than a high-precision physics model.

> Note: the prototype labels the displayed quantities using SI-style units for educational readability. Roblox positions are measured in studs, so the simulation should be understood as a simplified model rather than a calibrated real-world scale.

## Project structure

```text
src/
├── Gravidade.server.lua
└── Interface.client.lua
```

- **Gravidade.server.lua** — controls the simulation, gravity selection and server-side state.
- **Interface.client.lua** — handles the GUI, player input and real-time display.

## Status

**Learning prototype / v1**

The current version intentionally keeps the presentation simple. Future iterations may improve the visual environment, interface and simulation options as I continue learning Luau and Roblox Studio.
