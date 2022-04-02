local options = {
  hello = true,
  test = nil,
  another = {
    please = nil
  },
  and_another = nil,
}

local function test_func(opts)
  local a = 1 + 1
  print(a, opts)
  print('whatever')
end

test_func(options)
