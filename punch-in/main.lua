require("TSLib")

function unlock()
  flag = deviceIsLock();
  if flag ~= 0 then
    unlockDevice();
    mSleep(1000);
  end
end

function notify()
  for var = 1,3 do
    vibrator();
    mSleep(500);
  end
end

for var = 1,3 do
	
	unlock();
	
	runApp('com.txy.anywhere');
	mSleep(10000);
	runApp('com.alibaba.android.rimet');
	setScreenScale(true, 720, 1280);
	mSleep(10000);
	tap(360,1200);
	setScreenScale(false)
	mSleep(10000)
	closeApp('com.alibaba.android.rimet');
	closeApp('com.txy.anywhere');
	notify();
	mSleep(5000);
end