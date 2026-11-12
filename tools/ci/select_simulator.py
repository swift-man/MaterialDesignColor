"""Select a reproducible iPhone destination from `simctl list devices available -j`."""
import json
import re
import sys


def select_simulator(data):
    candidates = []
    for runtime, devices in data.get("devices", {}).items():
        match = re.search(r"\.iOS-(\d+(?:-\d+)*)", runtime)
        if not match:
            continue
        version = tuple(int(part) for part in match.group(1).split("-"))
        for device in devices:
            if device.get("isAvailable", True) and device.get("name", "").startswith("iPhone"):
                candidates.append((version, device["name"], device["udid"]))
    if not candidates:
        raise ValueError("No available iPhone simulator found; install an iOS Simulator runtime in Xcode.")
    return max(candidates)[2]


if __name__ == "__main__":
    try:
        print(select_simulator(json.load(sys.stdin)))
    except (ValueError, KeyError, TypeError) as error:
        sys.exit(f"Simulator selection failed: {error}")
