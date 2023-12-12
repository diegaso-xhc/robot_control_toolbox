function ClickUp(varargin)
figData = get(varargin{1},'UserData');
set(figData.fig,'WindowButtonMotionFcn','');
figData.Fx = 0;
figData.Fy = 0;
set(varargin{1},'UserData',figData);
end
