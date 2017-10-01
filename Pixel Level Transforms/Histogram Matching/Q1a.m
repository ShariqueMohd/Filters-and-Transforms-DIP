im = double(rgb2gray(imread('bell.jpg')));
im2 = double(rgb2gray(imread('blur1.jpg')));

h1 = double(zeros(1,256)); lookup1 = double(zeros(1,256));
h2 = double(zeros(1,256)); lookup2 = double(zeros(1,256));

[n1, m1] = size(im);
[n2, m2] = size(im2);

d1 = double(1/(n1*m1));
d2 = double(1/(n2*m2));
for i=1:n1
    for j=1:m1
        h1(1,im(i,j)+1) = h1(1, im(i,j)+1) + d1;
    end
end

for i=1:n2
    for j=1:m2
        h2(1,im2(i,j)+1) = h2(1, im2(i,j)+1) + d2;
    end
end

sum1 = 0.0; sum2 = 0.0;
for i=1:256
    sum1 = sum1 + h1(1,i);
    sum2 = sum2 + h2(1,i);
    lookup1(1,i) = double(sum1*255 + 0.5);
    lookup2(1,i) = double(sum2*255 + 0.5);
end

figure, imshow(uint8('blur1.jpg'));

