function varargout = Robot_Code(varargin)
% ROBOT_CODE MATLAB code for Robot_Code.fig
%      ROBOT_CODE, by itself, creates a new ROBOT_CODE or raises the existing
%      singleton*.
%
%      H = ROBOT_CODE returns the handle to a new ROBOT_CODE or the handle to
%      the existing singleton*.
%
%      ROBOT_CODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOT_CODE.M with the given input arguments.
%
%      ROBOT_CODE('Property','Value',...) creates a new ROBOT_CODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Robot_Code_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Robot_Code_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Robot_Code

% Last Modified by GUIDE v2.5 25-Nov-2023 03:22:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Robot_Code_OpeningFcn, ...
    'gui_OutputFcn',  @Robot_Code_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before Robot_Code is made visible.
function Robot_Code_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Robot_Code (see VARARGIN)

% Choose default command line output for Robot_Code
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Robot_Code_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes0);
imshow('E:\DoAnChuyenNganh\MoPhong\TDTU.jpg');

% --- Executes on button press in pushbutton0.
function pushbutton0_Callback(hObject, eventdata, handles)
url = 'http://192.168.76.53:8080/shot.jpg';

paper_width_mm = 594;
paper_height_mm = 840;

% Kích thước thực của ảnh (250.5 x 140 mm)
CR = 280; %280
CD = 155;  %155

% Kích thước ảnh trên màn hình (1920x1080 pixels)
image_width_pixels = 1920;
image_height_pixels = 1080;

% Tính tỷ lệ giữa kích thước thực và kích thước trên màn hình
width_ratio = CR / image_width_pixels;
height_ratio = CD / image_height_pixels;
a = 175; % Khoảng cách từ tâm robot tới khung ảnh theo chìu X
b = 320; % Khoảng cách từ tâm robot tới khung ảnh theo chìu Y

while true
    try
        % Đọc hình ảnh từ URL
        imagen = webread(url);

        % Hiển thị kích thước hình ảnh
        % disp(['Kích thước hình ảnh: ' num2str(size(imagen, 2)) 'x' num2str(size(imagen, 1)) ' pixels']); %2 là lấy chiều rộng,1 là chiều cao ảnh

        % Xử lý hình ảnh, xác định ngưỡng màu
        red = imagen(:,:,1);
        green = imagen(:,:,2);
        blue = imagen(:,:,3);

        % Tính toán sự khác biệt giữa các kênh màu
        diff_rg = red - green - blue;
        diff_gb = green - blue - red;
        diff_br = blue - green - red;

        % Điều chỉnh ngưỡng màu cho mỗi kênh (trong dải từ 0-255)
        threshold_red = 5;  % Ngưỡng màu cho kênh đỏ
        threshold_green = 10;  % Ngưỡng màu cho kênh xanh lá cây
        threshold_blue = 5;  % Ngưỡng màu cho kênh xanh dương

        % Tạo mask cho từng màu dựa trên ngưỡng
        red_mask = diff_rg > threshold_red;
        green_mask = diff_gb > threshold_green;
        blue_mask = diff_br > threshold_blue;

        % Reset các nhãn
        label_red = zeros(size(red_mask));
        label_green = zeros(size(green_mask));
        label_blue = zeros(size(blue_mask));

        % Sử dụng bwlabel để đánh dấu các đối tượng trong ảnh cho từng màu
        [label_red, num_red] = bwlabel(red_mask, 8);
        [label_green, num_green] = bwlabel(green_mask, 8);
        [label_blue, num_blue] = bwlabel(blue_mask, 8);

        % Sử dụng regionprops để truy xuất thuộc tính của các đối tượng cho từng màu
        stats_red = regionprops(label_red, 'Area', 'Centroid', 'Eccentricity');
        stats_green = regionprops(label_green, 'Area', 'Centroid', 'Eccentricity');
        stats_blue = regionprops(label_blue, 'Area', 'Centroid', 'Eccentricity');

        min_area_threshold = 1000;
        max_eccentricity = 0.45; % ngưỡng gần giống hình tròn

        % Hiển thị hình ảnh
        axes(handles.axes1);
        imshow(imagen);
        hold on

        % Đặt vị trí tọa độ (0, 0) trên hình ảnh
        text(20, size(imagen, 1) - 20, ['X=0.0 mm, Y=0.0 mm, (0,0)'], 'Color', 'w');

       % Khởi tạo biến ngoài các vòng lặp
X_robot_red = 0.0;
Y_robot_red = 0.0;
Color_red = NaN;

X_robot_green = 0.0;
Y_robot_green = 0.0;
Color_green = NaN;

X_robot_blue = 0.0;
Y_robot_blue = 0.0;
Color_blue = NaN;

% ...

% Đối tượng màu đỏ
found_red_object = false;
for i = 1:num_red
    if stats_red(i).Area > min_area_threshold && stats_red(i).Eccentricity < max_eccentricity
        centroid = stats_red(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_red = a - x_mm;
        Y_robot_red = b - y_mm;
        Color_red = 1.0;
        plot(centroid(1), centroid(2), 'ro', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_red, '%.1f'), ' mm, Y=', num2str(Y_robot_red, '%.1f'), ' mm, Red'], 'Color', 'r');
        found_red_object = true;
    end
end

% ...

% Đối tượng màu xanh lá cây
found_green_object = false;
for i = 1:num_green
    if stats_green(i).Area > min_area_threshold && stats_green(i).Eccentricity < max_eccentricity
        centroid = stats_green(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_green = a - x_mm;
        Y_robot_green = b - y_mm;
        Color_green = 2.0;
        plot(centroid(1), centroid(2), 'go', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_green, '%.1f'), ' mm, Y=', num2str(Y_robot_green, '%.1f'), ' mm, Green'], 'Color', 'g');
        found_green_object = true;
    end
end

% ...108 243
% 148 213

% Đối tượng màu xanh dương
found_blue_object = false;
for i = 1:num_blue
    if stats_blue(i).Area > min_area_threshold && stats_blue(i).Eccentricity < max_eccentricity
        centroid = stats_blue(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_blue = a - x_mm;
        Y_robot_blue = b - y_mm;
        Color_blue = 3.0;
        plot(centroid(1), centroid(2), 'bo', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_blue, '%.1f'), ' mm, Y=', num2str(Y_robot_blue, '%.1f'), ' mm, Blue'], 'Color', 'b');
        found_blue_object = true;
    end
end

% ...

% Sau tất cả các phát hiện màu, xác định giá trị cuối cùng
if found_red_object
    X_robot = X_robot_red;
    Y_robot = Y_robot_red;
    Color = Color_red;
elseif found_green_object
    X_robot = X_robot_green;
    Y_robot = Y_robot_green;
    Color = Color_green;
elseif found_blue_object
    X_robot = X_robot_blue;
    Y_robot = Y_robot_blue;
    Color = Color_blue;
else
    % Không có đối tượng được phát hiện
    X_robot = 0.0;
    Y_robot = 0.0;
    Color = NaN;
end

hold off
drawnow;  % Cập nhật hiển thị

    catch
        disp('Lỗi trong quá trình xử lý hình ảnh.');
    end

    set(handles.edit7,'string',num2str(X_robot));
    set(handles.edit8,'string',num2str(Y_robot));

    if (Color==1.0)
        set(handles.edit9,'string','Red');
    elseif (Color==2.0)
        set(handles.edit9,'string','Green');
    elseif (Color==3.0)
        set(handles.edit9,'string','Blue');
    else
        set(handles.edit9,'string','Error');
    end
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clc
s = serialport('COM4',9600);

theta1=0.0;
theta2=-130.0;
theta3=114.0;
SpeedX=0;
SpeedY=0;
SpeedZ=0;
count = 0;
SerialData = 0.0;
objectRemoved = 999.0;
KhoangCach=90.0;
ChieuCao=120.0;

X_robot = 0.0;
Y_robot = 0.0;

url = 'http://192.168.76.53:8080/shot.jpg';

paper_width_mm = 594;
paper_height_mm = 840;

% Kích thước thực của ảnh (250.5 x 140 mm)
CR = 280; %250.5
CD = 155;  %140

% Kích thước ảnh trên màn hình (1920x1080 pixels)
image_width_pixels = 1920;
image_height_pixels = 1080;

% Tính tỷ lệ giữa kích thước thực và kích thước trên màn hình
width_ratio = CR / image_width_pixels;
height_ratio = CD / image_height_pixels;
a = 175; % Khoảng cách từ tâm robot tới khung ảnh theo chìu X
b = 320; % Khoảng cách từ tâm robot tới khung ảnh theo chìu Y

while true
    try
        % Đọc hình ảnh từ URL
        imagen = webread(url);

        % Hiển thị kích thước hình ảnh
        % disp(['Kích thước hình ảnh: ' num2str(size(imagen, 2)) 'x' num2str(size(imagen, 1)) ' pixels']); %2 là lấy chiều rộng,1 là chiều cao ảnh

        % Xử lý hình ảnh, xác định ngưỡng màu
        red = imagen(:,:,1);
        green = imagen(:,:,2);
        blue = imagen(:,:,3);

        % Tính toán sự khác biệt giữa các kênh màu
        diff_rg = red - green - blue;
        diff_gb = green - blue - red;
        diff_br = blue - green - red;

        % Điều chỉnh ngưỡng màu cho mỗi kênh (trong dải từ 0-255)
        threshold_red = 5;  % Ngưỡng màu cho kênh đỏ
        threshold_green = 10;  % Ngưỡng màu cho kênh xanh lá cây
        threshold_blue = 5;  % Ngưỡng màu cho kênh xanh dương

        % Tạo mask cho từng màu dựa trên ngưỡng
        red_mask = diff_rg > threshold_red;
        green_mask = diff_gb > threshold_green;
        blue_mask = diff_br > threshold_blue;

        % Reset các nhãn
        label_red = zeros(size(red_mask));
        label_green = zeros(size(green_mask));
        label_blue = zeros(size(blue_mask));

        % Sử dụng bwlabel để đánh dấu các đối tượng trong ảnh cho từng màu
        [label_red, num_red] = bwlabel(red_mask, 8);
        [label_green, num_green] = bwlabel(green_mask, 8);
        [label_blue, num_blue] = bwlabel(blue_mask, 8);

        % Sử dụng regionprops để truy xuất thuộc tính của các đối tượng cho từng màu
        stats_red = regionprops(label_red, 'Area', 'Centroid', 'Eccentricity');
        stats_green = regionprops(label_green, 'Area', 'Centroid', 'Eccentricity');
        stats_blue = regionprops(label_blue, 'Area', 'Centroid', 'Eccentricity');

        min_area_threshold = 1000;
        max_eccentricity = 0.45; % ngưỡng gần giống hình tròn

        % Hiển thị hình ảnh
        axes(handles.axes1);
        imshow(imagen);
        hold on

        % Đặt vị trí tọa độ (0, 0) trên hình ảnh
        text(20, size(imagen, 1) - 20, ['X=0.0 mm, Y=0.0 mm, (0,0)'], 'Color', 'w');

        % Khởi tạo biến ngoài các vòng lặp
X_robot_red = 0.0;
Y_robot_red = 0.0;
Color_red = NaN;

X_robot_green = 0.0;
Y_robot_green = 0.0;
Color_green = NaN;

X_robot_blue = 0.0;
Y_robot_blue = 0.0;
Color_blue = NaN;

% ...

% Đối tượng màu đỏ
found_red_object = false;
for i = 1:num_red
    if stats_red(i).Area > min_area_threshold && stats_red(i).Eccentricity < max_eccentricity
        centroid = stats_red(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_red = a - x_mm;
        Y_robot_red = b - y_mm;
        Color_red = 1.0;
        plot(centroid(1), centroid(2), 'ro', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_red, '%.1f'), ' mm, Y=', num2str(Y_robot_red, '%.1f'), ' mm, Red'], 'Color', 'r');
        found_red_object = true;
    end
end

% ...

% Đối tượng màu xanh lá cây
found_green_object = false;
for i = 1:num_green
    if stats_green(i).Area > min_area_threshold && stats_green(i).Eccentricity < max_eccentricity
        centroid = stats_green(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_green = a - x_mm;
        Y_robot_green = b - y_mm;
        Color_green = 2.0;
        plot(centroid(1), centroid(2), 'go', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_green, '%.1f'), ' mm, Y=', num2str(Y_robot_green, '%.1f'), ' mm, Green'], 'Color', 'g');
        found_green_object = true;
    end
end

% ...

% Đối tượng màu xanh dương
found_blue_object = false;
for i = 1:num_blue
    if stats_blue(i).Area > min_area_threshold && stats_blue(i).Eccentricity < max_eccentricity
        centroid = stats_blue(i).Centroid;
        x_mm = centroid(1) * width_ratio;
        y_mm = CD - centroid(2) * height_ratio;
        X_robot_blue = a - x_mm;
        Y_robot_blue = b - y_mm;
        Color_blue = 3.0;
        plot(centroid(1), centroid(2), 'bo', 'MarkerSize', 10);
        text(centroid(1), centroid(2), ['X=', num2str(X_robot_blue, '%.1f'), ' mm, Y=', num2str(Y_robot_blue, '%.1f'), ' mm, Blue'], 'Color', 'b');
        found_blue_object = true;
    end
end

% ...

% Sau tất cả các phát hiện màu, xác định giá trị cuối cùng
if found_red_object
    X_robot = X_robot_red;
    Y_robot = Y_robot_red;
    Color = Color_red;
elseif found_green_object
    X_robot = X_robot_green;
    Y_robot = Y_robot_green;
    Color = Color_green;
elseif found_blue_object
    X_robot = X_robot_blue;
    Y_robot = Y_robot_blue;
    Color = Color_blue;
else
    % Không có đối tượng được phát hiện
    X_robot = 0.0;
    Y_robot = 0.0;
    Color = NaN;
end

hold off
drawnow;  % Cập nhật hiển thị

    catch
        disp('Lỗi trong quá trình xử lý hình ảnh.');
    end

    alpha_robot = 90-atand(X_robot/Y_robot);
    a_robot = KhoangCach*cosd(alpha_robot);
    b_robot = KhoangCach*sind(alpha_robot);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Px = X_robot-a_robot;
    Py = Y_robot-b_robot;
    Pz = ChieuCao;

    d1=130.2;
    a2=140.01;
    a3=140.0;

    r1 = sqrt(Px^2+Py^2);
    r2 = Pz - d1;
    r3 = sqrt(r1^2+r2^2);

    phi1 = acosd((a3^2-a2^2-r3^2)/(-2.0*a2*r3));
    phi2 = atand(r2/r1);
    phi3 = acosd((r3^2-a2^2-a3^2)/(-2.0*a2*a3));

    X_Object = atand(Py/Px);
    Y_Object = -(phi1 + phi2);
    Z_Object = 180.0 - phi3;

    set(handles.edit7,'string',num2str(X_robot));
    set(handles.edit8,'string',num2str(Y_robot));

    if (Color==1.0)
        set(handles.edit9,'string','Red');
    elseif (Color==2.0)
        set(handles.edit9,'string','Green');
    elseif (Color==3.0)
        set(handles.edit9,'string','Blue');
    else
        set(handles.edit9,'string','Error');
    end

    if (X_robot == 0.0 && Y_robot == 0.0)
        count = 1;
        fprintf(s, '%.2f\n', objectRemoved);
        pause(0.01);
        data = fscanf(s, '%s')
    else
        count = 0;
    end

    while (count==0)
        data = fscanf(s, '%s')

        
        if (strcmp(data,'HOME')||strcmp(data,'ENDHOME'))
            SerialData = 555.0;
            fprintf(s, '%.2f\n', X_Object);
            pause(0.01);
            fprintf(s, '%.2f\n', Y_Object);
            pause(0.01);
            fprintf(s, '%.2f\n', Z_Object);
            pause(0.01);
            fprintf(s, '%.2f\n', Color);
            pause(0.01);
            fprintf(s, '%.2f\n', SerialData);
            pause(2);
            count=1;
        end


        if strcmp(data,'WAIT')
            fprintf(s, '%.2f\n', 222.0);
            pause(0.01);
            count=1;
        end

        if strcmp(data,'HOME_NEW')
            theta1=0.0;
            theta2=-130.0;
            theta3=114.0;
            FK(theta1, theta2, theta3, handles);
            SetTheta123(handles, theta1, theta2, theta3);
            count=1;
        end

        if strcmp(data,'STEPX')
            data=fscanf(s, '%s')
            SpeedX=SpeedX+1;
            if (SpeedX==20)
                theta1=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedX=0;
                count=1;
            end
            if (str2double(data)==round(X_Object))
                theta1=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedX=0;
                count=1;
            end
        end

        if strcmp(data,'STEPY')
            data=fscanf(s, '%s')
            SpeedY=SpeedY+1;
            if (SpeedY==20)
                theta2=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedY=0;
                count=1;
            end
            if (str2double(data)==round(Y_Object))
                theta2=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedX=0;
                count=1;
            end
        end

        if strcmp(data,'STEPZ')
            data=fscanf(s, '%s')
            SpeedZ=SpeedZ+1;
            if (SpeedZ==20)
                theta3=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedZ=0;
                count=1;
            end
            if (str2double(data)==round(Z_Object))
                theta3=str2double(data);
                FK(theta1, theta2, theta3, handles);
                SetTheta123(handles, theta1, theta2, theta3);
                SpeedX=0;
                count=1;
            end
        end

        if strcmp(data,'END')
            theta1=0.0;
            theta2=-130.0;
            theta3=114.0;
            FK(theta1, theta2, theta3, handles);
            SetTheta123(handles, theta1, theta2, theta3);
            count = 1;
            SerialData = 0.0;
            pause(10);
        end
        

        if strcmp(data,'Gripper')
            count=1;
        end
    end
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% clc;
% clear;
close all;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
Home(handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
theta1=str2double(get(handles.edit1,'string'));
theta2=str2double(get(handles.edit2,'string'));
theta3=str2double(get(handles.edit3,'string'));

FK(theta1, theta2, theta3, handles);
SetTheta123(handles, theta1, theta2, theta3);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
Px=str2double(get(handles.edit4,'string'));
Py=str2double(get(handles.edit5,'string'));
Pz=str2double(get(handles.edit6,'string'));

IK(Px, Py, Pz, handles);
SetPxyz(handles, Px, Py, Pz);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
SliderFK(handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
SliderFK(handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
SliderFK(handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
SliderIK(handles);

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
SliderIK(handles);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
SliderIK(handles);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit6_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function SetPxyz(handles, Px, Py, Pz)
set(handles.slider4,'value',Px);
set(handles.slider5,'value',Py);
set(handles.slider6,'value',Pz);
set(handles.edit4,'string',num2str(Px));
set(handles.edit5,'string',num2str(Py));
set(handles.edit6,'string',num2str(Pz));


function SetTheta123(handles, theta1, theta2, theta3)
set(handles.slider1,'value',theta1);
set(handles.slider2,'value',theta2);
set(handles.slider3,'value',theta3);
set(handles.edit1,'string',num2str(theta1));
set(handles.edit2,'string',num2str(theta2));
set(handles.edit3,'string',num2str(theta3));

theta1T=theta1*pi/180.0;
theta2T=theta2*pi/180.0;
theta3T=theta3*pi/180.0;

L(1) = Link([theta1T,130.2,2.83,-pi/2,0.0]);
L(2) = Link([theta2T,-1.25,140.01,0.0]);
L(3) = Link([theta3T,0.75,140,0.0]);

axes(handles.axes2);
RobotArm = SerialLink(L);
RobotArm.name = 'RobotArm';
RobotArm.plot([theta1T, theta2T, theta3T]);

ModelName = 'RobotArm_MoPhong';

theta1S=-theta1-90.0;
theta2S=theta2;
theta3S=theta3;

set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1S));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2S));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3S));


function FK(theta1, theta2, theta3, handles)
a1=2.83;      alpha1=-90.0;    d1=130.2;
a2=140.01;    alpha2=0.0;      d2=-1.25;
a3=140.0;     alpha3=0.0;      d3=0.75;

T10=[
    cosd(theta1)   -cosd(alpha1)*sind(theta1)    sind(alpha1)*sind(theta1)   a1*cosd(theta1)
    sind(theta1)    cosd(alpha1)*cosd(theta1)   -sind(alpha1)*cosd(theta1)   a1*sind(theta1)
    0.0               sind(alpha1)               cosd(alpha1)                  d1
    0.0                   0.0                           0.0                    1.0
    ];

T21=[
    cosd(theta2)   -cosd(alpha2)*sind(theta2)    sind(alpha2)*sind(theta2)   a2*cosd(theta2)
    sind(theta2)    cosd(alpha2)*cosd(theta2)   -sind(alpha2)*cosd(theta2)   a2*sind(theta2)
    0.0               sind(alpha2)                 cosd(alpha2)                d2
    0.0                   0.0                           0.0                    1.0
    ];

T32=[
    cosd(theta3)   -cosd(alpha3)*sind(theta3)    sind(alpha3)*sind(theta3)   a3*cosd(theta3)
    sind(theta3)    cosd(alpha3)*cosd(theta3)   -sind(alpha3)*cosd(theta3)   a3*sind(theta3)
    0.0               sind(alpha3)                 cosd(alpha3)                d3
    0.0                   0.0                           0.0                    1.0
    ];
T=T10*T21*T32;

Px=T(1,4);
Py=T(2,4);
Pz=T(3,4);

SetPxyz(handles, Px, Py, Pz);


function IK(Px, Py, Pz, handles)
d1=130.2;
a2=140.01;
a3=140.0;

r1 = sqrt(Px^2+Py^2);
r2 = Pz - d1;
r3 = sqrt(r1^2+r2^2);

phi1 = acosd((a3^2-a2^2-r3^2)/(-2.0*a2*r3));
phi2 = atand(r2/r1);
phi3 = acosd((r3^2-a2^2-a3^2)/(-2.0*a2*a3));

theta1 = atand(Py/Px);
theta2 = -(phi1 + phi2);
theta3 = 180.0 - phi3;
SetTheta123(handles, theta1, theta2, theta3);


function SliderFK(handles)
theta1=get(handles.slider1,'value');
theta2=get(handles.slider2,'value');
theta3=get(handles.slider3,'value');

FK(theta1, theta2, theta3, handles);
SetTheta123(handles, theta1, theta2, theta3);


function SliderIK(handles)
Px=get(handles.slider4,'value');
Py=get(handles.slider5,'value');
Pz=get(handles.slider6,'value');

IK(Px, Py, Pz, handles);
SetPxyz(handles, Px, Py, Pz);


function Home(handles)
theta1=0.0;
theta2=-130.0;
theta3=114.0;

FK(theta1, theta2, theta3, handles);
SetTheta123(handles, theta1, theta2, theta3);












