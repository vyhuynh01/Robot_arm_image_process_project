url = 'http://192.168.1.151:8080/shot.jpg';

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
    
end
