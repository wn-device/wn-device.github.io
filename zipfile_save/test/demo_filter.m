% 
% clear

figure_path = "sv9001t_crash_10to16bit.tif";
fig_16bit = imread("sv9001t_crash_10to16bit.tif");
fig_10bit = fig_16bit/64;
fig_info = imfinfo(figure_path);
fig_yuv = rgb2ycbcr(fig_10bit);
fig_yuv_noise = imnoise(fig_yuv,'salt & pepper',0.001);
figure;
imshow(ycbcr2rgb(fig_yuv_noise));
data = fig_yuv_noise(:,:,1);
size_data = size(data);
data_expand = zeros(size_data(1)+2,size_data(2)+2);
data_expand(2:size_data(1)+1,2:size_data(2)+1) =data;
data_expand(2:size_data(1)+1,1) = data(:,2);
data_expand(2:size_data(1)+1,size_data(2)+2) = data(:,size_data(2)-1);
data_expand(1,:) = data_expand(3,:);
data_expand(size_data(1)+2,:) = data_expand(size_data(1),:);
% a_expand = 
mean_kernel =ones(3,3);
mean_kernel_sum = 9;
Gaussian_kernel = [1;2;1]*[1,2,1];
Gaussian_kernel_sum = 16;
% mean filter
y = imfilter(data_expand,mean_kernel)/mean_kernel_sum;
mean_data_filter = y(2:size_data(1)+1,2:size_data(2)+1);
% gaussian filter
y = imfilter(data_expand,Gaussian_kernel);
Gaussian_data_filter = y(2:size_data(1)+1,2:size_data(2)+1)/Gaussian_kernel_sum;
filter_fig = fig_yuv;
filter_fig(:,:,1)= Gaussian_data_filter;
figure;
imshow(ycbcr2rgb(filter_fig));
