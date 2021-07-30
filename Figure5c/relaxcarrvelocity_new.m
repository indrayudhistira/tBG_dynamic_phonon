function Ans = relaxcarrvelocity_new(deg, degM)

e = 1.602176634e-19;
hbar = 1.0545718e-34;
const = 0.5 * 2.46 * 1e-10 * e / hbar; %373.739795

data = load('vf_Carr.dat');

deg1 = data(:, 1);
vF1 = data(:, 2) * const;

%Shift magic angle
degM0 = deg1(vF1 == min(vF1));
if nargin < 2, degM = degM0; end
deg1 = deg1 + (degM - degM0);

v0 = .8e6;
vbar1 = vF1 / v0;

Ans = interp1(deg1, vbar1, deg);