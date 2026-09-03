const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Two Guard Riddle - Zig Implementation\n", .{});
    try stdout.print("======================================\n\n", .{});

    const doors = [_][]const u8{ "left", "right" };
    const guard_types = [_][]const u8{ "truthful", "lying" };

    var i: usize = 0;
    while (i < 2) : (i += 1) {
        const correct_door = doors[i];

        var j: usize = 0;
        while (j < 2) : (j += 1) {
            const asked_guard = guard_types[j];
            const other_is_truthful = if (asked_guard[0] == 't') false else true;

            var other_guard_answer: []const u8 = correct_door;
            if (other_is_truthful) {
                other_guard_answer = if (correct_door[0] == 'l') "right" else "left";
            }

            var reported_answer: []const u8 = other_guard_answer;
            if (asked_guard[0] == 't') {
                reported_answer = other_guard_answer;
            } else {
                reported_answer = if (other_guard_answer[0] == 'l') "right" else "left";
            }

            const choice = if (reported_answer[0] == 'l') "right" else "left";
            const status = if (choice[0] == correct_door[0]) "CORRECT" else "WRONG";

            try stdout.print("Correct door: {s} | Asked guard: {s} | Choice: {s} | {s}\n", .{
                correct_door, asked_guard, choice, status
            });
        }
    }

    try stdout.print("\nAll scenarios completed.\n", .{});
}