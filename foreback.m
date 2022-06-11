clc;
clear;
close all;

img = imread('anjing.jpg');
%figure, imshow(img);

Gray=rgb2gray(img);
%figure, imshow(Gray);

bw = im2bw(Gray,.99);
%figure,imshow(bw);

bw=imcomplement(bw);
%figure,imshow(bw);

bw=imfill(bw,'holes');
bw=bwareaopen(bw,100);
str=strel('disk',5);
bw=imerode(bw,str);
%figure,imshow(bw);

img2=imread('biru.jpg');
%figure, imshow(img2);

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

R2=img2(:,:,1);
G2=img2(:,:,2);
B2=img2(:,:,3);

R2(bw) = R(bw);
G2(bw) = G(bw);
B2(bw) = B(bw);

RGB = cat(3,R2,G2,B2);
%figure, imshow(RGB);

subplot(1,3,1),imshow(img),title('Citra Objek');
subplot(1,3,2),imshow(img2),title('Citra Background');
subplot(1,3,3),imshow(RGB),title('Citra Gabungan');