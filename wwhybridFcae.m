close all
clear all
pkg load image

% two image loading
first_image_path='./trump1.png';
second_image_path='./kje1.png';

% make gray & 2float
first_image=im2double( rgb2gray( imread(first_image_path) ) );
second_image=im2double( rgb2gray( imread(second_image_path) ) );

% for LPF
sigma=6;
gaussian_dimension=3*sigma*2+1;

% HPF
first_image_high_pass_filtered=highPassFilter(first_image, gaussian_dimension);

% display
figure('Name','first_image_high_pass_filtered'), imshow(first_image_high_pass_filtered,[]);

% for HPF
sigma=1;
gaussian_dimension=3*sigma*2+1;
second_image_low_pass_filtered=lowPassFilter(second_image,gaussian_dimension);

figure('Name','second_image_low_pass_filtered'), imshow(second_image_low_pass_filtered,[]);

% add two images
final_image=second_image_low_pass_filtered+first_image_high_pass_filtered;
% display
figure('Name','second_image_low_pass_filtered'), imshow(final_image, []);
