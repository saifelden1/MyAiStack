---
name: SAMCS
description: Smart Autonomous Metro Control System (SAMCS) Architecture, Coding Standards, RTOS Configuration, and Master ECU (C-ECU) guidelines.
---

# Smart Autonomous Metro Control System (SAMCS) - Master ECU (C-ECU) Skill

This skill governs all code development, review, and configuration tasks for the **C-ECU (Central Engine Control Unit)**—the Master ECU of the Smart Autonomous Metro Control System (SAMCS). 

---

## 1. C-ECU (Master ECU) Core Responsibilities
The C-ECU serves as the main controller coordinating all subsystems of the metro train.
- **Global Supervision & Coordination**: Coordinates train movement, station dwell times, track state arbitration, and system-wide synchronization.
- **Route & Collision Management**: Prevents collisions based on Track Section occupancy and arbitrates route access based on Track Section availability.
- **Gateway Communication**: Interfaces the embedded I2C network with the external Python Gateway via UART for telemetry sync and dashboard command reception.
- **Fault Management**: Evaluates system-wide events and faults, triggers appropriate system reactions, and manages alarm states.

---

## 2. General C Coding Rules (MISRA-C:2012 Aligned)
All embedded firmware for the SAMCS shall be deterministic and follow strict coding standards:
- **Naming Conventions**:
  - **Variables**: Lowercase, descriptive, with type-suffix recommended (e.g., `uint8_t status_u8;`, `uint16_t train_speed_u16;`, `bool door_open_b;`).
  - **Functions**: PascalCase, verb-based naming, single responsibility (e.g., `TrainControl_Update()`).
  - **Constants**: Upper case macros (e.g., `#define MAX_SPEED_U16 (250U)`) or `static const` variables with suffix (e.g., `static const uint16_t max_speed_u16 = 250U;`).
- **File Structure**: Each module must separate interface (`Module_Name.h` for public APIs) from implementation (`Module_Name.c`).
- **Variable Rules**:
  - Initialize all variables.
  - Avoid global variables. Protect shared state where global scope is unavoidable.
  - Use the smallest required integer data type (no generic `int`).
- **Function Rules**: Maximize modularity, avoid long functions, enforce low complexity, and **strictly prohibit recursion**.
- **Comments**: Focus comments on **why** the logic is written rather than *what* it does.

---

## 3. Embedded & Hardware Isolation Rules
- **Layered Architecture**: The application layer shall **never** access registers directly. Access must go through the Hardware Abstraction Layer (HAL) or Driver layer:
  `Application` -> `HAL Layer` -> `Driver Layer` -> `Hardware Register`.
- **Register Access**: Direct register access variables in drivers must use the `volatile` keyword.
- **Interrupt Service Routines (ISRs)**:
  - Keep ISRs extremely short and fast.
  - Avoid any blocking delays or heavy RTOS API calls.
  - Only write flags or post events (e.g., `flag_b = true;`).
- **Memory Safety**:
  - **Strictly prohibit dynamic memory allocation** (`malloc()`, `free()`).
  - Use only static allocation for task stacks, buffers, and queues to avoid fragmentation and ensure determinism.
- **Pointers**: Always validate pointers against `NULL` before dereferencing. Avoid pointer arithmetic.

---

## 4. RTOS Task & Timing Architecture (C-ECU)
Operating on the ATmega128 microcontroller requires highly efficient resource management:
- **Task Prioritization Hierarchy**:
  - **Fault Management Task**: Highest priority, Event-based activation.
  - **System Task**: High priority, 10ms execution period. Handles health monitoring.
  - **Communication Task**: High priority, 10ms execution period. Manages I2C bus traffic.
  - **Gateway Task**: Medium priority, 50ms period. Coordinates JSON creation and UART transmission/reception.
  - **Telemetry Task**: Low priority, 100ms period. Collects system monitoring data.
- **RTOS Execution Format**: Every task must run in an infinite loop and incorporate blocking delays (`vTaskDelay()` or `vTaskDelayUntil()`) to prevent CPU starvation.
- **Queue Configuration**: Queues must be of a fixed size, statically allocated, and use defined message structures (e.g., Event Queue, Fault Queue, Telemetry Queue).
- **Synchronization**:
  - Use Mutexes to protect shared peripherals (like the UART transceiver) and shared communication buffers.
  - Keep critical sections short and devoid of blocking calls.
  - Heartbeat checks should only run during idle periods to avoid bus congestion.

---

## 5. Safety Architecture & Criticality Domains
Firmware execution is divided into three distinct **Criticality Domains**:
1. **Safety-Critical Domain (High)**: Local train braking, collision detection, and sensor inputs. Must execute deterministically.
2. **Supervisory Domain (Medium)**: Inter-ECU coordination, route validation, and state synchronization.
3. **Background Services (Low)**: Telemetry transfer and local LCD/LED status updates.

### Safety Rules:
- **Defensive Coding**: Validate all inputs, check boundaries, and verify FSM state transitions (e.g., ensure FSM states utilize enums).
- **Watchdog Supervision**: Implement watchdog monitoring on all safety-critical tasks.
- **Validation**: Verify received messages, detect communication timeouts immediately, and reject invalid packets.

---

## 6. C-ECU Port Pin Mapping (ATmega128)
Developers must adhere to the following pin assignments for the C-ECU:

| MCU Pin | Port | Direction | Peripheral | Function |
| :--- | :--- | :--- | :--- | :--- |
| **PA0** | PORTA | Output | GPIO | Status LED |
| **PA1** | PORTA | Output | GPIO | Alarm Indicator |
| **PA2** | PORTA | Input | GPIO | Control Button |
| **PA3** | PORTA | Input | GPIO | Emergency Status |
| **PD0** | PORTD | Bidirectional | I2C (TWI) | SDA - ECU Comm (T-ECU & S-ECU Network) |
| **PD1** | PORTD | Output | I2C (TWI) | SCL - ECU Comm (T-ECU & S-ECU Network) |
| **PE0** | PORTE | Input | UART | RXD - UART Gateway (Receive Backend Data) |
| **PE1** | PORTE | Output | UART | TXD - UART Gateway (Send Telemetry) |
| **INT0** | Interrupt | Input | External | Emergency Event Interrupt |
| **INT1** | Interrupt | Input | External | Communication Event Interrupt |

*UART Configuration parameters: 115200 baud, 8 data bits, no parity, 1 stop bit.*
*Timer resources: Timer0 for system tick, Timer1 for communication timeouts, Timer2 for periodic tasks.*

---

## 7. Failure Modes & Graceful Degradation
The C-ECU coordinates system behavior during faults. All faults are classified by severity:

| Severity | Fault Mode | Detection | System Response | Graceful Degradation Behavior |
| :--- | :--- | :--- | :--- | :--- |
| **Critical** | Train ECU Timeout | Heartbeat Loss | C-ECU sends safety-hold | Affected train stops using local safety loops; others stop at nearest station. |
| **Critical** | Invalid Train State | State Checks | Emergency command | Halts affected track section and logs alert. |
| **Major** | Comm Timeout | Bus Inactivity | Local safety fallback | Affected node enters safe standby until communication resumes. |
| **Major** | Station ECU Failure | Heartbeat Loss | Station Bypass | Trains bypass the failed station; system continues operation. |
| **Major** | Backend Disconnect | UART Loss | Standalone mode | Embedded layer runs autonomously; remote web controls suspended. |
| **Minor** | Sensor Invalid Trigger | Sequence Audit | Log Warning | Invalid trigger ignored; tracking relies on next physical sensor. |
| **Minor** | Dashboard Disconnect | Socket Loss | Log Info | Telemetry suspended; train operations continue without interruption. |

### Command Priority Hierarchy:
1. **Emergency Safety Command (Highest)**
2. **Central ECU Coordination Command**
3. **Dashboard Operator Commands**
4. **Embedded Local Autonomy (Lowest)**
