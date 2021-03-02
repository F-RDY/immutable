return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local lib = ReplicatedStorage.lib
	local Llama = require(lib.Llama)

	local Dictionary = Llama.Dictionary
	local setIn = Dictionary.setIn
	local equalsDeep = Dictionary.equalsDeep

	it("provides shorthand for updateIn to set a single value", function()
		local m = setIn({}, { "a", "b", "c" }, "X");
		expect(equalsDeep(m, { a = { b = { c = "X" }} })).to.equal(true)
	end)

	it("returns value when setting empty path", function()
		local m = {}
		expect(setIn({}, {}, "X")).to.equal("X");
	end)

	it("can setIn nil", function()
		local m = setIn({}, { "a", "b", "c" }, nil);
		expect(equalsDeep(m, { a = { b = { c = nil }} })).to.equal(true)
	end)
end
