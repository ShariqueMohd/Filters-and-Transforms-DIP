Im = double(rgb2gray(imread('bell.jpg')));
imshow(uint8(Im));
[N, M] = size(Im);

newIm = zeros(N, M);

xc = uint8((N+1)/2)+1; yc = uint8((M+1)/2)+1;
rmax = 700; %sqrt(double((xc-1)*(xc-1) + (yc-1)*(yc-1)));
rho = 2; %refractive index

for i=1:N
    for j=1:M
        dx = i - xc; dy = j - yc;
        r = sqrt(double(dx*dx + dy*dy));
        z = sqrt(rmax*rmax - r*r);
        Bx = (1 - 1/rho) * asin(double(dx)/(sqrt(double(dx*dx + z*z))));
        By = (1 - 1/rho) * asin(double(dy)/(sqrt(double(dy*dy + z*z))));
        if(r<=rmax)
            xdash = uint16(i + z*tan(Bx));
            if xdash <= 0.0
                xdash = uint16(1);
            else
                xdash = uint16(xdash);
            end
            ydash = uint16(j + z*tan(By));
            if ydash <= 0.0
                ydash = 1;
            else
                ydash = uint16(ydash);
            end
            if xdash == 0
                xdash = 1;
            end
            if ydash == 0
                ydash = 1;
            end
            newIm(xdash,ydash) = Im(i,j);
        else
            newIm(i, j) = Im(i,j);
        end
    end
end

imshow(uint8(newIm));