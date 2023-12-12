function KeyPress(hObject, eventdata, handles)

figData = get(hObject,'UserData');

figData.tarControl = ~figData.tarControl;

if figData.tarControl
    disp('Mouse will change the target point of the end effector.')
else
    disp('Mouse will apply a force on end effector.')
end
set(hObject,'UserData',figData);
end