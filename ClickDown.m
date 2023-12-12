function ClickDown(varargin)
figData = get(varargin{1},'UserData');
figData.Fx = 0;
figData.Fy = 0;

set(figData.fig,'WindowButtonMotionFcn',@MousePos);
set(varargin{1},'UserData',figData);
end