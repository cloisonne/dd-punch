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
	
	runApp('com.alibaba.android.rimet');
	setScreenScale(true, 720, 1280);
	mSleep(20000);
	tap(360,1200);
	setScreenScale(false)
	mSleep(20000)
	
	-- 根据像素模糊查找考勤按钮
	考勤={
	{   67,  679, 0x4da9eb},
	{   74,  680, 0xffffff},
	{   80,  680, 0x4da9eb},
	{   92,  685, 0xffffff},
	{  103,  684, 0x4da9eb},
	{  113,  682, 0xffffff},
	{  120,  681, 0x4da9eb},
	{   94,  715, 0xffffff},
	{   93,  729, 0x4da9eb},
	{   93,  652, 0x4da9eb},
}
	x,y = findMultiColorInRegionFuzzyByTable(考勤, 80, 0, 0, 719, 1279);
	if x ~= -1 and y ~= -1 then
		--os.execute("input mouse tap x y"); --对HTML tap无效
		--dialog("找到了",1);
		tap(x,y);
	else
		--os.execute("input mouse tap 90 690");
		--dialog("未找到,尝试",1);
		tap(90,690);
	end
	mSleep(10000);
	
	
	-- 根据像素模糊查找打卡按钮
	打卡={
	{  358,  836, 0x2da8ff},
	{  269,  931, 0x21a3ff},
	{  447,  934, 0x21a3ff},
	{  305,  882, 0xffffff},
	{  386,  882, 0xffffff},
	{  351,  908, 0xffffff},
	{  357,  792, 0x5cbcff},
	{  253,  900, 0x21a3ff},
	{  362, 1009, 0x2e9afc},
	{  465,  913, 0x21a3ff},
}
	x1,y1 = findMultiColorInRegionFuzzyByTable(打卡, 80, 0, 0, 719, 1279);
	if x1 ~= -1 and y1 ~= -1 then
		--os.execute("input mouse tap x1 y1");
		tap(x1,y1);
	else
		setScreenScale(true, 720, 1280);
		moveTo(360,800,360,300);
		setScreenScale(false)
		x1,y1 = findMultiColorInRegionFuzzyByTable(打卡, 80, 0, 0, 719, 1279); 
		if x1 ~= -1 and y1 ~= -1 then
			--os.execute("input mouse tap x1 y1");
			tap(x1,y1);
		else
			dialog("失败了");
			notify();
		end
	end
	
	mSleep(5000);
	closeApp('com.alibaba.android.rimet');
	mSleep(5000);
end
