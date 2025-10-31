
player addAction [
    "METAL GEAR",
    {
        [player, ["metalGear", 100, 1]] remoteExec ["say3D", ([0, -2] select isDedicated), true];
    },
    [], // No arguments
    1.5, // Priority
    true, // Show window
    false, // Hide on use
    "", // Shortcut
    "true" // Condition (always show the action)
];