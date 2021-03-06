class "StringExtensions"

function string:normalizePath()
	if self == nil then
		return ""
	end
	local normalizedString = self

	normalizedString = string.gsub(normalizedString, "/", "_")
	normalizedString = string.gsub(normalizedString, "-", "_")
	return normalizedString
end

function string:getNormalizedNameFromPath()
	if self == nil then
		return ""
	end
	local normalizedString = self
	normalizedString = string.gsub(normalizedString, "-", "_")
	normalizedString = string.gsub(normalizedString, " ", "_")

	local parts = normalizedString:split("/") -- e.g. Levels/XP3_Shield/XP3_Shield
	local normalizedString = parts[#parts] -- last part

	return normalizedString
end


function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

function string:startsWith(startOfString)
	return string.sub(self, 1, string.len(startOfString)) == startOfString
end

function string:endsWith(endOfString)
	return endOfString == '' or string.sub(String, -string.len(endOfString)) == endOfString
end

function string:firstToLower()
	local str = self
	return str:sub(1,1):lower()..str:sub(2)
end

return StringExtensions