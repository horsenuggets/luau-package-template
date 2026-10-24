#!/usr/bin/env -S lune run

--[[

RunTests

Executes all test suites and exits with appropriate status code.

--]]

local Testable = require("@devpackages/Testable")
local process = require("@lune/process")

Testable.configure({
	Coverage = true,
	CoverageThreshold = 0,
	CoverageRoots = project.Source,
})

local function runTests()
	local _, passed = Testable.run(project.Tests)
	process.exit(if passed then 0 else 1)
end

runTests()
