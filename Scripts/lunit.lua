
--[[--------------------------------------------------------------------------

    This file is part of lunit 0.5.

    For Details about lunit look at: http://www.mroth.net/lunit/

    Author: Michael Roth <mroth@nessie.de>

    Copyright (c) 2004, 2006-2009 Michael Roth <mroth@nessie.de>

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation
    files (the "Software"), to deal in the Software without restriction,
    including without limitation the rights to use, copy, modify, merge,
    publish, distribute, sublicense, and/or sell copies of the Software,
    and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]--------------------------------------------------------------------------
local orig_assert     = assert

local pairs           = pairs
local ipairs          = ipairs
local next            = next
local type            = type
local error           = error
local tostring        = tostring

local string_sub      = string.sub
local string_format   = string.format

-- Addon Initialize
IGAS:NewAddon("Cube.lUnit")

local lunit = _M

local typenames = { "nil", "boolean", "number", "string", "table", "function", "thread", "userdata" }

-- Type check functions
for _, typename in ipairs(typenames) do
  lunit["is_"..typename] = function(x)
    return type(x) == typename
  end
end

local function mypcall(func)
    orig_assert( is_function(func) )
    local ok, errobj = pcall(func)
    if not ok then
      return errobj
    end
end

local function failure(name, usermsg, defaultmsg, ...)
	local msg = usermsg or string_format(defaultmsg,...)
  error("[assert fail]"..msg, 3)
end

local function format_arg(arg)
  local argtype = type(arg)
  if argtype == "string" then
    return "'"..arg.."'"
  elseif argtype == "number" or argtype == "boolean" or argtype == "nil" then
    return tostring(arg)
  else
    return "["..tostring(arg).."]"
  end
end

function fail(msg)
  failure( "fail", msg, "failure" )
end

function assert(assertion, msg)
  if not assertion then
    failure( "assert", msg, "assertion failed" )
  end
  return assertion
end

function assert_true(actual, msg)
  local actualtype = type(actual)
  if actualtype ~= "boolean" then
    failure( "assert_true", msg, "true expected but was a "..actualtype )
  end
  if actual ~= true then
    failure( "assert_true", msg, "true expected but was false" )
  end
  return actual
end

function assert_false(actual, msg)
  local actualtype = type(actual)
  if actualtype ~= "boolean" then
    failure( "assert_false", msg, "false expected but was a "..actualtype )
  end
  if actual ~= false then
    failure( "assert_false", msg, "false expected but was true" )
  end
  return actual
end

function assert_equal(expected, actual, msg)
  if expected ~= actual then
    failure( "assert_equal", msg, "expected %s but was %s", format_arg(expected), format_arg(actual) )
  end
  return actual
end

function assert_not_equal(unexpected, actual, msg)
  if unexpected == actual then
    failure( "assert_not_equal", msg, "%s not expected but was one", format_arg(unexpected) )
  end
  return actual
end

function assert_match(pattern, actual, msg)
  local patterntype = type(pattern)
  if patterntype ~= "string" then
    failure( "assert_match", msg, "expected the pattern as a string but was a "..patterntype )
  end
  local actualtype = type(actual)
  if actualtype ~= "string" then
    failure( "assert_match", msg, "expected a string to match pattern '%s' but was a %s", pattern, actualtype )
  end
  if not string.find(actual, pattern) then
    failure( "assert_match", msg, "expected '%s' to match pattern '%s' but doesn't", actual, pattern )
  end
  return actual
end

function assert_not_match(pattern, actual, msg)
  local patterntype = type(pattern)
  if patterntype ~= "string" then
    failure( "assert_not_match", msg, "expected the pattern as a string but was a "..patterntype )
  end
  local actualtype = type(actual)
  if actualtype ~= "string" then
    failure( "assert_not_match", msg, "expected a string to not match pattern '%s' but was a %s", pattern, actualtype )
  end
  if string.find(actual, pattern) then
    failure( "assert_not_match", msg, "expected '%s' to not match pattern '%s' but it does", actual, pattern )
  end
  return actual
end

function assert_error(msg, func)
  if func == nil then
    func, msg = msg, nil
  end
  local functype = type(func)
  if functype ~= "function" then
    failure( "assert_error", msg, "expected a function as last argument but was a "..functype )
  end
  local ok, errmsg = pcall(func)
  if ok then
    failure( "assert_error", msg, "error expected but no error occurred" )
  end
end

function assert_error_match(msg, pattern, func)
  if func == nil then
    msg, pattern, func = nil, msg, pattern
  end
  local patterntype = type(pattern)
  if patterntype ~= "string" then
    failure( "assert_error_match", msg, "expected the pattern as a string but was a "..patterntype )
  end
  local functype = type(func)
  if functype ~= "function" then
    failure( "assert_error_match", msg, "expected a function as last argument but was a "..functype )
  end
  local ok, errmsg = pcall(func)
  if ok then
    failure( "assert_error_match", msg, "error expected but no error occurred" )
  end
  local errmsgtype = type(errmsg)
  if errmsgtype ~= "string" then
    failure( "assert_error_match", msg, "error as string expected but was a "..errmsgtype )
  end
  if not string.find(errmsg, pattern) then
    failure( "assert_error_match", msg, "expected error '%s' to match pattern '%s' but doesn't", errmsg, pattern )
  end
end

function assert_pass(msg, func)
  if func == nil then
    func, msg = msg, nil
  end
  local functype = type(func)
  if functype ~= "function" then
    failure( "assert_pass", msg, "expected a function as last argument but was a %s", functype )
  end
  local ok, errmsg = pcall(func)
  if not ok then
    failure( "assert_pass", msg, "no error expected but error was: '%s'", errmsg )
  end
end

-- lunit.assert_typename functions
for _, typename in ipairs(typenames) do
  local assert_typename = "assert_"..typename
  lunit[assert_typename] = function(actual, msg)
    local actualtype = type(actual)
    if actualtype ~= typename then
      failure( assert_typename, msg, typename.." expected but was a "..actualtype )
    end
    return actual
  end
end

-- lunit.assert_not_typename functions
for _, typename in ipairs(typenames) do
  local assert_not_typename = "assert_not_"..typename
  lunit[assert_not_typename] = function(actual, msg)
    if type(actual) == typename then
      failure( assert_not_typename, msg, typename.." not expected but was one" )
    end
  end
end

local function key_iter(t, k)
    return (next(t,k))
end

local TestMdl
local ReportMsg = {}

-- Finds a function in a testcase case insensitive
local function findfuncname(name)
	for key, value in pairs(TestMdl) do
	  if is_string(key) and is_function(value) and string.lower(key) == name then
		return key
	  end
	end
end

local function setupname()
	return findfuncname("setup")
end

local function teardownname()
	return findfuncname("teardown")
end

-- Iterator over all test names in a testcase.
-- Have to collect the names first in case one of the test
-- functions creates a new global and throws off the iteration.
local function tests()
	local testnames = {}
	for key, value in pairs(TestMdl) do
	  if is_string(key) and is_function(value) then
		local lfn = string.lower(key)
		if string.sub(lfn, 1, 4) == "test" or string.sub(lfn, -4) == "test" then
		  testnames[key] = true
		end
	  end
	end
	return key_iter, testnames, nil
end

local testFunc = ""

local function callit(context, func)
	if func then
	  local err = mypcall(func)
	  if err then
		if strfind(err, "[assert fail]") then
			tinsert(ReportMsg[testFunc], err)
		else
			tinsert(ReportMsg[testFunc], GetErrMsg(err))
		end
		return false
	  end
	end
	return true
end

local function runtest(testname)
	orig_assert( is_string(testname) )

	testFunc = testname

	ReportMsg[testFunc] = {}

	local setup       = TestMdl[setupname(tcname)]
	local test        = TestMdl[testname]
	local teardown    = TestMdl[teardownname(tcname)]

	local setup_ok    =              callit( "setup", setup )
	local test_ok     = setup_ok and callit( "test", test )
	local teardown_ok = setup_ok and callit( "teardown", teardown )

	if setup_ok and test_ok and teardown_ok then
	end
end

function Run(code)
	-- Clear
	for key in pairs(TestMdl) do
		if key ~= "_M" or key ~= "_Name" then
			TestMdl[key] = nil
		end
	end
	wipe(ReportMsg)

	local func, err, status

	func, err = loadstring(code)

	if func then
		setfenv(func, TestMdl)

		status, err = pcall(func)

		if not status then
			return GetErrMsg(err)
		end

		for testname in tests() do
		  runtest(testname)
		end
	end

	return ReportMsg
end

TestMdl = _M:NewModule("TestCase")