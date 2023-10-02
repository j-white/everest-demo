# Quick EVerest Demos

This repository is a repackaging of several simple demos of the [EVerest](https://lfenergy.org/projects/everest/) tech stack. Our intent is to showcase the foundational layers of a charging solution that could address interoperability and reliability issues in the industry. EVerest is currently in the _early adoption_ stage of the [LF Energy Technical Project Lifecycle](https://wiki.lfenergy.org/display/HOME/Technical+Project+Lifecycle).

## What is EVerest?
[EVerest](https://lfenergy.org/projects/everest/) is a [Linux Foundation Energy](https://lfenergy.org/) project aiming to provide a modular, open-source framework and tech stack for all manner of electric vehicle chargers. This mission and architecture mean EVerest is well positioned to serve as the base for a reference implementation of a variety of standards that can drive interoperability in the eMobility space.

### Vision
The Joint Office plans to use EVerest as a baseline from which to collaboratively build reliable interoperability solutions for EV charging, including:
- reference implementations for standards driving interoperability between network actors including EVs, EVSEs, and CSMSs
- interoperability testing tools and test suites
- simulated EVs, EVSEs, etc. following interoperability best practices.

### EVerest currently supports the following standards
- EN 61851
- ISO 15118 (AC wired charging)
    - SLAC / ISO 15118-3 in C++
    - ISO 15118-2 AC
- DC DIN SPEC 70121
- OCPP 1.6J including profiles and security extensions
- Partial OCPP 2.0.1 implementation
    
### Roadmap Items in Development
- Full OCPP 2.0.1 / 2.1
- ISO 15118-20
- Robust error handling/reporting


## SETUP: access docker

- If you are a developer, you might already have docker installed on your laptop. If not, [Get Docker](https://docs.docker.com/get-docker/)
    - Check that the terminal has access to `docker` and `docker compose`
 
## EV ↔ EVSE demos

The demos in this repo showcase connectivity between one or two EVs and an EVSE.
The protocol used by the EV can be selected using a UI dropdown. The dropdown can also be used to simulate errors on the EVCC.
The use cases supported by the three demos are summarized in conceptual block diagrams below.

| Demo | Content |
| ---- |:-------:|
| **One EV ↔ EVSE (AC Simulations)** | <img src="img/one_ev_one_evse.png" width="400" height="246"> |
| **One EV ↔ EVSE (ISO 15118-2 DC)** | <img src="img/one_ev_one_evse_iso15118-2_dc.png" width="400" height="246"> |
| **Two EV ↔ EVSE** | <img src="img/two_ev_one_evse.png" width="400" height="246"> |

### STEP 1: Run the demo
- Copy and paste the command for the demo you want to see:
    - 🚨simple AC charging station ⚡: `curl -o docker-compose.yml https://raw.githubusercontent.com/US-JOET/everest-demo/main/docker-compose.yml && docker compose -p everest up`
    - 🚨 two EVSE charging ⚡: `curl -o docker-compose.yml https://raw.githubusercontent.com/US-JOET/everest-demo/main/docker-compose.two-evse.yml && docker compose -p everest-two-evse up`

### STEP 2: Interact with the demo
- Open the `nodered` flows to understand the module flows at http://127.0.0.1:1880
- Open the demo UI at http://127.0.0.1:1880/ui

| Nodered flows | Demo UI | Including simulated error |
 |-------|--------|------|
 | ![nodered flows](img/node-red-example.png) | ![demo UI](img/charging-ui.png) | ![including simulated error](img/including-simulated-error.png) |
 

### STEP 3: See the list of modules loaded and the high level message exchange
![Simple AC charging station log screenshot](img/simple_ac_charging_station.png)

### TEARDOWN: Clean up after the demo
- Kill the demo process
- Delete files and containers: `docker compose -p everest down && rm docker-compose.yml`

## High level block diagram overview of EVerest capabilities
From https://everest.github.io/nightly/general/01_framework.html
![image](https://everest.github.io/nightly/_images/quick-start-high-level-1.png)
