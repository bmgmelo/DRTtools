function [fitresult, gof] = GaussianFit2(xgaussian, ygaussian, x, y)
%CREATEFIT1(XGAUSSIAN,YGAUSSIAN)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : xgaussian
%      Y Output: ygaussian
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 26-Jan-2020 17:03:29


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( xgaussian, ygaussian );

% Set up fittype and options.
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
%opts.Display = 'Off';
%opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
%opts.StartPoint = [3060.93926704382 -5.37577255871446 0.10986494439751 2270.54827445882 -5.56118665018541 0.160621515054918];
opts.StartPoint = [x(1) y(1) 0.1 x(2) y(2) 0.1];
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'ygaussian vs. xgaussian', 'Fit result', 'Location', 'NorthEast' );
% Label axes
xlabel('$log(\tau) \ $', 'Interpreter', 'Latex','Fontsize',14)
ylabel('$Rp.G(\tau) \ [\Omega$]','Interpreter', 'Latex','Fontsize',14);
grid on


