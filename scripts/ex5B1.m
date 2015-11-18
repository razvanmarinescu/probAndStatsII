function ex5B1()

proprnd = @(x) mvnrnd(x, eye(2));
startX = [0, 0];
jointLikXY(startX)
[smpl, acc] = mhsample(startX,10^5,'pdf',@jointLikXY,'proprnd',proprnd,'symmetric',true);

X = smpl(:,1);
Y = smpl(:,2);

muX = mean(X);
muY = mean(Y);

muXY = mean(X .* Y);

muXsq = mean(X .^2);

covXY = cov(X,Y);
corrXY = corr(X,Y);

R = sqrt(X.^2 + Y.^2);
muR = mean(R);

muRsq = mean(R.^2);

varX = var(X);
end


function l = jointLikXY(x)
    l = exp(-norm(x));    
end

