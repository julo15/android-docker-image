attempt = 1
begin
    #puts "Attempt #{attempt}"
    success = system('adb shell setprop ro.test_harness true > /dev/null 2>&1')
    sleep 0.2
    attempt = attempt + 1
end until success


