local function switchMonitor()
  -- DP1 is 15
  -- USB-C is 27
  --
  -- See:
  --   https://github.com/kfix/ddcctl#input-sources
  --   https://github.com/kfix/ddcctl/issues/76
  inputNumber = 15

  if hs.host.localizedName() == "sorny" then
    inputNumber = 27
  end

  binary = os.getenv("HOME") .. "/.nix-profile/bin/ddcctl"
  hs.execute(binary .. " -d 1 -i " .. inputNumber)
end

hyperSwitcher:bind('m'):toFunction("Switch monitor input", switchMonitor)
