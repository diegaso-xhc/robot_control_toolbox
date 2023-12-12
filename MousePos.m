function MousePos(varargin)
figData = get(varargin{1},'UserData');

mousePos = get(figData.simArea,'CurrentPoint');
if figData.tarControl
    figData.xtarget = mousePos(1,1);
    figData.ytarget = mousePos(1,2);
else
    figData.Fx = 20*(mousePos(1,1)-figData.xend);
    figData.Fy = 20*(mousePos(1,2)-figData.yend);
end
set(varargin{1},'UserData',figData);
end